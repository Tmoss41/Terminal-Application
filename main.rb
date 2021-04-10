require_relative './modules/menu'
include Menu


main_heading()
choice = TTY::Prompt.new
returning_user = choice.select("Welcome, have you been here before?", ["Yes", "No"])
case returning_user
when "Yes"
    details = login_screen()
    username = details[1]
    puts "At the Moss Casino, we have a variety of areas that you can gamble at"
    in_the_casino = true
    input_loop(in_the_casino, username, details[0][username.to_sym][1])

when "No"
    puts "Well, then if you are new to our establishment, what would your name be?"
    name = gets.chomp
    age_check = TTY::Prompt.new
    age = age_check.ask("How old are you:", convert: :float) do |q|
            q.convert(:float, "%{value} is not a valid age entry, please try again")
    end
    case age < 18
    when true
        puts "You are a bit too young for this place, goodbye"
        exit(true)
    end
    puts "Good Evening #{name}, since this is your first time, heres some money to get you started"
    balance = 500
    puts "Balance : $#{balance}"
    puts "At the Moss Casino, we have a variety of areas that you can gamble at"
    in_the_casino = true
    input_loop(in_the_casino, name, balance) #Loops through the Menu and input pormpt `   `
end
# Accepts either yes or no
# Run Function that will either go to the menu that shows the current saved progress
# or continue on for a new user

# New User Program:
