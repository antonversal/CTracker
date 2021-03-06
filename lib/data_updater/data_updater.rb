require 'savon'
require 'nokogiri'

class DataUpdater
  def initialize
    @client = Savon.client(wsdl: "http://www.webservicex.net/country.asmx?WSDL")
  end

  def update
    response = @client.call(:get_currencies)
    return nil if response.nil?
    result = response.to_hash[:get_currencies_response][:get_currencies_result]
    doc = Nokogiri::XML::Document.parse(result)
    ActiveRecord::Base.transaction do
      doc.css('Table').each { |table| update_one(table) }
    end
  end

  def update_one(table)
    code, currency_code, currency_name, name = extract_data(table)
    country = Country.create_with({name: name}).find_or_create_by(code: code)
    if country.valid?
      currency = Currency.create_with({name: currency_name, country: country}).\
                 find_or_create_by(code: currency_code)
      if currency.invalid?
        Rails.logger.warn("Error when create currency: #{currency.errors.full_messages.join(", ")}. Row: #{table.to_s}")
      end
    else
      Rails.logger.warn("Error when create country: #{country.errors.full_messages.join(", ")}. Row: #{table.to_s}")
    end
  end

  def extract_data(table)
    code = table.css('CountryCode').text
    name = table.css('Name').text
    currency_code = table.css('CurrencyCode').text
    currency_name = table.css('Currency').text
    return code, currency_code, currency_name, name
  end
end