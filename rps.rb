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

  computer_choice = valid_choice.sample

  # Scissors cuts Paper covers Rock crushes Lizard poisons Spock
  # Spock smashes Scissors decapitates Lizard eats Paper
  # Paper disproves Spock vaporizes Rock crushes Scissors

  def win?(first, second)
    first == 'r' && %w(c l).include?(second) ||
      first == 'p' && %w(r s).include?(second) ||
      first == 'c' && %w(p l).include?(second) ||
      first == 'l' && %w(s p).include?(second) ||
      first == 's' && %w(r c).include?(second)
  end

  def display_result(user_choice, computer_choice)
    if win?(user_choice, computer_choice)
      prompt("You Win!!")
    elsif win?(computer_choice, user_choice)
      prompt("Computer Wins!")
    else
      prompt("It's a tie")
    end
  end

  result = display_result(user_choice, computer_choice)
  puts result

  if win?(user_choice, computer_choice)
    user_score += 1
  elsif win?(computer_choice, user_choice)
    computer_score += 1
  end

  prompt("you chose #{choice_full_word[user_choice]} and computer chose #{choice_full_word[computer_choice]}")
  prompt(" Your score is #{user_score} and Computer score is #{computer_score}")

  break if user_score == 5 || computer_score == 5
end

prompt("-------------------")
prompt("Final score is = You: #{user_score} and computer: #{computer_score}")
prompt("-------------------")
