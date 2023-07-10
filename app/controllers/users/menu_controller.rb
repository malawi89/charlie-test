class Users::MenuController < ApplicationController
  def show
    menu = CharlieMenu.call(user)

    render json: menu
  end


  private

  def user
    @user ||= User.find(params[:user_id])
  end
end
