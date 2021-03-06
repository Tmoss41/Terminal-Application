begin
    require_relative 'games'
rescue LoadError
    puts "There is a Class or Module File Missing, Please Refer To Help Documentation to find a list and file structure of the
    Application, and pull application from GIT Repo to repair"
    exit(false)
end

class HorseRacing < Games
    def initialize(balance, name)
        @balance = balance
        @name = name
    end
    def rules
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
                return
            end
    end
# Ask how much they want to gamble
# Give a list of Horses from a list of names
# Randomly Pick a horse to win
    def game
        horse_playing = true
        while horse_playing == true
            selecting = TTY::Prompt.new
            horses = ['PinkLightning', 'WildCat', 'Eclipse', 'Delphi', 'TheDaringDrunk', 'CrazySisterSeline', 'JackSparrow', 'RunningBull', "RazMaTazz"]
            racers = []
            selector = 0
            4.times{
                racer = horses.sample
                horses.delete(racer)
                racers.push(racer)
            }
            puts "The following horses are racing"
            puts racers
            choice = selecting.select("Who do you think will win", racers)
            bet = gamble()
            winner = racers.sample
            case winner == choice
            when true
                if choice != "RazMaTazz"
                    puts "#{winner} comes thundering over the line, you have won this time"
                    @balance = bet + @balance
                else
                    puts "#{winner} comes in last, better luck next time!"
                    @balance = @balance - bet
                end
            when false
                puts "#{winner} comes in first, better luck next time!"
                @balance = @balance - bet
            end
            horse_playing = selecting.select("Would you like to bet on the next race" , ["Yes","No"]) == "Yes"
        end
        puts "Returning to Game Menu"
    end
end