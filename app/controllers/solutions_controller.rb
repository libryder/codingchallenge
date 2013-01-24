class SolutionsController < ApplicationController

  before_filter :authenticate_admin_user!, only: [:update, :destroy, :edit]
  before_filter :authenticate_user!, only: [:new, :create]

  inherit_resources

  def new
    @challenge = Challenge.find params[:challenge_id]
    new!
  end

  def up_vote
    solution = Solution.find params[:solution_id]
    current_user.cast_up_vote solution
    solution.calculate_popularity!
    render json: { solution: solution, votes: solution.popularity }
  end

  def down_vote
    solution = Solution.find params[:solution_id]
    current_user.cast_down_vote solution
    render json: { solution: solution, votes: solution.popularity }
  end

  def current_vote
    solution = Solution.find params[:solution_id]
    render json: { up_voted: current_user.voted_up_on?(solution), votes: solution.popularity }
  end

protected

  def current_user
    @current_user ||= warden.authenticate(scope: :user)
  end
end
