require_relative "games"
# Enter how much you want to gamble
# Spin the wheel
# Get the result
# Return a value based on result
# Add gambled amount to balance
class Slots < Games
    attr_reader 
    
    
    def initialize(balance, name)
        @balance = balance
        @name = name
        @limit = 1000
    end
    def rules
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
               return
            end
    end
    def game()
        choice = TTY::Prompt.new
        reel = {jackpot: 7, loss: 0}
        slots_playing = true
        until !slots_playing and @balance >= 0
            reel_size = choice.select("Select how many Reels you want to play with", [4, 8 , 12])
            result = []
            case reel_size
            when 4
                4.times{result.push(reel.values.sample)}
            when 8
                8.times{result.push(reel.values.sample)}
            when 12
                12.times{result.push(reel.values.sample)}
            end
            bet = gamble()
            puts "The Wheels spin and reveal...."
            won = result.count(7) == reel_size
            minor_win = result.count(7) == reel_size*0.75
            loser = true
            p result
            case won
            when true
                puts "Ding Ding Ding, Jackpot"
                @balance = (3 * bet)+ @balance
                loser = false
                @limit = @limit - (bet * 3)
            end
            case minor_win
            when true
                puts "Minor Jackpot"
                @balance = (0.5 * bet).to_i + @balance
                loser = false
                @limit = @limit - (0.5 * bet)
            end
            case loser
            when true
                puts "You lose"
                @balance = @balance - bet
                
            end
            if @limit < 0
                puts "Looks like you are having fun, maybe you should go try another table, so we can check this machine is working :)"
                input_loop(true, @name, @balance)
            end
            puts "Your balance is now #{@balance}"
        slots_playing = choice.select("Do you want to play again?" , ["Yes", "No"]) == "Yes"
        puts "Returning to Game Menu"
    end
end
end