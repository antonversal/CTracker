class Country < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  has_many :currencies, dependent: :destroy
  has_many :user_countries
  has_many :users, through: :user_countries
  # Delegates

  # Validations: presence > by type > validates
  validates_presence_of :name, :code
  validates_uniqueness_of :code, :allow_blank => true
  # Other properties (e.g. accepts_nested_attributes_for)
  accepts_nested_attributes_for :currencies, :allow_destroy => true
  # Model dictionaries, state machine

  # Scopes
  class << self

  end
  # Other model methods
  def is_visited_by?(user)
    user_countries.map(&:user_id).include? user.id
  end
  # Private methods (for example: custom validators)

end