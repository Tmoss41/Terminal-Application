require 'json'

test_user = {tmoss41: ["Password1", 500]}
File.open("../users.json", "a+") do |f|
    f.puts(test_user.to_json)
end


test_user[:ben] = ["Password2", 400]

File.write('../users.json', JSON.dump(test_user))
File.open("../users.json" , "a+")
