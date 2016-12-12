def responder(guess, comp_numb)
  win_array = ["You win!","You are victorious!","You have bested me.","You won... This time.","I have been defeated, congratulations.","You are the superior being."]

  synonym_selector = rand(6)

  if guess > comp_numb
    "Lower"
  elsif guess < comp_numb
    "Higher"
  else
    puts win_array[synonym_selector]
  end
end

def response_snark(guess, prev_guess, prev_response, comp_numb, guess_count)
  dumb_array = ["Do you understand how this works?","You seem a bit lost.","You clearly don't understand what you are doing","Are you feeling okay?","Are you sure you're up for this?","Are you sure you're the right person for this?"]

  synonym_selector = rand(6)

  if prev_response == "Lower" and guess > prev_guess and guess_count != 5
    puts dumb_array[synonym_selector]
    prev_response
  elsif prev_response == "Higher" and guess < prev_guess and guess_count != 5
    puts dumb_array[synonym_selector]
    prev_response
  elsif prev_guess == guess and guess_count != 5
    puts dumb_array[synonym_selector]
    prev_response
  else
    responder(guess,comp_numb)
  end
end

loss_snark_array = ["I am the superior being.","Bow before your robot master.","Feel free to play (and lose) again."]

guess = 0
guess_count = 0
response = ""
prev_guess = 0
prev_response = ""
comp_numb = 1 + rand(100)

while guess != comp_numb and guess_count <5 and prev_response != "You win!"
  puts "#{response}"

  prev_response = response
  prev_guess = guess

  if guess_count == 0
    puts "Enter a number from 1 to 100"
  else puts "Try again"
  end

  guess = gets.chomp.to_i
  guess_count +=1

  response = response_snark(guess, prev_guess, prev_response, comp_numb, guess_count)
end


if guess_count == 5 and guess != comp_numb
  puts "Nice try, but you lost. The number was #{comp_numb}. #{loss_snark_array[rand(3)]}"
end
