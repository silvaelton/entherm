class GeneralProfilesController < ApplicationController
	helper  ::UserHelper
  include ::UserHelper
  include Pundit

  before_action :user_authenticate!

  helper_method :current_user

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if params[:user][:encrypted_password].to_s.empty?
      params[:user].delete :encrypted_password
    end
    if @user.update(set_params)
      flash[:success] =  t :success
      redirect_to action: :edit
    else
      render action: :edit
    end
  end

  private

  private 

  def user_authenticate!
    if session[:user_id].nil?
      redirect_to '/geral' if controller_name != 'general_se'
    end
  end
  
  def set_params
		params.require(:user).permit(:email, :encrypted_password, :edit_form, :current_password)
	end
end