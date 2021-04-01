require 'colorize'
require_relative './modules/menu'
include Menu
require_relative './classes/user'


puts "Welcome to the Moss Casino, have you been here before?" # Accepts either yes or no
# Run Function that will either go to the menu that shows the current saved progress
# or continue on for a new user

# New User Program:
puts "Well, then if you are new to our establishment, what would your name be?"
name = gets.chomp
puts "Hello #{name}, how old are you?"
age = gets.to_i

case age < 18
when true
    
end
puts "Good Evening #{name}, since this is your first time, heres some money to get you started"
balance = 500
puts "Balance : $#{balance}"
user = User.new(name, balance)
user.info
puts "At the Moss Casino, we have a variety of areas that you can gamble at"
display_menu()
playing = true
input_loop(playing, name, balance)






