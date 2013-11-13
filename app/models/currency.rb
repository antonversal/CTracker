class Currency < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :country
  has_many :user_countries, through: :country
  # Delegates

  # Validations: presence > by type > validates
  validates_presence_of :name, :code, :country_id
  validates_uniqueness_of :code
  # Other properties (e.g. accepts_nested_attributes_for)

  # Model dictionaries, state machine

  # Scopes
  class << self

  end

  # Other model methods
  def is_collected_by?(user)
    country.is_visited_by?(user)
  end
  # Private methods (for example: custom validators)

end