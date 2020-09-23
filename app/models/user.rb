# app/models/user.rb
    
class User < ActiveRecord::Base

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: {minimum: 6}

  def name=(value)
    input = value.split(" ")
    first_name = input.shift
    last_name = input.join(" ")
    self.first_name = first_name
    self.last_name = last_name
  end

  def name
    "#{first_name} #{last_name}"
  end

  def self.authenticate_with_credentials(email, password)
    @user = self.where("lower(email) = ?", email.delete(' ').downcase).first.try(:authenticate, password)
  end
end