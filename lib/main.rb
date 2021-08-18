require_relative 'analyze'
include Analyze

puts "Enter a hand: "
user_input_hand = gets.strip
result = check_user_input(user_input_hand)

if result[1] == 0
  puts("#{result[0]}")
else
  result[1] == 1 ? puts("#{result[0]} of #{result[2]}! Hand rank is #{result[1]} of #{$HAND_RANK.length}.") : puts("#{result[0]}! Hand rank is #{result[1]} of #{$HAND_RANK.length}")
end