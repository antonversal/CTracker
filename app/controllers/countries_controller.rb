class CountriesController < ApplicationController
  # GET /countries
  # GET /countries.xml
  def index
    @countries = Country.includes(:user_countries)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @countries }
    end
  end
end