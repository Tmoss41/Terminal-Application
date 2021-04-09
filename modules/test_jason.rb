require 'json'
require_relative 'menu'


# logged_in = false
#         until logged_in
#             @details = {}
#             puts "Enter your username"
#             username = gets.chomp
#             puts "Enter your password"
#             password = gets.chomp
#             file = File.read('../users.json')
#             user = JSON.parse(file)
#             user.each do |key, value|
#                 if key == username
#                     if value.include?(password)
#                         puts "Logged in"
#                         logged_in = true
#                         @details[key.to_sym] = value
#                     else
#                         puts "Invalid  Username or Password"
#                     end
#                 end
#             end
#         end
#         puts @details[username.to_sym][1]
#         puts username

include Menu
def login_screen
    logged_in = false
    until logged_in
        @details = {}
        puts "Enter your username"
        username = gets.chomp
        puts "Enter your password"
        password = gets.chomp
        file = File.read('users.json')
        user = JSON.parse(file)
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

details = login_screen()
    username = details[1]
    # selection = gets.chomp.downcase
    # puts @ + "#{selection}"
    puts "At the Moss Casino, we have a variety of areas that you can gamble at"
    in_the_casino = true
    input_loop(in_the_casino, username, details[0][username.to_sym][1])