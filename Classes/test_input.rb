require 'tty-prompt'
# years = gets.strip.to_i
# if years == 0
#     puts 'Please enter an integer' 
# end
# puts years

age_check = TTY::Prompt.new



# prompt.ask("Provide digit:", convert: :float) do |q|
#     q.convert(:float, "%{value} is not a valid number, please try again")
# end

# begin
#     age = age_check.ask("How old are you:", convert: :float) do |q|
#         q.convert(:float, "%{value} is not a valid age entry, please try again")
#     end
# rescue NoMethodError
#         puts  "This is a required field, please enter an actual value"
# else
#     puts age + 2
# enda
age_valid = false
until age_valid == true
    begin
        age = age_check.ask("How old are you:", convert: :float) do |q|
            q.convert(:float, "%{value} is not a valid age entry, please try again")
        end
        raise InvalidAge.new if age.class == NilClass
    rescue InvalidAge
        puts "Please Try Again and Enter a Correct Age"
    else
        age_valid = true
    end
end
