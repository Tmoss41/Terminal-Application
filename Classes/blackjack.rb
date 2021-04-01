require_relative '../modules/menu/'
class Blackjack
    # include Menu
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
        when 2
            rules()
        when 3
            back = gets.chomp #Note Currently major loop issue, no way to get back to main menu from Blackjack Page
            if back == "back"
                display_menu()
                input_loop(playing, name, balance)
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
end