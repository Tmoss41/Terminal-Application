require_relative './modules/menu'
include Menu
require_relative './classes/errors'
require 'json'

main_heading()
reveal_secrets = ARGV.include?("reveal")
new_user_status = ARGV[0] if ARGV[0]
retrieve_users = ARGV.include?("retrieve")
wants_rules = ARGV.include?("rules")
ARGV.clear
case reveal_secrets
when true
    puts "So you want to see how rigged this game is? Alright then

        Blackjack Game:
         The Blackjack Game is cheating you in a very simple way
         The Selection of Cards for players is [1,2,3,4,5,6,7,8,9,10,10,10,10]
         and each value is removed reducing your available options
         The House Selection of Cards is [8,9,10,1,7]

        Roulette Game:
         The Roulette Game Lets you pick odds, however Even only returns your bets,
         2 to 1, is already low and 35 to 1 is not even worth looking at. To make money it is best to go 2 to 1
         This should technically give you a third of a chance to get something, which seems alright, 
         Except this app shuffles through different wheels that are missing numbers :) lowering chances immensely

        Slot Machines:
         Slot Machines have several Reels, the highest probability one, is the 4 Reel Slot which only returns Even. \
         As you get higher in reel size, so does the return, but the possible combinations increases immensely
         For example: 
         With 4 Reels with the option of Win or Lose, the possibly combinations equal to 16
         With 8 Reels that increases to 256 combinations
         With 12 Reels it increase to 4096 combinations. For a bet return of 12 to 1? No thank you
         This is the most Rigged Game i made.

         Horses: 
         I mean, it's horses, everyone knows not to bet on the Pony's. 
         But Specifically, never bet on Razmataz, you will lose your bet. EVERY SINGLE TIME
         
         Welp thats the rigged stats of this game, if you want to change it, you can go into the code and change it yourself
         Or use Cheat Codes/Commandline Arguments and just add more money to your account
         Whatever Works"
    exit(true)
end
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
    else
        balance = 500
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
    else
        balance = 500
    end
    puts "Balance : $#{balance}"
    puts "At the Moss Casino, we have a variety of areas that you can gamble at"
    in_the_casino = true
    input_loop(in_the_casino, name, balance) #Loops through the Menu and input pormpt `   `
end


