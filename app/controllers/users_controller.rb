class UsersController < ApplicationController
  before_filter :authenticate_admin_user!, only: [:update, :new, :destroy]
  before_filter :authenticate_user_for_edit!, only: :edit
  inherit_resources

private

  def authenticate_user_for_edit!
    unless can?(:manage, current_user)
      authenticate_admin_user!
    end
  end
end