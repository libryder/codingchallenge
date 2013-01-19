class UserLevel
  include Math

  attr_reader :user
  attr_accessor :level, :points

  def initialize(user)
    @user = user
    @points = 0
    calculate_base_level
  end

private

  def calculate_base_level
    base_level = Math.log(experience_points * Math.sqrt(experience_points), 2).floor
  end

  def experience_points
    self.points += user.solutions.count * 2
    self.points += user.solutions.valid.count * 4
  end
end