require 'date'
require 'time'


class PicoPlaca
  
  attr_accessor :plate
  attr_accessor :dateS
  attr_accessor :time
  attr_accessor :isOK
  
  #Morning
  attr_accessor :startM
  attr_accessor :finishM
  
  #Night
  attr_accessor :startN
  attr_accessor :finishN
  
  def initialize(plate = "PCG-3512", dateS = "2016-10-06", time = "17:00", sm= "07:00", fm= "09:30", sn= "16:00", fn= "19:30")
    @plate = plate
    @dateS = dateS
    @time = time
    
    @startM = sm
    @finishM = fm
    
    @startN = sn
    @finishN = fn
     
  end
  
  def last_digit
    @plate[-1,1].to_i
  end
  
  def weekday
    Date.parse(@dateS).strftime("%u").to_i
  end

  def dayName
    Date.parse(@dateS).strftime("%A")
  end
  
  def runMyCar    
    !(errorDay && errorH)
  end
  
  def message
    
    if errorDay 
      if errorH
        puts "It's #{dayName} #{@time} and your last digit is #{last_digit}, DO NOT drive your car"
      else
        puts "It's #{dayName} #{@time} and your last digit is #{last_digit}, you can drive your Car"  
      end
    else
      puts "It's #{dayName} and your last digit is #{last_digit}, you can drive all day"
    end
    
  end
  
  def errorDay
    if (weekday == 6 ||weekday == 7 )
      return false
    end
    ((weekday * 2) == last_digit || ((weekday * 2) - 1) == last_digit  ||  (weekday * 2).to_s[-1,1].to_i == last_digit)    
  end

  def errorH
    
    tn = Time.parse(@time) >= Time.parse(@startN) &&  Time.parse(@time) <= Time.parse(@finishN)    
    tm = Time.parse(@time) >= Time.parse(@startM) &&  Time.parse(@time) <= Time.parse(@finishM)
    return tn || tm
    
  end
  
end