require 'colorize'
require_relative './modules/menu'
include Menu
require_relative './classes/user'

main_heading()

puts "Welcome to the Moss Casino, have you been here before? (Yes/No)"
returning_user = gets.chomp.downcase
case returning_user
when "yes"
    require_relative 'scoreboard'
    puts "Please Select your details, (Type in the name of the data you want"
    puts File.read('./scoreboard.txt')
    user_select = gets.chomp
    user_select = @users[user_select.to_sym]
    # selection = gets.chomp.downcase
    # puts @ + "#{selection}"
    puts "At the Moss Casino, we have a variety of areas that you can gamble at"
    display_menu()#Displays menu from the Menu Module
    in_the_casino = true
    input_loop(in_the_casino, user_select.name, user_select.balance)

when "no"
    puts "Well, then if you are new to our establishment, what would your name be?"
    name = gets.chomp
    puts "Hello #{name}, how old are you?"
    age = gets.to_i
    case age < 18
    when true
        puts "You are a bit too young for this place, goodbye"
        exit(true)
    end
    puts "Good Evening #{name}, since this is your first time, heres some money to get you started"
    balance = 500
    puts "Balance : $#{balance}"
    user = Users.new(name, balance)
    puts "At the Moss Casino, we have a variety of areas that you can gamble at"
    display_menu()#Displays menu from the Menu Module
    in_the_casino = true
    input_loop(in_the_casino, name, balance) #Loops through the Menu and input pormpt `   `
end
# Accepts either yes or no
# Run Function that will either go to the menu that shows the current saved progress
# or continue on for a new user

# New User Program:
