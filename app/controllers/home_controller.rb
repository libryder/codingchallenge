class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @five_challenges }
    end
  end
end