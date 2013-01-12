class SolutionsController < ApplicationController

  def index
    if params[:solution_id]
      @solutions = Solution.where(id: params[:solution_id])
    else
      @solutions = Solution.all
    end
  end
end