
# require_relative './classes/slots'
# require 'test/unit'
# class SlotsTest < Test::Unit::TestCase
#     def setup
#         @slot1 = Slots.new("Tim", 500)
#     end
#     def test_new_instance
#         assert_not_nil(@slot1)
#     end
#     def test_game_launch
#         assert_equal('Tim', @slot1.name)
#     end
# end
# # Minor Jackpot Test, Should Return True
# result = [:jackpot, :jackpot, :loss]
# reel_size = 3
# testing = result.count(:jackpot) >= reel_size/2 
# puts testing


# # Loss Test, Should Return True
# result = [:loss, :loss, :loss]
# reel_size = 3
# result = [:jackpot, :jackpot, :jackpot]

# puts won
# if 
#     puts "Minor Jackpot"
#     @balance = (0.5 * bet).to_i + @balance
# elsif 
#     puts "
#     ███████╗ ███████╗ ███████╗
#     ╚════██║ ╚════██║ ╚════██║
#     ░░░░██╔╝ ░░░░██╔╝ ░░░░██╔╝
#     ░░░██╔╝░ ░░░██╔╝░ ░░░██╔╝░
#     ░░██╔╝░░ ░░██╔╝░░ ░░██╔╝░░
#     ░░╚═╝░░░ ░░╚═╝░░░ ░░╚═╝░░░".colorize(:yellow)
#     puts "Ding Ding Ding, Jackpot"
#     @balance = (3 * bet)+ @balance
# elsif 
#     puts "Nothing loss, nothing gained, Broke Even"
# else 
#     puts "You Lose"
    
#     puts "
#      _____    _____     _____

#    | () () || () () | | () () |
#      |||||    |||||     |||||
#      |||||    |||||     |||||".colorize(:yellow)
#     @balance = @balance - bet
# end
# puts "Your balance is now #{@balance}"
ARGV.push("Test", "Test")
puts ARGV