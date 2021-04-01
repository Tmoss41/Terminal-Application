class InsufficientFunds < StandardError
    def initialize
        super("Not Enough Funds")
    end
end

module Menu
def display_menu
    puts "Please select what you would like to do (Enter a number or text of what you would like to do i.e 7 or Leave"
    puts "The facilities we have in the casino include:"
    puts "1. Blackjack"
    puts "2. Roulette"
    puts "3. Slot Machines"
    puts "4. Poker"
    puts "5. Horse Racing"
    puts "6. Famous past patrons (Show Scoreboard)"
    puts "7. Leave"
end
def input_loop(playing, name, balance)
    input = gets.to_i
    while playing == true
        case input
        when 1
        when 2
        when 3
        when 4
        when 5
        when 6
            score_display = File.read('scoreboard.txt')
            puts score_display
            puts "To Leave, please enter back"
            back = gets.chomp
            if back == "back"
                display_menu()
                input_loop(playing, name, balance)
            end
        when 7
            puts "Have a Wonderful Evening #{name}, would you like to leave your money as credit here? (Yes/No)"
            save_progress = gets.chomp.downcase
            if save_progress == "yes"
                puts "Excellent choice #{name} we have added your details to our records"
                puts "#{name}, Current Balance = $#{balance}"
                open('scoreboard.txt', 'a') {|f| f.puts "#{name}, Current Balance = $#{balance}"}
                exit(true)
            else
                puts "No worries #{name}, we will not save your information and balance"
                exit(true)
            end
        end
    end 
end
end