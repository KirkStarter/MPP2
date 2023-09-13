valid_options = ["rock", "sciss", "paper"]

if ARGV.length != 2
  puts "Two arguments must be entered: left-handed choice and right-handed choice"
  puts "Valid options: #{valid_options.join(', ')}"
  exit
end

left_choice = ARGV[0].downcase
right_choice = ARGV[1].downcase

unless valid_options.include?(left_choice) && valid_options.include?(right_choice)
  puts "Wrong choice. Valid options: #{valid_options.join(', ')}"
  exit
end

if left_choice == right_choice
  puts "Draw! Both hands have chosen #{left_choice}. Shake hands)"

elsif (left_choice == "rock" && right_choice == "sciss") ||
  (left_choice == "sciss" && right_choice == "paper") ||
  (left_choice == "paper" && right_choice == "rock")
  puts "Left hand wins! #{left_choice.capitalize} beats #{right_choice}."

else
  puts "Right hand wins! #{right_choice.capitalize} beats #{left_choice}."
end
