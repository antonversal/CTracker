require 'test_helper'
require 'data_updater/data_updater'

class DataUpdaterTest < ActiveSupport::TestCase
  setup do
    result = <<-res
      <NewDataSet>
        <Table>
          <Name>Afghanistan, Islamic State of</Name>
          <CountryCode>af</CountryCode>
          <Currency>Afghani</Currency>
          <CurrencyCode>AFA</CurrencyCode>
        </Table>
      </NewDataSet>
    res
    response = { get_currencies_response:
                 { get_currencies_result: result } }
    @data_uploader = DataUpdater.new
    Savon::Client.any_instance.stubs(:call).returns(response)
  end

  test "#update adds countries" do
    @data_uploader.update
    assert_equal "Afghanistan, Islamic State of", Country.find_by!(code: "af").name
  end

  test "#update adds currency" do
    @data_uploader.update
    assert_equal "Afghani", Currency.find_by!(code: "AFA").name
  end
end