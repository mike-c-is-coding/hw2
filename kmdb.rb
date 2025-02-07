# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
Studio.destroy_all


# Generate models and tables, according to the domain model.
# done - added Movie, Actor, Role, and Studio models

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

# Filling in actors data
actor1 = Actor.new
actor1["name"] = "Christian Bale"
actor1.save

actor2 = Actor.new
actor2["name"] = "Michael Caine"
actor2.save

actor3 = Actor.new
actor3["name"] = "Liam Neeson"
actor3.save

actor4 = Actor.new
actor4["name"] = "Katie Holmes"
actor4.save

actor5 = Actor.new
actor5["name"] = "Gary Oldman"
actor5.save

actor6 = Actor.new
actor6["name"] = "Heath Ledger"
actor6.save

actor7 = Actor.new
actor7["name"] = "Aaron Eckhart"
actor7.save

actor8 = Actor.new
actor8["name"] = "Maggie Gyllenhaal"
actor8.save

actor9 = Actor.new
actor9["name"] = "Tom Hardy"
actor9.save

actor10 = Actor.new
actor10["name"] = "Joseph Gordon-Leavitt"
actor10.save

actor11 = Actor.new
actor11["name"] = "Anne Hathaway"
actor11.save

# Filling in studio data
studio = Studio.new
studio["name"] = "Warner Bros."
studio.save

# Filling in movie data
studio_name = Studio.find_by({"name" => "Warner Bros."})

movie1 = Movie.new
movie1["name"] = "Batman Begins"
movie1["year"] = 2005
movie1["rating"] = "PG-13"
movie1["studio_id"] = studio["id"]
movie1.save

movie2 = Movie.new
movie2["name"] = "The Dark Knight"
movie2["year"] = 2008
movie2["rating"] = "PG-13"
movie2["studio_id"] = studio_name["id"]
movie2.save

movie3 = Movie.new
movie3["name"] = "The Dark Knight Rises"
movie3["year"] = 2013
movie3["rating"] = "PG-13"
movie3["studio_id"] = studio["id"]
movie3.save

# Filling in role data
movie_name1 = Movie.find_by({"name" => "Batman Begins"}) 
movie_name2 = Movie.find_by({"name" => "The Dark Knight"}) 
movie_name3 = Movie.find_by({"name" => "The Dark Knight Rises"}) 

actor_name1 = Actor.find_by({"name" => "Christian Bale"})
actor_name2 = Actor.find_by({"name" => "Michael Caine"})
actor_name3 = Actor.find_by({"name" => "Liam Neeson"})
actor_name4 = Actor.find_by({"name" => "Katie Holmes"})
actor_name5 = Actor.find_by({"name" => "Gary Oldman"})
actor_name6 = Actor.find_by({"name" => "Heath Ledger"})
actor_name7 = Actor.find_by({"name" => "Aaron Eckhart"})
actor_name8 = Actor.find_by({"name" => "Maggie Gyllenhaal"})
actor_name9 = Actor.find_by({"name" => "Tom Hardy"})
actor_name10 = Actor.find_by({"name" => "Joseph Gordon-Leavitt"})
actor_name11 = Actor.find_by({"name" => "Anne Hathaway"})

role1 = Role.new
role1["movie_id"] = movie_name1["id"]
role1["actor_id"] = actor_name1["id"]
role1["character_name"] = "Bruce Wayne"
role1.save

role2 = Role.new
role2["movie_id"] = movie_name1["id"]
role2["actor_id"] = actor_name1["id"]
role2["character_name"] = "Bruce Wayne"
role2.save

role2 = Role.new
role2["movie_id"] = movie_name1["id"]
role2["actor_id"] = actor_name1["id"]
role2["character_name"] = "Bruce Wayne"
role2.save

role3 = Role.new
role3["movie_id"] = movie_name1["id"]
role3["actor_id"] = actor_name1["id"]
role3["character_name"] = "Bruce Wayne"
role3.save

role4 = Role.new
role4["movie_id"] = movie_name1["id"]
role4["actor_id"] = actor_name1["id"]
role4["character_name"] = "Bruce Wayne"
role4.save

role1 = Role.new
role1["movie_id"] = movie_name1["id"]
role1["actor_id"] = actor_name1["id"]
role1["character_name"] = "Bruce Wayne"
role1.save

role1 = Role.new
role1["movie_id"] = movie_name1["id"]
role1["actor_id"] = actor_name1["id"]
role1["character_name"] = "Bruce Wayne"
role1.save

role1 = Role.new
role1["movie_id"] = movie_name1["id"]
role1["actor_id"] = actor_name1["id"]
role1["character_name"] = "Bruce Wayne"
role1.save

role1 = Role.new
role1["movie_id"] = movie_name1["id"]
role1["actor_id"] = actor_name1["id"]
role1["character_name"] = "Bruce Wayne"
role1.save



# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
