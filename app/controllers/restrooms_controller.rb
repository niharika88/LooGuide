class RestroomsController < ApplicationController

  def index
    @restrooms = Restroom.all
    @hash = 
    {lat:
     Restroom.first.latitude, 
     lng: Restroom.first.longitude}

    #For centering the map in banglore
    @latitude =  12.972442
    @longitude = 77.580643
    @zoom_value = 12
  end

  def show
    @restroom = Restroom.find(params[:id])
    @review = Review.new
  end

   def new
    @location = Restroom.new
    @review = @location.reviews.build
  end

  def create
    find_params = params["restroom"].reject {|k, v| k == "reviews_attributes"} 
    @location = Restroom.find_by(find_params)
    if @location
      @location.update(location_params)
    else 
      @location = Restroom.new(location_params)
    end
    full_location = "#{params[:restroom][:location]},#{params[:restroom][:borough]}"
    @coordinates = Geocoder.search(full_location)
    if lat_lng = get_lat_lng(@coordinates)
      @location.latitude = lat_lng.lat
      @location.longitude = lat_lng.lng
      @location.save
      redirect_to root_path
    else
      render :new
    end
  end

  def get_lat_lng(arg1)
    boroughs = ["Yelahanka", "Jakkuru", "Atturu", "Chowdeswari Ward", "Ganga Nagar"]

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

  private

  def location_params
    params.require(:restroom).permit(:name, :handicap_accessible, :open_year_round, :location_type, :borough, :location, :reviews_attributes => [:rating, :comment, :user_id])
  end






end
