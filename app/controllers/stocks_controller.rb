class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        # render json: @stock
        render 'users/portifolio'
      else
        flash[:alert] = "Please enter a valid stock ticker"
        redirect_to portifolio_path  
      end
    else
      flash[:alert] = "Please enter a valid stock ticker"
      redirect_to portifolio_path
    end
  end
  
end