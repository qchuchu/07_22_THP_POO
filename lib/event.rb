require 'pry'
require 'time'

class Event
  attr_accessor :start_date
  attr_accessor :duration
  attr_accessor :title
  attr_accessor :users
  @@all_events = []

  def initialize(start_date, duration, title, attendees=[])
      @start_date = Time.parse(start_date)
      @duration = duration
      @title = title
      @attendees = attendees
      @@all_events << self
  end

  def postpone_24h
    @start_date = (@start_date + 24*60*60)
  end

  def end_date
    (@start_date + @duration * 60)
  end

  def is_past?
    @start_date < Time.now
  end

  def is_future?
    ! is_past?
  end

  def is_soon?
    if self.is_past?
      puts "The event is already passed"
      return false
    else
      (Time.now + 30 > @start_date) && self.is_future?
    end
  end

  def to_s
    puts "Titre : #{@title}"
    puts "Date de début : #{@start_date.strftime('%Y-%m-%d %H:%M')}"
    puts "Durée : #{@duration} minutes"
    puts "Invités : #{@attendees.join(', ')}"
  end

  def self.all_events
    @@all_events
  end

end
