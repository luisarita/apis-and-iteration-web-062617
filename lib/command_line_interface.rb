def welcome
  # puts out a welcome message here!
  puts "Welcome to the Star Wars API"
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_character = gets.chomp
  user_character
end

def get_movie_from_user
  puts "please enter a movie"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp
end

def get_user_choice
  puts "Press 1 for Character"
  puts "Press 2 for Movie"
  gets.chomp
end
