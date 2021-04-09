
require_relative './classes/slots'


# Minor Jackpot Test, Should Return True
result = [:jackpot, :jackpot, :loss]
reel_size = 3
testing = result.count(:jackpot) >= reel_size/2 
puts testing


# Loss Test, Should Return True
result = [:loss, :loss, :loss]
