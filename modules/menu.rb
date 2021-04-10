require_relative '../classes/blackjack'
require_relative '../classes/slots'
require_relative '../classes/horses'
require_relative '../classes/user'
require 'colorize'
require_relative 'headings'
require_relative 'login.rb'
require_relative '../classes/roulette'
require 'tty-prompt'

module Menu
    include Headings
    include Login
    def input_loop(playing, name, balance)
        while playing
            prompt = TTY::Prompt.new
            input = prompt.select('Please Select an Option', ["Blackjack".colorize(:red), "Roulette".colorize(:grey), "Slot-Machines".colorize(:yellow),  
                                                            "Horse-Racing".colorize(:green), "Statistics".colorize(:orange), "Leave"])
            case input
            when "Blackjack".colorize(:red)
                at_table = true
                blackjack = Blackjack.new(balance, name)
                until !at_table
                    black_heading()
                    blackjack.game_menu
                    at_table = false
                end
            when "Roulette".colorize(:grey)
                at_table = true
                roulette = Roulette.new(balance, name)
                until !at_table 
                    roulette_heading()
                    roulette.game_menu
                    at_table = false
                end
            when "Slot-Machines".colorize(:yellow)
                slots = Slots.new(balance, name)
                at_table = true
                until !at_table
                    slots_heading()
                    slots.game_menu
                    at_table = false
                end
            when "Horse-Racing".colorize(:green)
                at_table = true
                horse_racing = HorseRacing.new(balance, name)
                until !at_table
                    horse_heading()            
                    horse_racing.game_menu
                    at_table = false
                end
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
                save_progress = prompt.yes?("Do you want to save?")
                case save_progress
                when true
                    puts "Are you updating your details or setting up new details? (Type Save or Signup)"
                    update_or_signup = prompt.select('Would you like to Save or Create new details' , ['Save', 'Signup'])
                    case update_or_signup
                    when "Save"
                        update()
                    when "Signup"
                        signup(balance)
                    end
                when false
                    puts "No worries #{name}, we will not save your information and balance"
                    exit(true)
                end
            end 
        end
    end
end