local_dir = File.expand_path('../',__FILE__)

$LOAD_PATH.unshift(local_dir)

require 'lib/user.rb'
require 'lib/event.rb'
require 'lib/eventcreator.rb'
require 'lib/calendar_displayer.rb'
require 'lib/date_parser.rb'
require 'pry'


Event.new("2019-10-04 09:00", 60, "Paella")
Event.new("2019-10-04 11:00", 60, "Tortilla")
Event.new("2019-10-06 09:00", 60, "Sandbox calendar challenge")
Event.new("2019-10-10 09:00", 60, "Post challenge to main")
Event.new("2019-10-11 10:00", 60, "Profit")
Event.new("2019-10-23 09:00", 60, "OM-PSG")
Event.new("2019-10-23 11:00", 60, "Real-Barça")
Event.new("2019-10-23 12:00", 60, "Arsenal-Chelsea")
Event.new("2019-10-27 09:00", 60, "Teq Paf Party")
Event.new("2019-10-27 12:00", 60, "Jaeger Bomb Party")
Event.new("2019-10-31 19:30", 60, "Halloween party")


binding.pry
puts "end of file"
