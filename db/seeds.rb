# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Item.destroy_all
Item.create([
    {
      :title => "Broiled Tilapia Parmesan",
      :description => "Flavorful recipe for this farm raised fish that is easy and done in minutes! The fish is broiled with a creamy cheese coating for an impressive flavor and texture.",
      :link => "http://allrecipes.com/Recipe/Broiled-Tilapia-Parmesan/",
      :category => "seafood"
    },
    {
      :title => "Quinoa and Black Beans",
      :description => "Very flavorful alternative to black beans and rice. Quinoa is a nutty grain from South America.",
      :link => "http://allrecipes.com/Recipe/Quinoa-and-Black-Beans/",
      :category => "beans"
    },
    {
      :title => "Chicken Marsala",
      :description => "A delicious, classic chicken dish -- lightly coated chicken breasts braised with Marsala wine and mushrooms. Easy and ideal for both a quick weeknight entree AND serving to company.",
      :link => "http://allrecipes.com/Recipe/Chicken-Marsala/",
      :category => "poultry"
    },
    {
      :title => "Burrito Pie",
      :description => "This is a lot like a lasagna, only Mexican-style! Serve like a pie and garnish with sour cream, salsa, lettuce and tomato. Make sure you like spicy foods before trying this one. It's hot!",
      :link => "http://allrecipes.com/Recipe/Burrito-Pie/",
      :category => "spicy"
    },
    {
      :title => "Slow Cooker Pepper Steak",
      :description => "Very tender and flavorful, this recipe is one of our family's favorites. It's great to make ahead of time in the slow cooker and then serve over rice, egg noodles, or chow mein.",
      :link => "http://allrecipes.com/Recipe/Slow-Cooker-Pepper-Steak/",
      :category => "beef"
    },

  ])

puts "There are #{Item.count} items in the database"
