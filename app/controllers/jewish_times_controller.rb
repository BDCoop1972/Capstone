class JewishTimesController < ApplicationController
    

  def index
       # user enters zipcode
    input_zip = params[:zip]
        
    # input_date = params[:date].to_i


       # zipcode is converted into longitude and latitude
    lat_long = Geocoder.coordinates(input_zip)


   
    # if params[:date]
    date = Date.parse("28/04/2018")
    # day = Date.parse(params[:date])
    # else
    # date = Date.today
    # end
    # input_array = []
    input_times = []
    latitude = lat_long[0]
    longitude = lat_long[1]


    35.times do
      date = date + 1

    
    

      # latitude = lat_long[0]
      # longitude = lat_long[1]
      sun_times = SunTimes.new
        
         
      z = Ziptz.new
      zones = z.time_zone_name(input_zip)

      morning = zones + " Time " + "(US & Canada)"

        
      rising = sun_times.rise(date, latitude, longitude).in_time_zone(morning)

  # setting = sun_times.set(date + 1, latitude, longitude).in_time_zone(morning)

  # candle = setting - 20.minutes

      number = [60.minutes, 52.minutes, 50.minutes, 45.minutes, 35.minutes]
      index = 0
      input_array = []
  
   
      5.times do
      
        tallis = rising - number[index]
        p tallis
        index += 1
        input_array << tallis.strftime('%B %d, %Y %I:%M:%S')
      end


      input_times << {
start: date,
title: input_array[0],
className: "hebdate",
allDay: true
}

      input_times << {
start: date,
title: input_array[1],
className: "hebdate",
allDay: true
} 

      input_times << {
start: date,
title: input_array[2],
className: "hebdate",
allDay: true
}

      input_times << {
start: date,
title: input_array[3],
className: "hebdate",
allDay: true
}

      input_times << {
start: date,
title: input_array[4],
className: "hebdate",
allDay: true
}

    end



    render json: input_times.as_json

  end



end
