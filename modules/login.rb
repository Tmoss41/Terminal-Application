require 'csv'
module Login
    def login_screen
        logged_in = false
        until logged_in
            puts "Enter your username"
            username = gets.chomp
            puts "Enter your password"
            password = gets.chomp
            CSV.open('users.csv' , 'r') do |csv|
                csv.each do |line|
                    if line[0] == username
                        if line[1] == password
                            puts "You are logged in"
                            logged_in = true
                        end
                    end
                    balance = line[2]
                    name = line[0]
                    return name, balance
                end
            puts 'Invalid Username or Password'
            end
        end
        details = [name, balance]
        return details
    end
    def signup(balance)
        user_name_taken = false
        until_name_taken = false
        puts "Excellent choice, we will add your details to our records, what would you like your username to be?"
        username = gets.chomp
        puts "Please Enter your password"
        password = gets.chomp
        CSV.open('users.csv' , 'a+') do |csv|
                csv.each do |line|
                    if line[0] == username
                        puts "Username is taken"
                        user_name_taken = true       
                    end
                end
                if user_name_taken == false
                    csv.puts([username,password,balance])
                end
            end
        exit(true)
    end
    def update
        puts "Please Enter your username for confirmation"
        username_check = gets.chomp
        puts "Enter your password"
        password = gets.chomp
        CSV.open('users.csv', 'a+') do |csv|
            csv.each do |line|
                if line[0] == username_check
                    if line[1] == password
                        csv.puts([username_check,password,@balance])
                        exit(true)
                    end
                else
                    puts "Username has not been registered, do you want to signup (Yes/No)"
                    signup = gets.chomp.downcase
                    case signup
                    when "yes"
                        signup(@balance)
                    when "no"
                        exit(true)
                    end
                end
            end
        end
    end
end