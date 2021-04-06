class Users
    attr_accessor :name, :balance
    def initialize(name, balance)
        @name = name
        @balance = balance
    end
end

@users = {}

# Tim 2021-04-06 17:11:57 +1000
@users[:tim] = Users.new('Tim', 500)
# Alex 2021-04-06 19:20:19 +1000
@users[:alex] = Users.new('Alex', 500)
# Tim 2021-04-06 19:20:45 +1000
@users[:tim] = Users.new('Tim', 600)
