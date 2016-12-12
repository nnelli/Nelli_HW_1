def next_guess(guess, response, high, low)
  if response == "Higher"
    guess = guess + rand(high - guess) + 1
  elsif response == "Lower"
    guess = guess - rand(guess - low) - 1
  end
end

def high_adj(guess, high, response)
  if response == "Lower" and guess < high
    guess
  else
    high
  end
end

def low_adj(guess, low, response)
  if response == "Higher" and guess > low
    guess
  else
    low
  end
end

guess = rand(100)+1

prev_guess = 0

cheat_flag = 0

answer = 0

high = 100

low = 0

prev_response = ""

puts "My guess is: #{guess}. Please respond with \"Higher\" or \"Lower\" (case sensitive)."

response = gets.chomp

guess_count = 1

while guess_count <5 and response != "You win!"

  high = high_adj(guess, high, response)

  low = low_adj(guess, low, response)

  prev_guess = guess

  guess = next_guess(guess, response, high, low)

  prev_response = response

  guess_count +=1

  puts "My next guess is #{guess}"

  response = gets.chomp

  if ((guess - high == -1 and high < 100) and response == "Higher") or ((guess - low == 1 and low >0) and response == "Lower")
    puts "You are a liar and a cheat!"
    response = "You win!"
    cheat_flag = 1
  elsif (guess == 100 and response == "Higher") or (guess == 0 and response == "Lower")
    puts "You are a liar and a cheat!"
    response = "You win!"
    cheat_flag = 1
  end

end

if response == "You win!" and cheat_flag != 1
  puts "Nice try, but I am too smart for you!"
end

if guess_count == 5 and response != "You win!"
  puts "I tried but you won. What was the answer?"

  answer = gets.chomp

  puts "I knew I should have guessed #{answer}!"
end
