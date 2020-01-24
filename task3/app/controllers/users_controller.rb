class UsersController < ApplicationController

  def edit

  end

  def index
  end

  def show
  end

  def update
  end

  private
  def user_params
    params.require(:book).permit(:name, :introduction, :profile_image)
  end
end
