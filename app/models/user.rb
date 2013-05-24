class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :survey_takers
  has_many :surveys, :foreign_key => :creator_id
  has_many :surveys, :through => :survey_takers
  has_many :responses
  has_many :choices, :through => :responses

  include BCrypt

  def password
    @password ||= Password.new(self.password_hash)
  end
  
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.create(options={})
    @user = User.new(options)
    @user.password = options[:password]
    @user.save!
    @user
  end

  def has_password
    errors.add(:password, 'cannot be blank') if self.password == ''
  end

  def self.authenticate(params)
    @user = User.find_by_name(params[:name])
    (@user && @user.password == params[:password]) ? @user : false
  end

  def days_active
    Time.now.day - created_at.day
  end
end
