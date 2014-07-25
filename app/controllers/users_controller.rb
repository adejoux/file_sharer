class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @users = User.order(:email).page params[:page]
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'user was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  def approve
    User.where(id: params[:approved_user_ids]).update_all({approved: true})
    disapproved_user_ids = params[:user_ids] - params[:approved_user_ids]
    User.where(id: disapproved_user_ids).update_all({approved: false})

    redirect_to users_url, notice: 'Approvals was successfully updated.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
