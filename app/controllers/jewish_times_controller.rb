class JewishTimesController < ApplicationController
    

    def index
       # user enters zipcode
       input_zip = params[:zip]


       # zipcode is converted into longitude and latitude
       lat_long = Geocoder.coordinates(input_zip)

        day = Time.now

        latitude = lat_long[0]
        longitude = lat_long[1]
        sun_times = SunTimes.new
        
        # sun_times.rise(day, latitude, longitude) 
        # sun_times.set(day, latitude, longitude) 
        z = Ziptz.new
        zones = z.time_zone_name(input_zip)
        morning = zones  + " Time " + "(US & Canada)"
        # night = zones + " Time " + "(US & Canada)"

        
        rising = sun_times.rise(day, latitude, longitude).in_time_zone(morning)

        setting = sun_times.set(day, latitude, longitude).in_time_zone(morning)

        number = [60.minutes, 52.minutes, 50.minutes, 45.minutes, 35.minutes]
        index = 0
        input_array = []
        

    5.times do

        tallis = rising - number[index]
        p tallis
        index += 1
        input_array << tallis

    end
        

        # render json: setting
        render json: input_array


    end

end
