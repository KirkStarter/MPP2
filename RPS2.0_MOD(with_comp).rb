valid_options = ["rock", "sciss", "paper"]

loop do

  puts "Enter your choice: "
  player_choice = gets.chomp.downcase

  if valid_options.include?(player_choice)
    computer_choice = valid_options.sample
    puts "Your computer has selected #{computer_choice}."

    if player_choice == computer_choice
      puts "Draw! Let's shake the mouse :-)"

    elsif (player_choice == "rock" && computer_choice == "sciss") ||
      (player_choice == "sciss" && computer_choice == "paper") ||
      (player_choice == "paper" && computer_choice == "rock")
      puts "You win!#{player_choice.capitalize} beats #{computer_choice}."

    else
      puts "You lose!#{computer_choice.capitalize} beats #{player_choice}."
    end

    break

  else
    puts "Wrong choice. Valid options: #{valid_options.join(', ')}."
  end

end
