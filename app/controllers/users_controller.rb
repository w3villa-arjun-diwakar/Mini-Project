class UsersController < ApplicationController
  before_action :require_same_user
  before_action :require_admin, only: [:index,:admin]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def admin      
  end

  def user_policies
    @user = current_user
    @companies = @user.companies
  end

  private
  def require_same_user
    if current_user != current_user or !current_user.admin?
        flash[:alert] = "You are not the author"
        redirect_to root_path
    end
  end

  def require_admin
    if !current_user.admin?
        flash[:alert] = "You are not the authorize user!"
        redirect_to root_path
    end
  end
end
