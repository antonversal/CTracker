class UserCountriesController < ApplicationController
  # POST /user_countries
  def create
    @user_country = UserCountry.new(user_country_params)
    @user_country.user = current_user
    if @user_country.save
      render json: @user_country,
             status: :created,
             location: @user_country
    else
      render json: @user_country.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_countries/1
  def destroy
    @user_country = current_user.user_countries.find(params[:id])
    @user_country.destroy
    head :no_content
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_country_params
      params.require(:user_country).permit(:country_id)
    end
end
