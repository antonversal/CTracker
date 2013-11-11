class Currency < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :country
  # Delegates

  # Validations: presence > by type > validates
  validates_presence_of :name, :code, :country_id
  validates_uniqueness_of :code, allow_blank: true
  # Other properties (e.g. accepts_nested_attributes_for)

  # Model dictionaries, state machine

  # Scopes
  scope :collected,     -> {joins(:country).where(countries: {visited: true})}
  scope :not_collected, -> {joins(:country).where(countries: {visited: false})}
  class << self

  end

  # Other model methods
  def collected?
    country.visited?
  end
  # Private methods (for example: custom validators)

end