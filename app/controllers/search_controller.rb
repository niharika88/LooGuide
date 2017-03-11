class SearchController < ApplicationController

  def new
    @restrooms = Restroom.all
    @my_location = Geocoder.search(params[:search][:location])

    if lat_lng = get_lat_lng(@my_location)
      @latitude = lat_lng.lat
      @longitude = lat_lng.lng
      @zoom_value = 16
      render 'restrooms/index.html.erb'
    else
      redirect_to root_path
    end
  end

  def get_lat_lng(arg1)
    boroughs = ["Yelahanka", "Jakkuru", "Atturu", "Chowdeswari Ward", "Ganga Nagar","Tumkur","Tiptur","Halepalya","Chowdeswari Temple Road","Chowdeswari"]

    if arg1.length > 0
      # get all values from geocoder results
      restroom_data = arg1.first.address_components.each_with_object([]) do |hash, all_values|
        all_values << hash.values
      end.flatten.uniq
      # return all values the 2 arrays have in common
      nyc_check = restroom_data & boroughs

       if nyc_check.length > 0
        parse_location = RecursiveOpenStruct.new(arg1.first.geometry['location'], :recurse_over_arrays => true)
        # parse Geocoder gem output to get latitude and longitude
       end
    end


  end


end
