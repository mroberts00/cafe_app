module UserInterface
    module Menu
        module_function
        def format_input(input_from_user)
            return input_from_user.chomp.downcase
        end

        def get_menu_item
            input_from_user = gets
            return format_input(input_from_user)
        end
    end
end

