require 'pry'
require 'csv'
#require '../models/public_park.rb'

module Adapters
class RestroomParser

  def self.parse
    file = File.join(Rails.root, 'app', 'adapters', 'Directory_of_parks.csv')
    public_toilets = File.read(file)
    csv = CSV.parse(public_toilets, headers: true)
      public_toilets_hash = csv.map do |park_restroom|
      park_restroom.to_hash.reject do |key, value|  #remove "Comments" column from CSV file 
        key == "Comments"

      end
    end
  end

  def self.formatted_data #changing headers(keys) from our CSV file to match our PublicParks table columns 
    format_data = self.parse.map do |hash|
      column_titles = {"Name" => "name", "Location" => "location", "Open Year-Round" => "open_year_round", "Handicap Accessible" => "handicap_accessible", "Borough" => "borough"}
      export_ready_hash = hash.each_with_object({}) do |(key, value), final_hash|  # use each with object to create a new hash with formatted keys
        final_hash[column_titles[key]] = value
      end  
    end
  end
  RestroomParser.formatted_data

end
end


