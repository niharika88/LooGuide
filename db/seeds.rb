# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restroom.delete_all

Adapters::RestroomParser.formatted_data.each do |data|    
#iterate through each park (hash)
  sleep(0.11) #Geocoder gem only allows for 10 queries per second
  new_park = Restroom.new(data)  
  name = new_park.name  
  location = new_park.location 
  #use Geocoder gem to get geo information 
  latlng = Geocoder.search(location)  
  
  # latlng = RecursiveOpenStruct.new(latlng.first.address_components.first)
  # need to move this into a method -- reusing to allow users to create new locations 
  boroughs = ["Yelanka", "Jakkuru", "Atturu", "Chowdeswari Ward", "Ganga Nagar"]

  if latlng.length > 0

    # get all values from geocoder results
    park_data = latlng.first.address_components.each_with_object([]) do |hash, all_values|
      all_values << hash.values
    end.flatten.uniq

    # return all values the 2 arrays have in common
    nyc_check = park_data & boroughs

    # if nyc_check.length > 0
      parse_location = RecursiveOpenStruct.new(latlng.first.geometry['location'], :recurse_over_arrays => true) 
      # parse Geocoder gem output to get latitude and longitude 
      new_park.latitude = parse_location.lat
      new_park.longitude = parse_location.lng
      new_park.save
    # end
  end
end

  


  #[5]["short_name"]