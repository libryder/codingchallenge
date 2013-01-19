class UserLevel
  include Math

  attr_reader :user
  attr_accessor :level, :points

  def initialize(user)
    @user = user
    @points = 1
    calculate_base_level
  end

private

  def calculate_base_level
    level = Math.log(experience_points + Math.sqrt(experience_points)).floor
    if level > 0
      self.level = level
    else
      self.level = 1
    end
  end

  def experience_points
    self.points += user.solutions.count * 5
    self.points += user.solutions.valid.count * 15
    self.points += user.up_vote_count * 6
  end
end