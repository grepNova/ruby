require_relative 'PicoPlaca'

p = PicoPlaca.new

######## DRIVE WARNING ###########
p.plate="PCG-3330"
p.dateS="2016-10-07"

p.time= "16:30"
puts p.message

p.time= "07:30"
puts p.message

p.time= "09:45"
puts p.message

p.time= "15:59"
puts p.message

######## OK ALL DAY #########
p.plate="PCG-3330"
p.dateS="2016-10-05"

p.time= "16:30"
puts p.message

p.time= "07:30"
puts p.message

p.time= "09:45"
puts p.message

p.time= "15:59"
puts p.message