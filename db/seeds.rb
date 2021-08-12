require 'open-uri'
require 'json'

puts "Cleaning the db..."
Movie.destroy_all

puts "Creating movies..."
response = URI.open('http://tmdb.lewagon.com/movie/top_rated').read

results = JSON.parse(response)

results["results"].each do |result|
  Movie.create!(
    title: result["title"],
    overview: result["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500/#{result['poster_path']}",
    rating: result["vote_average"]
  )

end

puts "Created #{Movie.count} movies."
