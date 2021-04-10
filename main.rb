require_relative './modules/menu'
include Menu
require_relative './classes/errors'
require 'json'

main_heading()

new_user_status = ARGV[0] if ARGV[0]
retrieve_users = ARGV.include?("retrieve")
wants_rules = ARGV.include?("rules")
ARGV.clear
case retrieve_users 
when true
    admin_password = TTY::Prompt.new
    is_admin = admin_password.mask("Please Enter Admin Password") == "PinkLeonidas33284!!"
    case is_admin
    when true
        file = File.read('./users.json')
        user_list = JSON.parse(file)
        puts user_list
    else
        puts "Password is incorrect, proceeding to the main game"
    end
end
case wants_rules
when true
    puts "Welcome go the Moss Casino"
    puts "Here you can try your hand on different games common in a standard Casino"
    puts "When First Starting out you will receive some money for free!"
    puts "You can play any of the games available, however if you run out you will not be able to play anything!"
    puts "If you are done and want to save your progress, you can 'Leave' and then either signup or save your progress"
    puts "If you do signup please remember your username and password as these cannot be retrieved without assistance from admin"
end

choice = TTY::Prompt.new
returning_user = choice.select("Welcome, have you been here before?", ["Yes", "No"])
case returning_user
when "Yes"
    details = login_screen()
    username = details[1]
    balance = details[0][username.to_sym][1]
    case new_user_status
    when "easy"
        balance = 1000
    when "normal"
        balance = 500
    when "hard"
        balance = 250
    when "maniac"
        balance = 100
    end
    puts "At the Moss Casino, we have a variety of areas that you can gamble at"
    in_the_casino = true
    input_loop(in_the_casino, username, balance)

when "No"
    puts "Well, then if you are new to our establishment, what would your name be?"
    name_valid = false
    until name_valid == true
        begin
            name = gets.strip
            raise EmptyField.new if name.class == NilClass or name == ""
        rescue EmptyField
            puts "Please enter something in as your name"
        else
            name_valid = true
        end
    end
    age_check = TTY::Prompt.new
    age_valid = false
    until age_valid == true
        begin
            age = age_check.ask("How old are you:", convert: :float) do |q|
            q.convert(:float, "%{value} is not a valid age entry, please try again")
            end
            raise EmptyField.new if age.class == NilClass
        rescue EmptyField
            puts "Please Try Again and Enter a Correct Age"
        else
            age_valid = true
        end
    end
    case age < 18
    when true
        puts "You are a bit too young for this place, goodbye"
        exit(true)
    end
    puts "Good Evening #{name}, since this is your first time, heres some money to get you started"
    case new_user_status
    when "easy"
        balance = 1000
    when "normal"
        balance = 500
    when "hard"
        balance = 250
    when "maniac"
        balance = 100
    end
    puts "Balance : $#{balance}"
    puts "At the Moss Casino, we have a variety of areas that you can gamble at"
    in_the_casino = true
    input_loop(in_the_casino, name, balance) #Loops through the Menu and input pormpt `   `
end


