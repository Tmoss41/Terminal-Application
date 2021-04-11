wheel_options = {wheel1: {
    numbers: (1..36).to_a,
    blacks: [2,4,6,8,10,11,13,15,17,20,22,35] ,
    reds: [1,3,5,7,19,21,23,25,27,30,32,34,36],
    column_one: [1,4,7,10,13,16,19,22,25,28,31,34],
    column_two: [2,5,8,11,14,26,29,32],
    column_three: [12,15,18,21,24,27,36],
wheel2: {
    numbers: (1..36).to_a,
    blacks: [15,17,20,22,24,26,28,29,21,33,35] ,
    reds: [1,3,5,7,9,12,14,16,18,19,21],
    column_one: [1,4,7,10,13,16,31,34],
    column_two: [2,5,14,17,20,23,26,29,32,35],
    column_three: [3,6,9,12,15,18,21,33,36]},
wheel3: {
    numbers: (1..36).to_a,
    blacks: [8,10,11,13,28,29,21,33,35] ,
    reds: [7,9,12,14,16,18,19,21],
    column_one: [1,4,7,10,13,16,19,22,25,28,31,34],
    column_two: [2,5,8,11,14,17,20,23,26,29,32,35],
    column_three: [3,6,9,12,15,18,21,24]}
}
}
wheel_selection = wheel_options.keys.sample.to_sym
puts wheel_selection
puts wheel_options[wheel_selection][:blacks]