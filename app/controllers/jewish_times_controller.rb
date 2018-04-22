class JewishTimesController < ApplicationController
    

    def index
       # user enters zipcode
       # zipcode = 60645
       input_zip = params[:zip]
       # input_date = 041518


       # zipcode is converted into longitude and latitude
       lat_long = Geocoder.coordinates(input_zip)

        day = Time.now
        # day = 3.months.ago

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
        tallis = 0
        

        
        # earliest time for tallis and tefillin 1 hour before sunrise Rabbi Henkin
        # rising - 60.minutes
        # 52 minutes before sunrise Olat Tamid
        # rising - 52.minutes
        # 50 minutes before sunrise Olat Tamid
        # rising - 50.minutes
        # 45 minutes before sunrise Olat Tamid
        # rising - 45.minutes
        # 35 - 40 minutes before sunrise Reb Moshe
        # rising - 35.minutes


    5.times do

        tallis = rising - number[index]
        p tallis
        index += 1
        input_array << tallis

    end


    p rising
    p setting

        


        render json: input_array[0]

        # render json: rising - 60.minutes

        # render json: sun_times.set(day, latitude, longitude).in_time_zone(night)


    

       #  the equation of sunrise minus 60 minutes 
       # output is sunrise and sunset with earliest times for tallis and tefillin
       # p response
       


# renders json: {message: "your times are "}
    end

end
