require "JSON"

movie_data = JSON.parse(File.read("in_theaters.json"))

movies = movie_data["movies"]

  #Whenever I reference movies in the file, i am saying movie_data["movies"]
  #If I call the movie_name method to movies later it will look like this: movie_name(movies)
  #Doing this is sayin add ["title"] to the end of movie_names["movies"]

def movie_name(movie)
  movie["title"]
end

def movie_mpaa(movie)
  movie["mpaa_rating"]
end

def movie_avg(movie)
  ((movie["ratings"]["critics_score"] + movie["ratings"]["audience_score"]) / 2)
end

def movie_cast(movie)
  array = []

  a = movie["abridged_cast"].take(3)
    a.each do |member|
      array << member["name"]
  end
  array.join(", ")
end

output = []

movies.each do |movies|
  output << "#{movie_avg(movies)} #{movie_name(movies)} (#{movie_mpaa(movies)}) #{movie_cast(movies)}"
end

    #example: #movie_cast(movies) is saying movie_data["movies"]["title"]
    #because you take the movie_name method and pass movie_data["movies"] from movies on line 5
    #through it. Since movies is already asking for movie_data["movies"] we only need ["title"]
    #This is now being pushed into the output array with each other movies individual items.


output.sort!.reverse!

puts output
