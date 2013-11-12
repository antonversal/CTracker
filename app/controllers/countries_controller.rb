class CountriesController < ApplicationController
  # GET /countries
  def index
    @q = Country.includes(:user_countries).search(params[:q])
    @countries = @q.result(distinct: true)
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end
end