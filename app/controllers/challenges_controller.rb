class ChallengesController < ApplicationController
  before_filter :authenticate_admin_user!, only: [:new, :destroy, :edit]
  inherit_resources
end
