class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        # render json: @stock
        # render 'users/portifolio'
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid stock ticker"
          format.js { render partial: 'users/result' }
          format.html { redirect_to portifolio_path }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a valid stock ticker"
        format.js { render partial: 'users/result' }
        format.html { redirect_to portifolio_path }
      end
    end
  end

end