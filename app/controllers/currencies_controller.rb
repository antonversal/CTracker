class CurrenciesController < ApplicationController
  # GET /currencies
  # GET /currencies.xml
  def index
    @q = Currency.includes(:country, :user_countries).search(params[:q])
    @currencies = @q.result(distinct: true)
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end
end