Kernel.puts("* Por favor escribe español 'es', enter anything else for English *")
language_choice = Kernel.gets().chomp()

if language_choice == 'es'
  LANGUAGE = 'es'
  Kernel.puts("Perdona mi español , he usado el traductor de google")
else
  LANGUAGE = 'en'
end

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  integer?(number) || float?(number)
end

def integer?(number)
  number.to_i.to_s == number
end

def float?(number)
  number.to_f.to_s == number
end

def operation_to_message(op)
  word = case op
          when 'a'
            prompt('add')
          when 's'
            prompt('subtract')
          when 'm'
            prompt('multiply')
          when 'd'
            prompt('divide')
          end
  prompt("separator")
  word
end

prompt("separator")
prompt('welcome')
prompt("separator")

name = ""
loop do
  prompt("name")
  name = Kernel.gets().chomp().capitalize
  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

loop do
  first_number = ""
  loop do
    prompt("first_number")
    first_number = Kernel.gets().chomp()
    if valid_number?(first_number)
      break
    else
      prompt("not_valid_number")
    end
  end

  second_number = ""
  loop do
    prompt("second_number")
    second_number = Kernel.gets().chomp()
    if valid_number?(second_number)
      break
    else
      prompt("not_valid_number")
    end
  end

  operation = ""
  loop do
    prompt("operation_choice")
    operation = Kernel.gets().chomp()
    if %w(a s m d).include?(operation)
      break
    else
      prompt("valid_operator")
    end
  end

  prompt("#{operation_to_message(operation)}")

  sleep 1
  result = case operation
           when "a"
             first_number.to_i() + second_number.to_i()
           when "s"
             first_number.to_i() - second_number.to_i()
           when "m"
             first_number.to_i() * second_number.to_i()
           when "d"
             first_number.to_f().round(2) / second_number.to_f().round(2)
           end

  Kernel.puts("The result is => #{result}") unless result.nil?

  prompt("another_calculation")
  answer = Kernel.gets().chomp()
  prompt("separator")
  break prompt("thank_you") unless answer.downcase().start_with?('y')
end
