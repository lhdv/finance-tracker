class UsersController < ApplicationController
  def portifolio
    @tracked_stocks = current_user.stocks
  end
end
