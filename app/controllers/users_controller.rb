class UsersController < ApplicationController
  before_filter :authenticate_admin_user!, only: [:update, :new, :destroy]
  before_filter :authenticate_user_for_edit!, only: :edit
  inherit_resources

private

  def authenticate_user_for_edit!
    user = User.find params[:id]

    unless can?(:manage, user)
      redirect_to '/users/sign_in', error: "Insufficient access."
    end
  end
end