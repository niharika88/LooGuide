class PublicParksController < ApplicationController

  def index
    @parks = PublicPark.all 
    @hash = {lat: PublicPark.first.latitude, lng: PublicPark.first.longitude}
  end

  def show
    @public_park = PublicPark.find(params[:id])
    @review = Review.new
  end

   def new
    @location = PublicPark.new
  end

  def create
    @location = PublicPark.find_or_initialize_by(location_params)
    full_location = "#{params[:public_park][:location]},#{params[:public_park][:borough]}"
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
      park_data = arg1.first.address_components.each_with_object([]) do |hash, all_values|
        all_values << hash.values
      end.flatten.uniq

      # return all values the 2 arrays have in common
      nyc_check = park_data & boroughs

       if nyc_check.length > 0
        parse_location = RecursiveOpenStruct.new(arg1.first.geometry['location'], :recurse_over_arrays => true) 
        # parse Geocoder gem output to get latitude and longitude 
       end
    end
  end

  private

  def location_params
    params.require(:public_park).permit(:name, :handicap_accessible, :open_year_round, :location_type, :borough)
  end






end