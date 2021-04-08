require_relative '../classes/blackjack'
require_relative '../classes/slots'
require_relative '../classes/horses'
require_relative '../classes/user'
require 'colorize'
require_relative 'headings'
require_relative 'login.rb'
# class InsufficientFunds < StandardError
#     def initialize
#         super("Not Enough Funds")
#     end
# end
require 'tty-prompt'

module Menu
    include Headings
    include Login
    def input_loop(playing, name, balance)
        prompt = TTY::Prompt.new
        input = prompt.select('Please Select an Option', ["Blackjack", "Roulette", "Slot-Machines", "Poker",  "Horse-Racing", "Famous-Patrons", "Leave" ])
        puts input.class
            case input
            when "Blackjack"
                blackjack = Blackjack.new(balance, name)
                black_heading()
                blackjack.game_menu
            when "Roulette"
            when "Slot-Machines"
                slots_heading()
                slots = Slots.new(balance, name)
                slots.game_menu
            when "Poker"
            when "Horse-Racing"
                horse_heading()
                horse_racing = HorseRacing.new(balance, name)
                horse_racing.game_menu
            when "Famous-Patrons"
                score_display = File.read('./scoreboard.txt')
                puts score_display
                puts "To Leave, please enter back"
                back = gets.chomp
                if back == "back"
                    input_loop(playing, @name, @balance)
                end
            when "Leave"
                puts "Have a Wonderful Evening #{name}, would you like to leave your money as credit here? (Yes/No)"
                save_progress = gets.chomp.downcase
                if save_progress == "yes"
                    puts "Are you updating your details or setting up new details? (Type Save or Signup)"
                    update_or_signup = gets.chomp.downcase
                    case update_or_signup
                    when "save"
                        update()
                    when "signup"
                        signup(balance)
                    end
                else
                    puts "No worries #{name}, we will not save your information and balance"
                    exit(true)
                end
            end 
    end
end