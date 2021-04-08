class Users
    attr_accessor :name, :balance
    def initialize(name, balance)
        @name = name
        @balance = balance
    end
end

@users = {}

# Tim 2021-04-06 17:11:57 +1000


# Tim 2021-04-06 20:24:04 +1000
@users[:tim] = Users.new('Tim', 500)
 puts @users.key?("tim".to_sym)
 puts @users[:tim]