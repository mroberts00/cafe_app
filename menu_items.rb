

drinks = {
    latte: { price: 4.0, health_rating: 3, category: "vegetarian", allergens: "dairy" },
    flat_white: { price: 3.8, health_rating: 3, category: "vegetarian", allergens: "dairy" },
    mocha: { price: 4.2, health_rating: 2, category: "vegetarian", allergens: "dairy" },
    black_tea: { price: 3.0, health_rating: 4, category: "vegan", allergens: "none" },
    fresh_orange_juice: { price: 5 , health_rating: 5 , category: "vegan" , allergens: "none" }
}

meals = {
    eggs_benny: { price: 15 , health_rating: 2 , category: "meat", allergens: "gluten" },
    avo_toast: { price: 17 , health_rating: 3 , category: "vegan" , allergens: "gluten" },
    muesli: { price: 9 , health_rating: 4 , category: "vegetarian" , allergens: "none" },
    acai_bowl: { price: 11 , health_rating: 5 , category: "vegan" , allergens: "none" },
    full_english: { price: 19.50 , health_rating: 1 , category: "meat" , allergens: "gluten" }
}

sweets = {
    croissant_jam: { price: 6 , health_rating: 2 , category: "vegetarian", allergens: "gluten" },
    choc_brownie: { price: 4 , health_rating: 1 , category: "vegan" , allergens: "none" },
    banana_muffin: { price: 3.5 , health_rating: 3 , category: "vegetarian" , allergens: "gluten" },
    rasberry_friand: { price: 2.5 , health_rating: 2 , category: "vegetarian" , allergens: "gluten" },
    apple_danish: { price: 4 , health_rating: 2 , category: "vegetarian" , allergens: "gluten" }
}

####     DUMMY Code

require 'colorize'
require 'terminal-table'

puts "Hi, welcome to Kittens Cafe.".colorize(:cyan)

# catpix of cat picture if possible

puts "What's your name? We'll assign it to your order."

name = gets.chomp

name = []
system('clear')

puts "You can order from our Drinks, Meals or Snacks menu."
puts "Alternatively, you can sort our menu by a number of helpful options"
#sleep(1)   no real purpose, just looks kinda cool
puts "Please select 'Drinks', 'Meals', 'Sweets' or 'Sort'"

menu_option = gets.chomp.downcase

if menu_option == "drinks"
    system('clear')

    puts "Please select from the following drinks:"

    # Can try to put this in table form

    drinks.each do |item, details|
        puts "#{item}: #{details[:price]}"
    end
 
elsif menu_option == "meals"
    system('clear')

    puts "Please select from the following meals:"

    # Can try to put this in table form

    meals.each do |item, details|
        puts "#{item}: #{details[:price]}"
    end 

elsif menu_option == "sweets"
    system('clear')

    puts "Please select from the following drinks:"

    # Can try to put this in table form

    sweets.each do |item, details|
        puts "#{item}: #{details[:price]}"
    end 

elsif menu_option == "sort"
    system('clear')

    puts "Would you like to sort by 'Health Options', 'Vegan' or 'Vegetarian' or 'Allergens'?"

    sort_option = gets.chomp.downcase

    if sort_option == "health rating"
        system('clear')

        ## SHOULD HAVE OPTION IF THERE ARE NO ITEMS THAT ARE HEALTHY
        puts "Our healthy options are: "
        puts "Drinks:"  ### WILL CONVERT TO TABLE 
        drinks.each do |item, details|
            if details[:health_rating] > 2 
                puts "#{item}: #{details[:price]}"
            end
        end

        puts "Meals:"  ### WILL CONVERT TO TABLE 
        meals.each do |item, details|
            if details[:health_rating] > 2 
                puts "#{item}: #{details[:price]}"
            end
        end

        puts "Sweets:"  ### WILL CONVERT TO TABLE 
        sweets.each do |item, details|
            if details[:health_rating] > 2 
                puts "#{item}: #{details[:price]}"
            end
        end

    elsif sort_option == "vegan"

         puts "Our vegan options are:"

        puts "Drinks:"  ### WILL CONVERT TO TABLE 
        drinks.each do |item, details|
            if details[:category] == "vegan"
                puts "#{item}: #{details[:price]}"
            end
        end

        puts "Meals:"  ### WILL CONVERT TO TABLE 
        meals.each do |item, details|
            if details[:category] == "vegan"
                puts "#{item}: #{details[:price]}"
            end
        end

        puts "Sweets:"  ### WILL CONVERT TO TABLE 
        sweets.each do |item, details|
            if details[:category] == "vegan"
                puts "#{item}: #{details[:price]}"
            end
        end
    
    elsif sort_option == "vegetarian"
        
        puts "Our vegetarian options are:"

        puts "Drinks:"  ### WILL CONVERT TO TABLE 
        drinks.each do |item, details|
            if details[:category] == "vegetarian" || details[:categor] == "vegan"
            puts "#{item}: #{details[:price]}"
            end
        end

         puts "Meals:"  ### WILL CONVERT TO TABLE 
         meals.each do |item, details|
            if details[:category] == "vegetarian" || details[:categor] == "vegan"
            puts "#{item}: #{details[:price]}"
            end
        end

        puts "Sweets:"  ### WILL CONVERT TO TABLE 
        sweets.each do |item, details|
             if details[:category] == "vegetarian" || details[:categor] == "vegan"
            puts "#{item}: #{details[:price]}"
            end
        end       

    elsif sort_option == "allergens"

        puts "Would you like to see our 'Dairy Free' or 'Gluten Free' menu?"

        allergens_option = gets.chomp.downcase

        if allergens_option == "dairy free"
        
            puts "Our dairy free options are:"

            puts "Drinks:"  ### WILL CONVERT TO TABLE 
            drinks.each do |item, details|
                if details[:allergens] != "dairy"
                    puts "#{item}: #{details[:price]}"
                end
            end

            puts "Meals:"  ### WILL CONVERT TO TABLE 
            meals.each do |item, details|
                if details[:allergens] != "dairy" 
                     puts "#{item}: #{details[:price]}"
                end
            end

            puts "Sweets:"  ### WILL CONVERT TO TABLE 
            sweets.each do |item, details|
                if details[:allergens] != "dairy"
                     puts "#{item}: #{details[:price]}"
                end
            end 

        elsif allergens_option == "gluten free"
        
            puts "Our gluten free options are:"

            puts "Drinks:"  ### WILL CONVERT TO TABLE 
            drinks.each do |item, details|
                if details[:allergens] != "gluten"
                    puts "#{item}: #{details[:price]}"
                end
            end

            puts "Meals:"  ### WILL CONVERT TO TABLE 
            meals.each do |item, details|
                if details[:allergens] != "gluten" 
                     puts "#{item}: #{details[:price]}"
                end
            end

            puts "Sweets:"  ### WILL CONVERT TO TABLE 
            sweets.each do |item, details|
                if details[:allergens] != "gluten"
                     puts "#{item}: #{details[:price]}"
                end
            end 
        else
            puts "Invalid selection, please try again." 
        end 

    else 
        puts "Invalid selection, please try again."
    end
else 
    puts "Invalid selection, please try again."
end   



















