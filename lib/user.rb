require 'pry'

class User
  attr_accessor :email
  attr_accessor :age
  @@all = []

  def initialize(user_email, user_age)
    @email = user_email
    @age = user_age
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_email(email_to_find)
    @@all.select { |user| user.email == email_to_find}
  end
end
