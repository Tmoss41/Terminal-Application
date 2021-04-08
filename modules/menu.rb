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

module Menu
    include Headings
    include Login
    def display_menu
        puts "Please select what you would like to do (Enter a number or text of what you would like to do i.e 7 to Leave".colorize(:red)
        puts "                              The facilities we have in the casino include:                                ".colorize(:white)
        puts "                                          1. Blackjack                                                     ".colorize(:red)
        puts "                                          2. Roulette                                                      ".colorize(:white)
        puts "                                          3. Slot Machines                                                 ".colorize(:red)
        puts "                                          4. Poker                                                         ".colorize(:white)
        puts "                                          5. Horse Racing                                                  ".colorize(:red)
        puts "                                          6. Famous past patrons (Show Scoreboard)                         ".colorize(:white)
        puts "                                          7. Leave                                                         ".colorize(:red)
    end
    def input_loop(playing, name, balance)
        input = gets.to_i
            case input
            when 1
                blackjack = Blackjack.new(balance, name)
                black_heading()
                blackjack.menu
            when 2
            when 3
                slots_heading()
                slots = Slots.new(balance, name)
                slots.menu
            when 4
            when 5
                horse_heading()
                horse_racing = HorseRacing.new(balance, name)
                horse_racing.menu
            when 6
                score_display = File.read('./scoreboard.txt')
                puts score_display
                puts "To Leave, please enter back"
                back = gets.chomp
                if back == "back"
                    display_menu()
                    input_loop(playing, @name, @balance)
                end
            when 7
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