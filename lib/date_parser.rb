require 'pry'
require 'date'
require 'time'

class DateParser

  def initialize(str)
    return analyze_str(str)
  end

  private

  def month_table
    {
      "lundi" => 1,
      "mardi" => 2,
      "mercredi" => 3,
      "jeudi" => 4,
      "vendredi" => 5,
      "samedi" => 6,
      "dimanche" => 7
    }
  end

  def analyze_str(str)
    str = str.rstrip.lstrip
    m = []
    if str.match?(/\w+ prochain à \d+ h/)
      m = str.match /(?<weekday>\w+) prochain à (?<hour>\d+) h/
      date = Time.now
      date += (7 - date.wday%7 + month_table[m[:weekday]]) * 24 * 60 * 60
      date = Time.new(date.year, date.month, date.day, m[:hour].to_i, 0, 0)
    elsif str.match?(/le \d+ \w+ à \d+ h/)
      m = str.match(/le (?<day>\d+) (?<month>\w+) à (?<hour>\d+) h/)
      date = Time.new(Time.now.year, month_table(m[:month]), m[:day].to_i, \
                      m[:hour].to_i, 0, 0)
    end
    binding.pry
    date
  end

end
