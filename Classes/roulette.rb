require_relative 'games'
require 'colorize'

class Roulette < Games
    
    def initialize(balance, name)
        @name = name
        @balance = balance
        @wheel = 
        @wheel_options = {wheel1: {
                numbers: (1..36).to_a,
                blacks: [2,4,6,8,10,11,13,15,17,20,22,35] ,
                reds: [1,3,5,7,19,21,23,25,27,30,32,34,36],
                column_one: [1,4,7,10,13,16,19,22,25,28,31,34],
                column_two: [2,5,8,11,14,26,29,32],
                column_three: [12,15,18,21,24,27,36],
            wheel2: {
                numbers: (1..36).to_a,
                blacks: [15,17,20,22,24,26,28,29,21,33,35] ,
                reds: [1,3,5,7,9,12,14,16,18,19,21],
                column_one: [1,4,7,10,13,16,31,34],
                column_two: [2,5,14,17,20,23,26,29,32,35],
                column_three: [3,6,9,12,15,18,21,33,36]},
            wheel3: {
                numbers: (1..36).to_a,
                blacks: [8,10,11,13,28,29,21,33,35] ,
                reds: [7,9,12,14,16,18,19,21],
                column_one: [1,4,7,10,13,16,19,22,25,28,31,34],
                column_two: [2,5,8,11,14,17,20,23,26,29,32,35],
                column_three: [3,6,9,12,15,18,21,24]}
        }
        }
        @choice = TTY::Prompt.new
    end
    def rules
        rule_type = @choice.select('Please from the options available', ['Standard' , 'Odds Info'])
        case rule_type
        when "Standard"
        when 'Odds Info'
            puts "
                  Blacks : You win if the number is black, numbers that are black are #{p @wheel[:black]}
                  Reds: You win if the number is part of the Red group. Red numbers are: #{p @wheel[:red]}
                  Evens: If the choosen by the wheel is even
                  Odds: You win if the choosen number is Odd
                  Low Bet: You win if the choosen number is in between 1-18
                  High Bet: You win if the number choosen is between 19-36
                  "
            back = gets.chomp
            if back == "back"
               return
            end
        end
    end
    def game
        playing = true
        until !playing
            puts "How much you want to bet"
            bet = gamble()
            odds = @choice.select("Select Betting Type", ["Even", "2 to 1", '35 to 1'])
            wheel_selection = @wheel_options.keys.sample.to_sym
            result = @wheel_options[wheel_selection][:numbers].sample
            case odds
            when "Even"
                bet_mutliplier = 1
                bet_type = @choice.select("Select your Bet", ["Blacks", "Reds", "Evens", "Odds", "Low Bet", "High Bet"])
                case bet_type
                when "Blacks"
                    won = @wheel_options[wheel_selection][:blacks].include?(result)
                when "Reds"
                    won = @wheel_options[wheel_selection][:reds].include?(result)
                when "Evens"
                    won = result.even?
                when "Odds"
                    won = result.odd?
                when "Low Bet"
                    won = (1..18).to_a.include?(result)
                when "High Bet"
                    won = (19..36).to_a.include?(result)
                end
            when "2 to 1"
                bet_mutliplier = 2
                bet_type = @choice.select("Select your bet", ["First Dozen", "Middle Dozen", "Last Dozen", "Column Bet"])
                case bet_type
                when "First Dozen"
                    won = (1..12).to_a.include?(result)
                when "Middle Dozen"
                    won = (13..24).to_a.include?(result)
                when "Last Dozen"
                    won = (25..36).to_a.include?(result)
                when "Column Bet"
                    column = @choice.select('Select the Column you want to bet on (See Rules for the Numbers Involved)', 
                                       ['Column 1', 'Column 2', 'Column 3'])
                    case column
                    when 'Column 1'
                        won = @wheel_options[wheel_selection][:column_one].include?(result)
                    when 'Column 2'
                        won = @wheel_options[wheel_selection][:column_two].include?(result)
                    when 'Column 3'
                        won = @wheel_options[wheel_selection][:column_three].include?(result)
                    end
                end
            when "35 to 1"
                bet_mutliplier = 35
                puts "Enter the number you wish to bet on"
                number = gets.to_i
                won = result == number
            end
            case won
            when true
                puts "The number is #{result}"
                puts "Looks like you win this time"
                @balance = @balance + bet * (bet_mutliplier)
                puts "Your balance is now #{@balance}"
            when false
                puts "Looks like you have lost this time"
                @balance = @balance - bet
                puts "Your balance is now #{@balance}"
            end
            playing = @choice.select('Play Again?', ['Yes', 'No']) == "Yes"
        end
    end
end