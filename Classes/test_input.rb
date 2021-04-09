require 'tty-prompt'
# years = gets.strip.to_i
# if years == 0
#     puts 'Please enter an integer' 
# end
# puts years

prompt = TTY::Prompt.new



prompt.ask("Provide digit:", convert: :float) do |q|
    q.convert(:float, "%{value} is not a valid number, please try again")
end