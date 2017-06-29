require 'rest-client'
require 'json'
require 'pry'

def get_character_from_api_by_url(character, url)
  #make the web request
  all_characters = RestClient.get(url)
  character_hash = JSON.parse(all_characters)
  #luke_skywalker = character_hash["results"][0]["name"]
  found_character = character_hash["results"].find {|character_data| character_data["name"] == character }

  while found_character == nil
    url = character_hash["next"]
    if url != nil
      found_character = get_character_from_api_by_url(character, url)
    end
  end

  found_character
end

def get_character_movies_from_api(character)
  url = 'http://www.swapi.co/api/people/'
  found_character = get_character_from_api_by_url(character, url)

  found_character["films"].collect do |film_url|
    film_info = RestClient.get(film_url)
    film_hash = JSON.parse(film_info)
  end

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(all_films_array)
  # some iteration magic and puts out the movies in a nice list
  all_films_array.each do |film_hash|
    puts film_hash["title"]
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

def show_movie_crawl(movie)
  #make the web request
  all_movies = RestClient.get('http://www.swapi.co/api/films/')
  movies_hash = JSON.parse(all_movies)

  found_movie = movies_hash["results"].find {|movie_data| movie_data["title"] == movie }

  lines = []

  found_movie["opening_crawl"].split("\r\n").each do |line|
    lines << "        " + line
  end

  screen_draw(lines)
end
