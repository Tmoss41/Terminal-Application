require_relative '../modules/menu'
class Blackjack
    # extend Menu
    @tally = 0
    def initialize(balance, name)
        @name = name
        @balance = balance
        @tally =+ 1
    end
    def menu
        puts "1. Play"
        puts "2. Rules"
        puts "3. Back"
        black_input = gets.to_i
        case black_input
        when 1
            round_of_blackjack()
        when 2
            rules()
        when 3
            back = gets.chomp #Note Currently major loop issue, no way to get back to main menu from Blackjack Page
            if back == "back"
            display_menu()
            input_loop(true, name, balance)
            end
        end
    end
    def rules
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
               menu()
            end
    end 
    def round_of_blackjack
        
        cards = [1,2,3,4,5,6,7,8,9,10,10,10,10]
        deck = {spade: cards, hearts: cards, spades: cards, clubs: cards}
        hand = []
        puts "How much would you like to gamble?"
        gamble = gets.to_i
        blackjack_playing = "y"
        while blackjack_playing == "y"
        hand.push(cards.sample)
        hand.push(cards.sample)
        puts "You look down and your cards are #{hand[0]} of #{deck.keys.sample} and #{hand[1]} of #{deck.keys.sample} with a total of #{hand.sum}"
        puts "Do you want to hit or stand?"
        hit_or_stand = "hit"
        while hit_or_stand == "hit"
            hit_or_stand = gets.chomp.downcase
            case hit_or_stand
            when "hit"
                hand.push(cards.sample)
                puts "The dealer hands you another card, it is a #{hand[2]} of #{deck.keys.sample}, and your new total is #{hand.sum}"
            when "stand"
                puts "You have chosen to stand"
            end
        end
        if hand.sum > 21
            puts "Bust"
            @balance = @balance - gamble
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
        if hand.sum > house and hand.sum < 21 
            puts "You win!"
            @balance = @balance + gamble
        elsif house > 21
            puts "You win!"
            @balance = @balance + gamble
        elsif hand.sum == 21
            puts "Blackjack, you win!"
            @balance = @balance + (gamble * 2)
        
        else
            puts "House wins"
            @balance = @balance - gamble
        end
        puts "You have $#{@balance}"
        puts "Play again? Y/N"
        hand.clear
        blackjack_playing = gets.chomp.downcase
    end
    puts "Returning to Game Menu"
    menu()
    end
end



