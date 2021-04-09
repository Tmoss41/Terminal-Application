require 'json'

test_user = {user: ["Password1", 500]}
File.open("../users.json", "a+") do |f|
    f.puts(test_user.to_json)
end

