class UserLevel
  include Math

  attr_reader :user
  attr_accessor :level, :points, :progress

  def initialize(user)
    @user = user
    @points = 1
    calculate_base_level
  end

private

  def calculate_base_level
    float_level = Math.log(experience_points + Math.sqrt(experience_points))

    if float_level >= 1
      @level = float_level.floor
      @progress = ((float_level - level) * 100).round
    else
      @level = 1
      @progress = 0
    end
  end

  def experience_points
    @points += user.solutions.count * 5
    @points += user.solutions.valid.count * 15
    @points += user.up_vote_count * 6
  end
end