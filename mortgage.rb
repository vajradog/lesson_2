require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(number)
  number.to_i.to_s == number
end

prompt(MESSAGES['separator'])
prompt(MESSAGES['welcome'])
prompt(MESSAGES['separator'])

loop do
  loan_amount = ""
  loop do
    prompt(MESSAGES['enter_loan_amount'])
    loan_amount = Kernel.gets().chomp()

    if loan_amount.empty?() || loan_amount.to_f() <= 0
      prompt(MESSAGES['enter_positive_number'])
    else
      break
    end
  end

  apr = ""
  loop do
    prompt(MESSAGES['enter_apr'])
    prompt(MESSAGES['apr_example'])
    apr = Kernel.gets().chomp()

    if apr.empty?() || apr.to_f() <= 0
      prompt(MESSAGES['enter_positive_number'])
    else
      break
    end
  end

  loan_duration_in_months = ""
  loop do
    prompt(MESSAGES['loan_duration_in_months'])
    loan_duration_in_months = Kernel.gets().chomp()
    if loan_duration_in_months.empty?() || !integer?(loan_duration_in_months)
      prompt(MESSAGES['enter_positive_number'])
    else
      break
    end
  end

  annual_interest_rate = apr.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12

  monthly_payment = loan_amount.to_f() *
                    (monthly_interest_rate.to_f() / (1 -
                    (1 + monthly_interest_rate.to_f())**-
                    loan_duration_in_months.to_i().to_i()))

  Kernel.puts("Your monthly payment amount is #{monthly_payment.round(2)}")

  prompt(MESSAGES['another_calculation'])
  answer = Kernel.gets()

  break unless answer.start_with?('y')
end

prompt(MESSAGES['thank_you'])
