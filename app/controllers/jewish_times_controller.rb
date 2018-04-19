class JewishTimesController < ApplicationController
    

    def index
       # user enters zipcode
       # zipcode = 60645
       input_zip = params[:zip]
       # input_date = 041518


       # zipcode is converted into longitude and latitude
       lat_long = Geocoder.coordinates(input_zip)

        # day = Time.now.strftime("%d/%m/%Y") 
        # day = Time.now
        day = 3.months.ago

        latitude = lat_long[0]
        longitude = lat_long[1]
        sun_times = SunTimes.new
        
        # sun_times.rise(day, latitude, longitude) 
        # sun_times.set(day, latitude, longitude) 
        z = Ziptz.new
        zones = z.time_zone_name(input_zip)
        morning = zones  + " Time " + "(US & Canada)"
        night = zones + " Time " + "(US & Canada)"
        
        # horizon = sun_times.rise(day, latitude, longitude).in_time_zone(morning)

        # minutes = 60

        # time = horizon - minutes

        # render json: time


        render json: sun_times.rise(day, latitude, longitude).in_time_zone(morning)

        # render json: sun_times.set(day, latitude, longitude).in_time_zone(night)


    

       #  the equation of sunrise minus 60 minutes 
       # output is sunrise and sunset with earliest times for tallis and tefillin
       # p response
       


# renders json: {message: "your times are "}
    end

end
