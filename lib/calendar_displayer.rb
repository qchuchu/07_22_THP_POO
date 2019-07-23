require 'pry'
require 'date'
require 'time'

class CalendarDisplayer
  attr_accessor :year
  attr_accessor :month
  # Take in argument the year and the month you want to display
  def initialize(year, month)
    @year = year
    @month = month
    print_calendar
  end
  # Get the number of days in the month
  def days_in_month
    Date.new(@year, @month, - 1).day
  end

  def change_month(year, month)
    @year = year
    @month = month
    create_calendar
  end

  def print_calendar
    calendar = []
    calendar << "-"*71 + "\n"
    cpt = 7
    while cpt <= (days_in_month - days_in_month%7 + 7)
      max_day = [days_in_month, cpt].min
      calendar << days_header((cpt-6)..max_day)
      ((cpt-6)..max_day).each do |day|
        calendar << "|#{event_count(Date.new(@year, @month, day))[0]}".ljust(10)
      end
      calendar << "|".ljust(10)*(cpt-max_day)
      calendar << "|\n"
      3.times do |j|
        ((cpt-6)..max_day).each do |day|
          line = title_splitter(event_count(Date.new(@year, @month, day))[1])[j]
          calendar << line
        end
        calendar << "|".ljust(10)*(cpt-max_day)
        calendar << "|\n"
      end
      cpt += 7
      calendar << "-"*71 + "\n"
    end
    print calendar.join
  end

  private

  # Return the day_header
  def days_header(range)
    header = ""
    range.each do |i|
      header = header + "|#{i}".ljust(10)
    end
    ((70-header.length)/10).times do
      header = header + '|'.ljust(10)
    end
    header = header +"|\n"
  end

  # Checks the number of event for the day
  def event_count(date)
    events = Event.all_events \
                    .select{|event| date == Date.parse(event.start_date.to_s)}
    return ["#{events.length} events", "scheduled"] if events.length > 1

    return ["",""] if events.length == 0

    [events[0].start_date.strftime('%I:%M %P'), events[0].title]
  end

  # This function will take in entry a string and will split it into multiple
  # rows. If the title is longer than 9x4 = 27 characters, we have to replace
  # The last
  def title_splitter(title)
    text = title.split(' ')
    final_disp = []
    i = 0
    while (final_disp.length < 3) && (i < text.length)
      line = []
      while (line.join(' ').length < 9) && (i < text.length)
        line << text[i]
        i += 1
      end
      if (line.join(' ').length > 9) && (line.length == 1)
        i -= 1
        text[i] = line.join(' ')[8..-1]
        line[0][-1] = "-"
      elsif (line.join(' ').length > 9) && (line.length > 1)
        i -= 1
        line.pop
      end
      final_disp << "|#{line.join(' ')}".ljust(10)
    end

    if final_disp.length < 3
      (3-final_disp.length).times do
        final_disp << "|".ljust(10)
      end
    elsif final_disp[-1][-2..-1].match?(/[\w-]+{2}/) && (i < text.length)
      final_disp[-1][-2..-1] = '..'
    end

    final_disp
  end
  # Method that will create the calendar
end
