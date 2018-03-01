require_relative 'user_interface'
require_relative 'order'
require_relative 'payment'

drinks = {
    latte: { price: 4.0, health_rating: 3, category: "vegetarian", allergens: "dairy" },
    flat_white: { price: 3.8, health_rating: 3, category: "vegetarian", allergens: "dairy" },
    mocha: { price: 4.2, health_rating: 2, category: "vegetarian", allergens: "dairy" },
    black_tea: { price: 3.0, health_rating: 4, category: "vegan", allergens: "none" },
    fresh_orange_juice: { price: 5.0 , health_rating: 5 , category: "vegan" , allergens: "none" }
}

meals = {
    eggs_benny: { price: 15.0 , health_rating: 2 , category: "meat", allergens: "gluten" },
    avo_toast: { price: 17.0 , health_rating: 3 , category: "vegan" , allergens: "gluten" },
    muesli: { price: 9.0 , health_rating: 4 , category: "vegetarian" , allergens: "dairy" },
    acai_bowl: { price: 11.0 , health_rating: 5 , category: "vegan" , allergens: "none" },
    full_english: { price: 19.50 , health_rating: 1 , category: "meat" , allergens: "gluten" }
}

snacks = {
    croissant_jam: { price: 6.0 , health_rating: 2 , category: "vegetarian", allergens: "gluten" },
    choc_brownie: { price: 4.0 , health_rating: 1 , category: "vegan" , allergens: "none" },
    banana_muffin: { price: 3.5 , health_rating: 3 , category: "vegetarian" , allergens: "gluten" },
    rasberry_friand: { price: 2.5 , health_rating: 2 , category: "vegetarian" , allergens: "gluten" },
    apple_danish: { price: 4.0 , health_rating: 2 , category: "vegetarian" , allergens: "gluten" }
}

full_menu = drinks.merge(meals)

full_menu = full_menu.merge(snacks)


####     DUMMY Code

require 'colorize'
require 'terminal-table'
require 'progress_bar'

itemised_receipt = Hash.new(0)

puts "Hi, welcome to Kittens Cafe.".colorize(:cyan)

# catpix of cat picture if possible

loop do

    puts "What's your name? We'll assign it to your order."

    name = gets.chomp.to_sym

    itemised_receipt[name] = Hash.new(0)

    system('clear')

    puts "You can order from our Drinks, Meals or Snacks menu."
    puts "Alternatively, you can sort our menu by a number of helpful options"
    puts "\n"
    #sleep(1)   no real purpose, just looks kinda cool
    loop do
        puts "To add something to your order please select 'Drinks', 'Meals', 'Snacks' or 'Sort'."
        puts "To add a different person to the order select 'New Person' or to view the order select 'Order'"

        menu_option = UserInterface::Menu.get_menu_item

        if menu_option == "drinks"
            system('clear')

            # display the list of drinks in a table
            rows = Order.reformat_chosen_menu_items(drinks)

            puts Terminal::Table.new :title => "Drinks", :headings => ['Item', 'Price'], :rows => rows
            puts "\n"
            puts "What drink would you like today?"
            drink = gets.chomp.downcase
            
            # find and add item matching user input to order
            Order.find_add_item_matching_user_input_to_order(drinks, drink, itemised_receipt, name)
            system('clear')

        elsif menu_option == "meals"
            system('clear')

            # display the list of drinks in a table
            rows = Order.reformat_chosen_menu_items(meals)

            puts Terminal::Table.new :title => "Meals", :headings => ['Item', 'Price'], :rows => rows
            puts "\n"
            puts "What meal would you like today?"
            meal = gets.chomp.downcase

            # find and add item matching user input to order
            Order.find_add_item_matching_user_input_to_order(meals, meal, itemised_receipt, name)
            system('clear')

        elsif menu_option == "snacks"
            system('clear')

            rows = Order.reformat_chosen_menu_items(snacks)
            puts Terminal::Table.new :title => "Snacks", :headings => ['Item', 'Price'], :rows => rows
            puts "\n"
            puts "What snacks would you like today?"
            snack = gets.chomp.downcase

            Order.find_add_item_matching_user_input_to_order(snacks, snack, itemised_receipt, name)
            system('clear')    

        elsif menu_option == "sort"
            system('clear')


            puts "Would you like to sort by 'Healthy Options', 'Vegan' or 'Vegetarian' or 'Allergens'?"

            sort_option = gets.chomp.downcase

            if sort_option == "healthy options"
                system('clear')

                ## SHOULD HAVE OPTION IF THERE ARE NO ITEMS THAT ARE HEALTHY
                puts "Our healthy options are: "
                rows = Order.find_reformat_healthy_items(drinks)
                puts Terminal::Table.new :title => "Healthy Drinks", :headings => ['Item', 'Price'], :rows => rows
                puts "\n"

                rows = Order.find_reformat_healthy_items(meals)
                puts Terminal::Table.new :title => "Healthy Meals", :headings => ['Item', 'Price'], :rows => rows
                puts "\n"

                rows = Order.find_reformat_healthy_items(snacks)
                puts Terminal::Table.new :title => "Healthy Snacks", :headings => ['Item', 'Price'], :rows => rows
                puts "\n"
                puts "What would you like today?"
                option = gets.chomp.downcase
                
                Order.find_add_healthy_item_to_order(full_menu, option, itemised_receipt, name)
                system('clear')

            elsif sort_option == "vegan"

                puts "Our vegan options are:"

                rows = Order.find_reformat_vegan_items(drinks)
                puts Terminal::Table.new :title => "Vegan Drinks", :headings => ['Item', 'Price'], :rows => rows
                puts "\n"

                rows = Order.find_reformat_vegan_items(meals)
                puts Terminal::Table.new :title => "Vegan Meals", :headings => ['Item', 'Price'], :rows => rows
                puts "\n"

                rows = Order.find_reformat_vegan_items(snacks)
                puts Terminal::Table.new :title => "Vegan Snacks", :headings => ['Item', 'Price'], :rows => rows
                puts "\n"
                puts "What would you like today?"
                option = gets.chomp.downcase
                

                Order.find_add_vegan_item_to_order(full_menu, option, itemised_receipt, name)
                system('clear') 

            elsif sort_option == "vegetarian"
                
                puts "Our vegetarian options are:"

                rows = Order.find_reformat_vegetarian_items(drinks)
                puts Terminal::Table.new :title => "Vegetarian Drinks", :headings => ['Item', 'Price'], :rows => rows
                puts "\n"

                rows = Order.find_reformat_vegetarian_items(meals)
                puts Terminal::Table.new :title => "Vegetarian Meals", :headings => ['Item', 'Price'], :rows => rows
                puts "\n"

                rows = Order.find_reformat_vegetarian_items(snacks)
                puts Terminal::Table.new :title => "Vegetarian Snacks", :headings => ['Item', 'Price'], :rows => rows
                puts "\n"   
                puts "What would you like today?"
                option = gets.chomp.downcase
                
                Order.find_add_vegetarian_item_to_order(full_menu, option, itemised_receipt, name)
                system('clear') 

            elsif sort_option == "allergens"

                puts "Would you like to see our 'Dairy Free' or 'Gluten Free' menu?"

                allergens_option = gets.chomp.downcase

                if allergens_option == "dairy free"
                
                    puts "Our dairy free options are:"

                    rows = Order.find_reformat_dairy_free_items(drinks)
                    puts Terminal::Table.new :title => "Dairy Free Drinks", :headings => ['Item', 'Price'], :rows => rows
                    puts "\n"  

                    rows = Order.find_reformat_dairy_free_items(meals)
                    puts Terminal::Table.new :title => "Dairy Free Meals", :headings => ['Item', 'Price'], :rows => rows
                    puts "\n"  

                    rows = Order.find_reformat_dairy_free_items(snacks)
                    puts Terminal::Table.new :title => "Dairy Free Snacks", :headings => ['Item', 'Price'], :rows => rows
                    puts "\n"  
                    puts "What would you like today?"
                    option = gets.chomp.downcase
                
                    Order.find_add_dairy_free_item_to_order(full_menu, option, itemised_receipt, name)
                    system('clear')  

                elsif allergens_option == "gluten free"
                
                    puts "Our gluten free options are:"

                    rows = Order.find_reformat_gluten_free_items(drinks)
                    puts Terminal::Table.new :title => "Gluten Free Drinks", :headings => ['Item', 'Price'], :rows => rows
                    puts "\n"  

                    rows = Order.find_reformat_gluten_free_items(meals)
                    puts Terminal::Table.new :title => "Gluten Free Meals", :headings => ['Item', 'Price'], :rows => rows
                    puts "\n"  

                    rows = Order.find_reformat_gluten_free_items(meals)
                    puts Terminal::Table.new :title => "Gluten Free Snacks", :headings => ['Item', 'Price'], :rows => rows
                    puts "\n"  
                    puts "What would you like today?"
                    option = gets.chomp.downcase
                

                Order.find_add_gluten_free_item_to_order(full_menu, option, itemised_receipt, name)
                system('clear')  
                else
                    puts "Invalid selection, please try again." 
                end 

            else 
                puts "Invalid selection, please try again."
            end

        elsif 
            menu_option == "new person"
            system('clear')
            break

        elsif
            menu_option == "order" 
            totals_receipt = Hash.new(0)  
            total_owed = 0
            itemised_receipt.each do |name, items|
                rows = [] 
                person_owed = 0 
                
                items.each do |item, price|
                    rows << [item, ("$"'%.2f' % price).rjust(8)]
                    person_owed += price
                end

                totals_receipt[name] += person_owed 
                total_owed += person_owed

                rows << ["Total".colorize(:green), ("$"'%.2f' % person_owed).rjust(8).colorize(:green)]
                puts Terminal::Table.new :title => "#{name}".capitalize.colorize(:cyan), :headings => ['Item'.ljust(17), 'Price'.rjust(8)], :rows => rows
            end
            puts "\n"
            puts "The total amount owed is $#{('%.2f' % total_owed)}.".colorize(:green)
            puts "\n"

            if totals_receipt.keys.count == 1
                puts "Please enter your payment details below"
                payment_details = gets.chomp
                system('clear')
                bar = ProgressBar.new(100)
                100.times do
                    sleep 0.02
                    bar.increment!
                end
                puts "Payment ok"
                sleep(2)
                break
                
            else
                loop do
                    puts "Would you like to pay 'separately' or 'together'?"
                    pay_option = gets.chomp.downcase
                    system('clear')

                    if 
                        pay_option == "separately"
                        rows = Payment.separate_payments_receipt(totals_receipt)
                        puts Terminal::Table.new :title => "Receipt".colorize(:cyan), :headings => ['Name'.ljust(17), 'Total'.rjust(8)], :rows => rows
                        sleep(1)

                        totals_receipt.each do |item, price|
                            puts "#{item.capitalize} owes $#{('%.2f' % price)}, please enter your payment details"
                            payment_details = gets.chomp
                            system('clear')
                            bar = ProgressBar.new(100)
                            100.times do
                                sleep 0.02
                                bar.increment!
                            end
                            puts "Payment ok"
                            sleep(2)
                        end
                        break

                    elsif
                        pay_option == "together"
                        puts "The total amount owed is $#{('%.2f' % total_owed)}.".colorize(:green)
                        puts "Please enter your payment details below"
                        payment_details = gets.chomp
                        system('clear')
                        bar = ProgressBar.new(100)
                        100.times do
                            sleep 0.02
                            bar.increment!
                        end
                        puts "Payment ok"
                        sleep(2)
                        break
                    else
                        puts "Invalid selection, please try again."
                    
                    end
                end 
            end
            else 
            puts "Invalid selection, please try again."
        end   
    end
end














