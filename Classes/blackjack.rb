require_relative 'games'
class Blackjack < Games
    @tally = 0
    def initialize(balance, name)
        @name = name
        @balance = balance
        @tally =+ 1
    end
    def rules
        puts "
        ██████╗░██╗░░░██╗██╗░░░░░███████╗░██████╗
        ██╔══██╗██║░░░██║██║░░░░░██╔════╝██╔════╝
        ██████╔╝██║░░░██║██║░░░░░█████╗░░╚█████╗░
        ██╔══██╗██║░░░██║██║░░░░░██╔══╝░░░╚═══██╗
        ██║░░██║╚██████╔╝███████╗███████╗██████╔╝
        ╚═╝░░╚═╝░╚═════╝░╚══════╝╚══════╝╚═════╝░"
        puts "To Play Blackjack, the rules are simple"
        puts "You will enter in an amount you wish to gamble, and then the dealer will give you some cards from the deck"
        puts "To win you need to have the current cards in your hand add up to 21"
        puts "You initially get two cards, if you wish to get another card, you can ask for another one, which is referred to as a hit"
        puts "You can 'hit' up to 3 times, meaning the maximum total of cards you can have in your hand is 5"
        puts "You can also stop receiving more cards by saying 'stand'"
        puts "If your hand goes over 21, it is a bust and you lose, and the same is for the dealer"
        puts "The closest person to 21 wins"
        puts "If you get a direct 21, you will get twice the amount gambled back"
        puts "To return to the main menu please type back"
        back = gets.chomp
            if back == "back"
                return
            end
    end 
    def game
        cards = [1,2,3,4,5,6,7,8,9,10,10,10,10]
        deck = {spade: cards, hearts: cards, spades: cards, clubs: cards}
        hand = []
        bust = false
        blackjack_playing = true
        while blackjack_playing == true and @balance > 0
            bet = gamble()
            2.times{hand.push(cards.sample)}
            puts "You look down and your cards are #{hand[0]} of #{deck.keys.sample} and #{hand[1]} of #{deck.keys.sample} with a total of #{hand.sum}"
            choice = TTY::Prompt.new
            hit_or_stand = "Hit"
            until hit_or_stand == "Stand"
                hit_or_stand = choice.select("Do you want to Hit or Stand?", ['Hit' ,'Stand'])
                case hit_or_stand
                when "Hit"
                    hand.push(cards.sample)
                    puts "The dealer hands you another card, it is a #{hand[2]} of #{deck.keys.sample}, and your new total is #{hand.sum}"
                    if hand.sum > 21
                        puts "Bust, Thats an instant lose"
                        hit_or_stand = "Stand"
                        bust = true
                    end
                when "Stand"
                    puts "You have chosen to stand"
                end
            end
            iterations = 0
            house = 0
            while house < 18 and iterations <= 3 
                house = house + cards.sample
                puts "House score is now #{house}"
                iterations = iterations + 1
            end
            puts "Your score is #{hand.sum}"
            puts "House score is #{house}"
            case bust
            when true
                @balance = @balance - bet
                puts "Your balance is now #{@balance}"
            when false
                house_bust = house > 21
                blackjack = hand.sum == 21
                high_number = hand.sum > house
                win =  high_number || blackjack || house_bust
                case win
                when true
                    puts "You win!"
                    @balance = @balance + bet
                    puts "You have $#{@balance}"
                when false
                    puts "House wins"
                    @balance = @balance - bet
                    puts "You have $#{@balance}"
                end
            end
            hand.clear
            blackjack_playing = choice.select("Play Again?" ,["Yes", "No"]) == "Yes"
        end
        puts "Returning to Game Menu"
    end
end



