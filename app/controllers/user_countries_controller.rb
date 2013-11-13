class UserCountriesController < ApplicationController
  # POST /countries/visited
  def batch_create
    created = UserCountry.batch_create(country_ids, current_user)
    render json: created.to_json,
           status: :ok
  end

  # DELETE /countries/visited
  def batch_destroy
    deleted = current_user.user_countries.batch_destroy(country_ids)
    render json: deleted.to_json,
           status: :ok
  end

  private
    # Only allow a trusted parameter "white list" through.
    def country_ids
      params.permit(country_ids: [])[:country_ids]
    end
end
