require 'date'
require_relative 'PicoPlaca'

month = 10
year = 2016

days = Date.new(year, month, -1).day

p = PicoPlaca.new
p.plate="PCG-3331"

Array.new(days){ |index| 
  p.dateS = "2016-#{month}-#{index + 1}".to_str
  puts  "  #{p.dayName} \t #{p.dateS} \t #{!p.errorDay ? "OK" : "WARNING"}" 
}

