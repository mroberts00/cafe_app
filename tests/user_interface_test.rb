require 'colorize'
# path of the implementation file
require_relative '../user_interface'

def expect actual, message, expected
    if actual == expected then 
        puts "  PASS #{message}".colorize(:green)
    else
        puts "  FAIL #{message} expected #{expected}, but got #{actual}".colorize(:red)
    end
end

def subject subject_name
    puts subject_name
end

def test_for_menu_item_user_input_format
    subject "menu item user input format"
    actual = UserInterface::Menu.format_input("DrInKs")
    expected = "drinks"
    expect(actual, "should convert menu item input from user to downcase", expected)
end

puts test_for_menu_item_user_input_format 