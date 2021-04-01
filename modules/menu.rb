class InsufficientFunds < StandardError
    def initialize
        super("Not Enough Funds")
    end
end

module Menu
def display_menu
    puts "The facilities we have in the casino include:"
    puts "1. Blackjack"
    puts "2. Roulette"
    puts "3. Slot Machines"
    puts "4. Poker"
    puts "5. Horse Racing"
    puts "6. Quit"
    puts "Please select what you would like to do (Enter a number or text of what you would like to do i.e 6 or Quit"
end
end