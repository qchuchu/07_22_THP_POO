require "pry"
class User
  attr_writer :mastercard #Donne uniquement writing access
  attr_reader :birthdate #Donne uniquement reading access
  attr_accessor :email #Donne les 2 accès

  def update_birthdate(birthdate_to_update)
    @birthdate = birthdate_to_update
  end

  def read_mastercard
    return @mastercard
  end

  def greet
    puts "Bonjour, monde !"
  end

  def say_hello_to_someone(first_name)
    puts "Bonjour, #{first_name}"
  end

  def show_itself
    print "Voici l'instance : "
    puts self
  end

  # def update_email(email_to_update)
  #   @email = email_to_update
  # end
  #
  # def read_email
  #   @email
  # end
end

# binding.pry
# puts "end of file"

class User_2
  attr_accessor :email
  @@user_count = 0

  def initialize(email_to_save)
    @email = email_to_save
    puts "On envoie un email de Bienvenue !!"
    @@user_count += 1
  end

  def self.count
    @@user_count
  end
end

class User_3
  attr_accessor :email

  def initialize(email_to_save)
    if check_email(email_to_save)
      @email = email_to_save
    else
      puts "ERREUR ! EMAIL FOIREUX. Recommence"
    end
  end

  private

  def check_email(email_to_save)
    email_to_save.match?(/^\w+@\w+\.\w+$/)
  end
end

binding.pry
puts "end of file"
