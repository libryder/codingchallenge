class User < ActiveRecord::Base
  acts_as_voter

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  serialize :roles, Array
  validates :username, presence: true
  has_many :solutions

  def admin?
    is?(:admin)
  end

  def is?(role)
    roles.include?(role.to_s.humanize.downcase)
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.username = auth.info.nickname
    end
  end
  
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  
  def password_required?
    super && provider.blank?
  end

  def email_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def cast_up_vote(solution)
    up_votes(solution)
    solution.calculate_popularity!
  end

  def cast_down_vote(solution)
    down_votes(solution)
    solution.calculate_popularity!
  end

  def up_vote_count
    solutions.inject(0) do |sum, s|
      sum += s.up_votes.count
    end
  end

  def profile
    UserLevel.new(self)
  end
end