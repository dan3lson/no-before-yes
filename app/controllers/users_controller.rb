# frozen_string_literal: true

# UsersController
class UsersController < Clearance::UsersController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      UserMailer.with(user: @user).welcome.deliver_later if @user
      redirect_back_or onboarding_index_path
    else
      render template: 'users/new'
    end
  end

  def update
    if @user.update(user_params.except(:email))
      flash[:success] = 'User was successfully updated.'

      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'User was successfully destroyed.'

    redirect_to users_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :time_zone)
  end
end
