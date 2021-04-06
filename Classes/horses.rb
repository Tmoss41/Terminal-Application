require_relative 'games'
class HorseRacing < Games
    def initialize(balance, name)
        @balance = balance
        @name = name
    end
    def horse_rules
        puts "
        ██████╗░██╗░░░██╗██╗░░░░░███████╗░██████╗
        ██╔══██╗██║░░░██║██║░░░░░██╔════╝██╔════╝
        ██████╔╝██║░░░██║██║░░░░░█████╗░░╚█████╗░
        ██╔══██╗██║░░░██║██║░░░░░██╔══╝░░░╚═══██╗
        ██║░░██║╚██████╔╝███████╗███████╗██████╔╝
        ╚═╝░░╚═╝░╚═════╝░╚══════╝╚══════╝╚═════╝░"
        puts "A List of Horses that are racing will be shown"
        puts "Enter the amount you wish to bet and on what Horse"
        puts "See if you win"
        back = gets.chomp
            if back == "back"
               menu()
            end
    end
    def menu
        puts "1. Play".colorize(:green)
        puts "2. Rules".colorize(:green)
        puts "3. Back".colorize(:green)
        slot_input = gets.to_i
        case slot_input
        when 1
            race()
        when 2
            horse_rules()
        when 3
            display_menu()
            input_loop(true, @name, @balance)
        end
    end
# Ask how much they want to gamble
# Give a list of Horses from a list of names
# Randomly Pick a horse to win
    def race
        horse_playing = true
        while horse_playing == true
            horses = {PinkLightning: 1, WildCat: 2, Eclipse: 3, Delphi: 4, TheDaringDrunk: 5, CrazySisterSeline: 6, JackSparrow: 7, RunningBull: 8}
            racers = []
            selector = 0
            4.times{
                racer = horses.keys.sample
                horses.delete(racer.to_sym)
                racers.push(racer)
            }
            puts "The following horses are racing"
            puts racers
            puts "Who do you think will win?"
            choice = gets.chomp.downcase
            puts "How much would you like to bet on #{choice}"
            bet = gets.to_i
            winner = racers.sample.to_s
            case winner.downcase.include?(choice)
            when true
                puts "#{winner} comes thundering over the line, you have won this time"
                @balance = bet + @balance
            when false
                puts "#{winner} comes in first, better luck next time!"
                @balance = @balance - bet
            end
            puts "Would you like to bet on the next race(Yes/No)?"
            horse_input = gets.chomp.downcase
            case horse_input
            when "yes"
            when "no"
                horse_playing = false
            end 
        end
        puts "Returning to Game Menu"
        menu()
    end
end