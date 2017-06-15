require 'net/http'
require 'json'
require 'rubygems'
require 'rest-client'
require 'dotenv/load'

def get_data_from_api(search_term)
	 
	#Getty Images
    results = RestClient.get("https://api.gettyimages.com/v3/search/images?phrase=#{search_term}", headers={"Api-Key": ENV['api_key']}) 
    read_results = JSON.parse(results)
    
    #All images from search
    p search_results_hash = read_results["images"]
    
    p "-----------------------------------------------------"
    
    p first_image_uri = search_results_hash[0]["display_sizes"][0]["uri"]
    return first_image_uri
end

get_data_from_api("banana")