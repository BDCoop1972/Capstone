class JewishTimesController < ApplicationController
    

  def index
       # user enters zipcode
    input_zip = params[:zip].to_i
        
    input_date = params[:date].to_i


       # zipcode is converted into longitude and latitude
    lat_long = Geocoder.coordinates(input_zip)
        
    if params[:date]
      day = Date.parse(params[:date])
    else
      day = Date.today 
    end

    latitude = lat_long[0]
    longitude = lat_long[1]
    sun_times = SunTimes.new
        
         
    z = Ziptz.new
    zones = z.time_zone_name(input_zip)

    morning = zones + " Time " + "(US & Canada)"

        
    rising = sun_times.rise(day, latitude, longitude).in_time_zone(morning)

    setting = sun_times.set(day + 1, latitude, longitude).in_time_zone(morning)

    candle = setting - 20.minutes

    number = [60.minutes, 52.minutes, 50.minutes, 45.minutes, 35.minutes]
    index = 0
    input_array = []
        

    5.times do
      
      tallis = rising - number[index]
      p tallis
      index += 1
      input_array << tallis.strftime('%B %d, %Y %I:%M:%S')

    end

    puts "This is the time for sunrise"
    p rising

    puts "This is the time for sunset"
    p setting.strftime('%B %d, %Y %I:%M:%S')

    puts "This is the time for candle lighting"
    p candle.strftime('%B %d, %Y %I:%M:%S')
        
    render json: input_array.as_json

  end

end
