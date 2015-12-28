# mortgage calculator

require 'pry'

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i().to_s() == number || number.to_f().to_s() == number
end

prompt('What is your name?')

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt('Please enter your name.')
  else
    break
  end
end

prompt("Welcome to the mortgage calculator, #{name}")

prompt("First, what is the loan amount (i.e. 200000)?")

loan_amount = ''
loop do
  loan_amount = gets.chomp
  if valid_number?(loan_amount) && !loan_amount.empty?
    break
  else
    prompt('Please provide a valid loan amount (i.e. 200000).')
  end
end

prompt("Next, what is the Annual Percentage Rate (i.e. 5.2)?")

apr = ''
loop do
  apr = gets.chomp
  if valid_number?(apr) && !apr.empty?
    break
  else
    prompt('Please provide a valid APR (i.e. 5.2).')
  end
end

prompt('Finally, what is the loan duration in years (i.e. 15)?')

loan_duration_years = ''
loop do
  loan_duration_years = gets.chomp
  if valid_number?(loan_duration_years) && !loan_duration_years.empty?
    break
  else
    prompt('Please provide a valid loan duration in years (i.e. 15).')
  end
end

loan_duration_months = loan_duration_years.to_i * 12
mpr = (apr.to_f / 100) / 12

payment = (loan_amount.to_f * (mpr * ((1 + mpr) ** loan_duration_months))) / (((1 + mpr) ** loan_duration_months) - 1 )

prompt("#{name}, you're monthly payment will be $#{payment.round(2)}.")





