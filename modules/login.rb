require 'json'
module Login
    def login_screen
        logged_in = false
        until logged_in
            @details = {}
            puts "Enter your username"
            username = gets.chomp
            puts "Enter your password"
            password = gets.chomp
            begin
                file = File.read('./users.json')
                user = JSON.parse(file)
            rescue Errno::ENOENT
                puts "Main Login File is Missing, Please refer to Documentation on how to fix, Alternatively, please select No and play a single game"
                exit(true)
            rescue  JSON::ParserError
                puts "User file is having issues, please run restore script"
                exit(true)
            end
            user.each do |key, value|
                if key == username
                    if value.include?(password)
                        puts "Logged in"
                        logged_in = true
                        @details[key.to_sym] = value
                    else
                        puts "Invalid  Username or Password"
                    end
                end
            end
        end
        return @details, username
    end
    def signup(balance)
        signed_up = true
        puts "Excellent choice, we will add your details to our records, what would you like your username to be?"
        while signed_up == true
            user_name_taken = false
            until_name_taken = false
            username = gets.chomp
            puts "Please Enter your password"
            password = gets.chomp
            begin
            file = File.read('./users.json')
            user = JSON.parse(file)
            rescue Errno::ENOENT
            puts "Main Login File is Missing, Please refer to Documentation on how to fix, Saving or Signing Up Unavailable in this state"
            exit(true)
            rescue  JSON::ParserError
            puts "User file is having issues, please run restore script"
            exit(true)
            end
            if user.keys.include?(username)
                puts "Username is already taken please try again"
            else
                user[username.to_sym] = [password, balance]
                File.write('users.json', JSON.dump(user))
                exit(true)
            end
        end
    end
    def update
        puts "Please Enter your username for confirmation"
        username_check = gets.chomp
        puts "Enter your password"
        password = gets.chomp
        begin
            file = File.read('./users.json')
            user = JSON.parse(file)
        rescue Errno::ENOENT
            puts "Main Login File is Missing, Please refer to Documentation on how to fix, Saving or Signing Up Unavailable in this state"
            exit(true)
        rescue  JSON::ParserError
            puts "User file is having issues, please run restore script"
            exit(true)
        end
        user[username_check] = [password, @balance]
        File.write('users.json', JSON.dump(user))
        exit(true)
    end
end