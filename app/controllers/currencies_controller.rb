class CurrenciesController < ApplicationController
  # GET /currencies
  # GET /currencies.xml
  def index
    @currencies = Currency.includes(:country)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @currencies }
    end
  end
end