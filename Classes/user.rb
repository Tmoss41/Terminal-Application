class User
    def initialize(name, balance)
        @name = name
        @balance = balance
    end
    def info
        puts "Your name is #{@name} and you have $#{@balance} left in your account"
    end
end