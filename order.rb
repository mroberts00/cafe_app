module Order
    module_function
    def reformat_chosen_menu_items(chosen_menu_items)
        rows = []
        chosen_menu_items.each do |item, details|       
            rows << [item, "$"'%.2f' % details[:price]]
        end
        return rows
    end
    
    def find_add_item_matching_user_input_to_order(chosen_menu_items, selected_item, itemised_receipt, name)
        chosen_menu_items.each do |item, details|  
            if selected_item == item.to_s 
                itemised_receipt[name][item] = details[:price]        
            end 
        end
    end
    def find_reformat_healthy_items(chosen_menu_items)
        rows = []
        chosen_menu_items.each do |item, details|
            if details[:health_rating] > 2 
                rows << [item, "$"'%.2f' % details[:price]]
            end
        end
        return rows
    end
    def find_add_healthy_item_to_order(chosen_menu_items, option, itemised_receipt, name)
        chosen_menu_items.each do |item, details|  
            if option == item.to_s 
                itemised_receipt[name][item] = details[:price]        
            end   
        end 
    end
    def find_reformat_vegan_items(chosen_menu_items)
        rows = []
        chosen_menu_items.each do |item, details|
            if details[:category] == "vegan"
                rows << [item, "$"'%.2f' % details[:price]]
            end
        end
        return rows
    end
    def find_add_vegan_item_to_order(chosen_menu_items, option, itemised_receipt, name)
        chosen_menu_items.each do |item, details|  
            if option == item.to_s 
                itemised_receipt[name][item] = details[:price]        
            end 
        end
    end
    def find_reformat_vegetarian_items(chosen_menu_items)
        rows = []
        chosen_menu_items.each do |item, details|
            if details[:category] == "vegetarian" || details[:category] == "vegan"
                rows << [item, "$"'%.2f' % details[:price]]
            end
        end
        return rows
    end
    def find_add_vegetarian_item_to_order(chosen_menu_items, option, itemised_receipt, name)
        chosen_menu_items.each do |item, details|  
            if option == item.to_s 
                itemised_receipt[name][item] = details[:price]        
            end   
        end
    end
    def find_reformat_dairy_free_items(chosen_menu_items)
        rows = []
        chosen_menu_items.each do |item, details|
            if details[:allergens] != "dairy"
                rows << [item, "$"'%.2f' % details[:price]]
            end
        end
        return rows
    end
    def find_add_dairy_free_item_to_order(chosen_menu_items, option, itemised_receipt, name)
        chosen_menu_items.each do |item, details|  
            if option == item.to_s 
                itemised_receipt[name][item] = details[:price]        
            end   
        end
    end
    def find_reformat_gluten_free_items(chosen_menu_items)
        rows = []
        chosen_menu_items.each do |item, details|
            if details[:allergens] != "gluten"
                rows << [item, "$"'%.2f' % details[:price]]
            end
        end
        return rows
    end
    def find_add_gluten_free_item_to_order(chosen_menu_items, option, itemised_receipt, name)
        chosen_menu_items.each do |item, details|  
            if option == item.to_s 
                itemised_receipt[name][item] = details[:price]        
            end   
        end
    end
end