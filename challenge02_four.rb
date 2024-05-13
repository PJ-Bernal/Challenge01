# Pablo Javier Bernal Mariño

require 'net/http'
require 'json'
require 'pp'

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)
trees = JSON.parse(response) # Convert JSON data into Ruby data.
counter = 0

trees.each do |tree|
  if tree["common_name"].include? "ash"
    counter += 1
  end
end
puts "The total amount of Ash trees is: #{counter}"
