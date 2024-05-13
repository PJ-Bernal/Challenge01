# Pablo Javier Bernal Mariño

require 'net/http'
require 'json'
require 'pp'

url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response) # Convert JSON data into Ruby data.
## pp dog_breeds # pp stands for pretty print.
dog_breeds.each do |message, dog_hash|
  if dog_hash.is_a?(Hash)

    dog_hash.each do |dog, breeds|
      puts "- #{dog.capitalize} has #{breeds.length()} sub-breeds"

        breeds.each_index do |i|
          puts "  - #{i + 1}. #{breeds[i].capitalize}"
        end
    end
  end
end
