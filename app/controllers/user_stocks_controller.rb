class UserStocksController < ApplicationController
  def create
    stock = Stock.check_db(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)

    flash[:notice] = "Stock #{stock.name} was successfully added to your portifolio"
    redirect_to portifolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    if user_stock.destroy
      flash[:notice] = "Stock #{stock.name} was successfully removed from your portifolio"
      redirect_to portifolio_path
    end
  end
end
