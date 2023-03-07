class UsersController < ApplicationController
  before_action :require_admin, only: [:index, :show]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def admin
        
  end

  private
  def require_admin
    if !current_user.admin?
        flash[:alert] = "You are not the authorize user!"
        redirect_to root_path
    end
  end
end
