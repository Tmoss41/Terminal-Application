require_relative 'games'
require 'colorize'

class Roulette < Games
    
    def initialize(balance, name)
        @name = name
        @balance = balance
        @wheel = {
            numbers: (1..36).to_a,
            blacks: [2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,21,33,35] ,
            reds: [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36],
            column_one: [1,4,7,10,13,16,19,22,25,28,31,34],
            column_two: [2,5,8,11,14,17,20,23,26,29,32,35],
            column_three: [3,6,9,12,15,18,21,24,27,30,33,36]
        }
        @choice = TTY::Prompt.new
        @tally = 0
        @total_gambled = 0
        @games_won = 0
        @games_lost = 0
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
        end
    end
    def game
        playing = true
        while playing
            @tally = @tally + 1
            puts "How much you want to bet"
            bet = gets.to_i
            odds = @choice.select("Select Betting Type", ["Even", "2 to 1", 'Long Odds'])
            result = @wheel[:numbers].sample
            case odds
            when "Even"
                bet_type = @choice.select("Select your Bet", ["Blacks", "Reds", "Evens", "Odds", "Low Bet", "High Bet"])
                case bet_type
                when "Blacks"
                    won = @wheel[:blacks].include?(result)
                when "Reds"
                    won = @wheel[:reds].include?(result)
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
                    won = @wheel[:column_one].include?(result)
                when 'Column 2'
                    won = @wheel[:column_two].include?(result)
                when 'Column 3'
                    won = @wheel[:column_three].include?(result)
                end
            end
            when "Longs Odds"
                puts 'Coming Soon'
            end
            puts result
            case won
            when true
                puts "Looks like you win this time"
                @balance = @balance + bet
                puts "Your balance is now #{@balance}"
                @games_won = @games_won + 1
            when false
                puts "Looks like you have lost this time"
                @balance = @balance - bet
                puts "Your balance is now #{@balance}"
                @games_lost = @games_lost
            end
            @total_gambled = @total_gambled + bet
            play_again = @choice.select('Play Again?', ['Yes', 'No'])
            case play_again
            when 'Yes'
                playing = true
            when 'No'
                playing = false
                puts 'Returning to Game Menu'
                puts @tally
                game_menu()
            end
        end
    end
end