# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  has_many :user_countries
  has_many :countries, through: :user_countries
  # Delegates
  delegate :country_progress, :currency_progress, to: :user_countries
  # Validations: presence > by type > validates

  # Other properties (e.g. accepts_nested_attributes_for)

  # Model dictionaries, state machine

  # Scopes
  class << self

  end

  # Other model methods
  def visited_countries_count
    countries.count
  end

  def not_visited_countries_count
    Country.count - visited_countries_count
  end

  def collected_currencies_count
    countries.where(countries: {id: Currency.select(:country_id)}).count
  end

  def not_collected_currencies_count
    Currency.count - collected_currencies_count
  end
  # Private methods (for example: custom validators)

end
