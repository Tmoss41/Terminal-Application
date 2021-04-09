require_relative '../classes/blackjack'
require_relative '../classes/slots'
require_relative '../classes/horses'
require_relative '../classes/user'
require 'colorize'
require_relative 'headings'
require_relative 'login.rb'
require_relative '../classes/roulette'
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
        input = prompt.select('Please Select an Option', ["Blackjack".colorize(:red), "Roulette".colorize(:grey), "Slot-Machines".colorize(:yellow), "Poker".colorize(:blue),  
                                                            "Horse-Racing".colorize(:green), "Statistics".colorize(:orange), "Leave"])
            case input
            when "Blackjack".colorize(:red)
                blackjack = Blackjack.new(balance, name)
                black_heading()
                blackjack.game_menu
            when "Roulette".colorize(:grey)
                roulette = Roulette.new(balance, name)
                roulette.game_menu
            when "Slot-Machines".colorize(:yellow)
                slots_heading()
                slots = Slots.new(balance, name)
                slots.game_menu
            when "Poker".colorize(:blue)
            when "Horse-Racing".colorize(:green)
                horse_heading()
                horse_racing = HorseRacing.new(balance, name)
                horse_racing.game_menu
            when "Statistics".colorize(:orange)
                while statistics == true
                    stat_input = prompt.select('What Game Stats would you like to see?', ['Blackjack', 'Roulette', 'Slot-Machines', 'Poker', 'Horse-Racing'])
                    case stat_input
                    when 'Blackjack'
                    when 'Roulette'
                        roulette.stats
                    when 'Slot-Machines'
                    when 'Poker'
                    when 'Horse-Racing'
                    end
                end
            when "Leave"
                puts "Have a Wonderful Evening #{name}, would you like to leave your money as credit here? (Yes/No)"
                save_progress = gets.chomp.downcase
                if save_progress == "yes"
                    puts "Are you updating your details or setting up new details? (Type Save or Signup)"
                    update_or_signup = prompt.select('Would you like to Save or Create new details' , ['Save', 'Signup'])
                    case update_or_signup
                    when "Save"
                        update()
                    when "Signup"
                        signup(balance)
                    end
                else
                    puts "No worries #{name}, we will not save your information and balance"
                    exit(true)
                end
            end 
    end
end