require "JSON"

movie_data = JSON.parse(File.read("in_theaters.json"))

movies = movie_data["movies"]

def movie_titles(movies)
  movies["title"]
end

def movie_mpaa(movies)
  movies["mpaa_rating"]
end

def movie_cast(movies)
  a = []

    movies["abridged_cast"].each do |movie|
      a << movie["name"]
    end
  a.join(", ")
end

def movie_avg_rating(movies)

  crit_score = movies["ratings"]["critics_score"]
  aud_score = movies["ratings"]["audience_score"]

  (crit_score + aud_score) / 2
end

sort_array = []

movies.each do |movie|
  title = movie_titles(movie)
  mpaa = movie_mpaa(movie)
  cast = movie_cast(movie)
  rating = movie_avg_rating(movie)

  sort_array << "#{rating} - #{title} (#{mpaa}) staring #{cast}"
end

puts sort_array.sort!.reverse!

# 85 - Bears (G) starring John C. Reilly
