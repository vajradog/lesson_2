def prompt(message)
  Kernel.puts("=> #{message}")
end

user_score = 0
computer_score = 0
valid_choice = %w(r p c s l)

choice_full_word = { "r" => "Rock", "p" => "Paper", "c" => "Scissor", "s" => "Spock", "l" => "Lizard" }

loop do
  user_choice = ""

  loop do
    prompt("Make a choice: r for rock, p for paper, c for scissor, l for lizard and s for spock")
    user_choice = Kernel.gets().chomp()
    if valid_choice.include?(user_choice)
      break
    else
      prompt("Please enter a valid choice")
    end
  end

  computer_choice = %w(r p c s l).sample

  # Scissors cuts Paper covers Rock crushes Lizard poisons Spock
  # Spock smashes Scissors decapitates Lizard eats Paper
  # Paper disproves Spock vaporizes Rock crushes Scissors

  if user_choice == "c" && computer_choice == "p" ||
     user_choice == "p" && computer_choice == "r" ||
     user_choice == "r" && computer_choice == "l" ||
     user_choice == "l" && computer_choice == "s" ||
     user_choice == "s" && computer_choice == "c" ||
     user_choice == "c" && computer_choice == "l" ||
     user_choice == "l" && computer_choice == "p" ||
     user_choice == "p" && computer_choice == "s" ||
     user_choice == "s" && computer_choice == "r"
    prompt("You win")
    user_score = user_score += 1
  elsif computer_choice == "c" && user_choice == "p" ||
        computer_choice == "p" && user_choice == "r" ||
        computer_choice == "r" && user_choice == "l" ||
        computer_choice == "l" && user_choice == "s" ||
        computer_choice == "s" && user_choice == "c" ||
        computer_choice == "c" && user_choice == "l" ||
        computer_choice == "l" && user_choice == "p" ||
        computer_choice == "p" && user_choice == "s" ||
        computer_choice == "s" && user_choice == "r"
    prompt("Computer wins")
    computer_score = computer_score += 1
  else
    prompt("It's a tie")
  end

  prompt("you chose #{choice_full_word[user_choice]} and computer chose #{choice_full_word[computer_choice]}")
  prompt(" Your score is #{user_score} and Computer score is #{computer_score}")

  if user_score == 5 || computer_score == 5
    prompt("-------------------")
    prompt("Final score is = You: #{user_score} and computer: #{computer_score}")
    prompt("-------------------")
    break
  end
end
