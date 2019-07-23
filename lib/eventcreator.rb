require 'pry'
require 'time'

class EventCreator

  def initialize
    @title = event_name
    @start_date = event_start_date
    @duration = event_duration
    @attendees = event_attendees
    event = event_creator(@start_date, @duration, @title, @attendees)
    event.to_s
  end

  private

  def event_name
    puts "Salut, tu veux créer un événement ? Cool !"
    puts "Commençons. Quel est le nom de l'événement ?"
    print "> "
    gets.chomp
  end

  def event_start_date
    puts "Super. Quand aura-t-il lieu ?"
    print "> "
    gets.chomp
  end

  def event_duration
    puts "Au top. Combien de temps va-t-il durer (en minutes)?"
    print "> "
    gets.chomp.to_i
  end

  def event_attendees
    puts "Génial. Qui va participer ? Balance leur e-mails"
    print "> "
    (gets.chomp.gsub(/\w+@\w+\.\w+/).to_a || [])
  end

  def event_creator(start_date, duration, title, attendees)
    puts "Super, c'est noté, ton événement a été créé !"
    Event.new(start_date, duration, title, attendees)
  end
end
