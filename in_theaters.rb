require "json"
require "pry"

movie_data = JSON.parse(File.read("in_theaters.json"))

# this is the method to create the average movie score
def avg_gen(movie)
  avg_ratings = ((movie["ratings"]["critics_score"] + movie["ratings"]["audience_score"]) / 2).to_s
end


# This is what combines all of the movie data to an array
def movies_comb(movie)
    combo = []
    actors = []

    movie["abridged_cast"].first(3).each do |k|
      actors << "#{k["name"]}"
    end

    title = movie["title"]

    mpaa = movie["mpaa_rating"]

    movie_string = "- #{title}: (#{mpaa}) starring #{actors.join(", ")}"
    combo << [avg_gen(movie).to_i, movie_string]
end

array = []

# This takes the data from the movies hash in movie_data and runs them through our movie combiner method
movie_data["movies"].each do |movie|
   movies_comb(movie)[0] = array << movies_comb(movie)[0]
end

new_array = array.sort.reverse

new_array.each do |line|
  puts line.join(" ")
end
