class SolutionsController < ApplicationController

  def index
    session[:redirect] = request.referrer
    @solutions = Solution.all
    @challenge = Challenge.find(params[:challenge_id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @solutions }
    end
  end

  def show
    @solution = Solution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @solution }
    end
  end

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @solution = Solution.new(challenge_id: params[:challenge_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @solution }
    end
  end

  def edit
    session[:redirect] = request.referrer

    @challenge = Challenge.find(params[:challenge_id])
    @solution = Solution.find(params[:id])
  end

  def create
    @solution = Solution.new(params[:solution])

    respond_to do |format|
      if @solution.save
        format.html { redirect_to challenge_solution_path(solution.challenge, solution), notice: 'Solution was successfully created.' }
        format.json { render json: @solution, status: :created, location: @solution }
      else
        format.html { render action: "new" }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @solution = Solution.find(params[:id])

    respond_to do |format|
      if @solution.update_attributes(params[:solution])
        format.html do 
          if redirect_path = session.delete(:redirect)
            redirect_to redirect_path
          else
            redirect_to @solution, notice: 'Solution was successfully updated.' 
          end
        end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy

    respond_to do |format|
      format.html { redirect_to challenge_solutions_url }
      format.json { head :no_content }
    end
  end

  def up_vote
    solution = Solution.find params[:solution_id]
    current_user.up_votes solution
    render json: { solution: solution, votes: solution.votes.count }
  end

  def down_vote
    solution = Solution.find params[:solution_id]
    current_user.down_votes solution
    render json: { solution: solution, votes: solution.votes.count }
  end

  def current_vote
    solution = Solution.find params[:solution_id]

    render json: { up_voted: current_user.voted_up_on?(solution), votes: solution.positives.size }
  end

protected

  def current_user
    @current_user ||= warden.authenticate(scope: :user)
  end
end
