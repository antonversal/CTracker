# encoding: utf-8
class UserCountry < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many

  belongs_to :country
  belongs_to :user

  # Delegates

  # Validations: presence > by type > validates
  validates_presence_of :country_id, :user_id, :country, :user
  # Other properties (e.g. accepts_nested_attributes_for)

  # Model dictionaries, state machine

  # Scopes
  class << self

  end

  # Other model methods

  # Creates object for given country_ids and user
  # Returns array with country_ids and created status:
  #    [{1234 => {status: :created}},
  #     {789 => {status: :error, errors: {country_id: ["can't be blank"]}}}]
  def self.batch_create(country_ids, user)
    attr_array = country_ids.map{|id| {country_id: id}}
    self.create(attr_array) do |uc|
      uc.user = user
    end.map do |uc|
      {uc.country_id => uc.valid? ? {status: :created} : {status: :error, errors: uc.errors.messages}}
    end
  end

  # Destroy all projects for given country ids
  # Returns array with country_ids and destroyed status:
  #   [{1234 => {status: :destroyed}}]
  #
  # There is option to return errors but current model cant return errors
  def self.batch_destroy(country_ids)
    self.where(country_id: country_ids).map do |uc|
      {uc.country_id => uc.destroy ?  {status: :destroyed} : {status: :error, errors: uc.errors.messages}}
    end
  end
  # Private methods (for example: custom validators)

end
