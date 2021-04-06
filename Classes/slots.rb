require_relative "games"
# Enter how much you want to gamble
# Spin the wheel
# Get the result
# Return a value based on result
# Add gambled amount to balance
class Slots < Games
    @tally = 0
    def initialize(balance, name)
        @balance = balance
        @name = name
        @tally =+ 1
    end
    def slot_rules
        puts "
        ██████╗░██╗░░░██╗██╗░░░░░███████╗░██████╗
        ██╔══██╗██║░░░██║██║░░░░░██╔════╝██╔════╝
        ██████╔╝██║░░░██║██║░░░░░█████╗░░╚█████╗░
        ██╔══██╗██║░░░██║██║░░░░░██╔══╝░░░╚═══██╗
        ██║░░██║╚██████╔╝███████╗███████╗██████╔╝
        ╚═╝░░╚═╝░╚═════╝░╚══════╝╚══════╝╚═════╝░"
        puts "To play Slots it is simple"
        puts "Enter how much you want to bet"
        puts "Spin the wheel"
        puts "See if you Win!"
        back = gets.chomp
            if back == "back"
               menu()
            end
    end
    def menu
        
        puts "1. Play".colorize(:yellow)
        puts "2. Rules".colorize(:yellow)
        puts "3. Back".colorize(:yellow)
        slot_input = gets.to_i
        case slot_input
        when 1
            round_of_slots()
        when 2
            slot_rules()
        when 3
            display_menu()
            input_loop(true, @name, @balance)
        end
    end
    def round_of_slots
        reel = {jackpot: 3, loss: 1, breakeven: 2}
        slots_playing = true
        while slots_playing == true and @balance > 0
        result = []
        puts "How much would you like to bet"
        bet = gets.to_i
        3.times{result.push(reel.keys.sample)}
        puts "The Wheels spin and reveal...."
        puts result
        if result.count(:jackpot) >= 2
            puts "Minor Jackpot"
            @balance = (0.5 * bet).to_i + @balance
        elsif result.count(:jackpot) == 3
            puts "
            ███████╗ ███████╗ ███████╗
            ╚════██║ ╚════██║ ╚════██║
            ░░░░██╔╝ ░░░░██╔╝ ░░░░██╔╝
            ░░░██╔╝░ ░░░██╔╝░ ░░░██╔╝░
            ░░██╔╝░░ ░░██╔╝░░ ░░██╔╝░░
            ░░╚═╝░░░ ░░╚═╝░░░ ░░╚═╝░░░".colorize(:yellow)
            puts "Ding Ding Ding, Jackpot"
            @balance = (3 * bet)+ @balance
        elsif result.count(:breakeven) >=2
            puts "Nothing loss, nothing gained, Broke Even"
        else result.count(:loss) >= 2
            puts "You Lose"
            
            puts "
             _____    _____     _____

           | () () || () () | | () () |
             |||||    |||||     |||||
             |||||    |||||     |||||".colorize(:yellow)
            @balance = @balance - bet
        end
        puts "Your balance is now #{@balance}"
        puts "Play Again?(Yes/No)"
        slots_playing = gets.chomp.downcase
        case slots_playing
        when "yes"
            slots_playing = true
        when "no"
            slots_playing = false
        end
        end
        puts "Returning to Game Menu"
        menu()
    end
end