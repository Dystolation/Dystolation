-- Initialize variables
math.randomseed(os.time()) -- Seeds RNG using current time for better randomness
player_score = 0 -- Player's starting score
ai_score = 0 -- AI's starting score
rounds = 10 -- Total number of rounds
max_value = 100 -- Maximum value for RNG
powerups_enabled = true -- Enable or disable powerups
lives = 3 -- Player has 3 lives

-- Function to play a single round
function play_round(round_num) -- Takes the current round number as argument
  print("Round " .. round_num) -- Display the round number
  player_guess = math.random(1, max_value) -- Player's random guess
  ai_guess = math.random(1, max_value) -- AI's random guess
  actual_number = math.random(1, max_value) -- The actual random number

  print("Player guess: " .. player_guess) -- Show player’s guess
  print("AI guess: " .. ai_guess) -- Show AI’s guess
  print("Actual number: " .. actual_number) -- Show actual number

  player_diff = math.abs(actual_number - player_guess) -- Player’s difference from actual number
  ai_diff = math.abs(actual_number - ai_guess) -- AI’s difference from actual number

  if player_diff < ai_diff then -- Check if player is closer
    print("Player wins this round!") -- Player wins the round
    player_score = player_score + 1 -- Add to player’s score
  elseif ai_diff < player_diff then -- Check if AI is closer
    print("AI wins this round!") -- AI wins the round
    ai_score = ai_score + 1 -- Add to AI’s score
  else -- If both are equally close
    print("It's a tie this round!") -- Declare a tie
  end
end

-- Main game loop
for i = 1, rounds do -- Loop for the total number of rounds
  play_round(i) -- Play a round for each loop iteration
  print("Current Score - Player: " .. player_score .. " AI: " .. ai_score) -- Display current score
  print("---------------------------") -- Round divider for clarity
end

-- Determine and print the final winner
if player_score > ai_score then -- Check if player has higher score
  print("Player wins the game with a score of " .. player_score) -- Player wins
elseif ai_score > player_score then -- Check if AI has higher score
  print("AI wins the game with a score of " .. ai_score) -- AI wins
else -- If both have equal scores
  print("It's a tie game!") -- Game ends in a tie
end

-- Player input for playing again
function play_again() -- Define function for replay
  print("Do you want to play again? (y/n)") -- Ask player
  local answer = io.read() -- Get input from player
  if answer == "y" then -- If player says yes
    player_score = 0 -- Reset player score
    ai_score = 0 -- Reset AI score
    for i = 1, rounds do -- Loop to replay rounds
      play_round(i) -- Replay rounds
      print("Current Score - Player: " .. player_score .. " AI: " .. ai_score) -- Display updated score
      print("---------------------------") -- Round divider
    end
    if player_score > ai_score then -- If player wins again
      print("Player wins the game with a score of " .. player_score) -- Print player win message
    elseif ai_score > player_score then -- If AI wins again
      print("AI wins the game with a score of " .. ai_score) -- Print AI win message
    else -- If it ties again
      print("It's a tie game!") -- Print tie message
    end
    play_again() -- Recursively call the play_again function
  elseif answer == "n" then -- If player says no
    print("Thanks for playing!") -- End the game
  else -- If player input is invalid
    print("Invalid input, please type 'y' or 'n'") -- Ask again
    play_again() -- Call function again to ask
  end
end

-- Game End Logic
play_again() -- Call function to ask if player wants to play again

-- Extra features for game (placeholder)
function bonus_round() -- Define bonus round function
  print("Bonus Round Activated!") -- Print message for bonus round
  bonus_number = math.random(1, max_value * 2) -- Double the max value for RNG
  player_bonus = math.random(1, max_value * 2) -- Player's bonus guess
  ai_bonus = math.random(1, max_value * 2) -- AI’s bonus guess
  print("Player bonus guess: " .. player_bonus) -- Display player’s bonus guess
  print("AI bonus guess: " .. ai_bonus) -- Display AI’s bonus guess
  print("Bonus number: " .. bonus_number) -- Show the actual bonus number
  player_diff = math.abs(bonus_number - player_bonus) -- Calculate player’s difference
  ai_diff = math.abs(bonus_number - ai_bonus) -- Calculate AI’s difference
  if player_diff < ai_diff then -- Check if player is closer in bonus round
    print("Player wins the bonus round!") -- Player wins the bonus round
    player_score = player_score + 2 -- Add 2 points for player
  elseif ai_diff < player_diff then -- Check if AI is closer in bonus round
    print("AI wins the bonus round!") -- AI wins bonus round
    ai_score = ai_score + 2 -- Add 2 points for AI
  else -- If both are equally close in bonus round
    print("Bonus round is a tie!") -- Bonus round ends in tie
  end
end

-- Function for changing difficulty
function change_difficulty() -- Define difficulty change function
  print("Select difficulty: Easy, Medium, Hard") -- Present difficulty options
  difficulty = io.read() -- Get player input
  if difficulty == "Easy" then -- Easy difficulty selected
    rounds = 5 -- Reduce number of rounds
    max_value = 50 -- Lower max value for RNG
  elseif difficulty == "Medium" then -- Medium difficulty selected
    rounds = 10 -- Set to default round number
    max_value = 100 -- Set to default max value
  elseif difficulty == "Hard" then -- Hard difficulty selected
    rounds = 15 -- Increase number of rounds
    max_value = 200 -- Increase max value for RNG
  else -- If input is invalid
    print("Invalid difficulty, defaulting to Medium") -- Set to medium by default
    rounds = 10 -- Default round number
    max_value = 100 -- Default max value
  end
end


-- Powerups feature
function powerup() -- Function for handling powerups
  local power = math.random(1, 3) -- RNG to decide which powerup to get
  if power == 1 then
    print("You gained an extra life!") -- Powerup: Extra life
    lives = lives + 1 -- Add a life
  elseif power == 2 then
    print("Double points activated!") -- Powerup: Double points
    player_score = player_score * 2 -- Double the player's score
  elseif power == 3 then
    print("Steal 2 points from AI!") -- Powerup: Steal points
    ai_score = math.max(0, ai_score - 2) -- Subtract 2 points from AI
  end
end

-- Function to check for bonus activation
function bonus_round_trigger() -- Determines if a bonus round is activated
  if math.random(1, 10) > 8 then -- 20% chance for a bonus round
    print("Bonus round unlocked!") -- Notify player of bonus round
    bonus_round() -- Call the bonus round
  else
    print("No bonus round this time!") -- No bonus round message
  end
end

-- Health feature
function lose_life() -- Function to lose a life
  lives = lives - 1 -- Decrease life count
  if lives <= 0 then -- Check if lives are depleted
    print("Game Over! You've lost all your lives!") -- Game over message
    os.exit() -- Exit the game
  else
    print("You have " .. lives .. " lives left.") -- Display remaining lives
  end
end

-- Penalty for losing a round
function round_penalty() -- Apply penalties for losing
  if player_score < ai_score then -- If player is losing
    lose_life() -- Player loses a life
  end
end

-- Function for end-game surprise
function end_game_surprise() -- Random surprise at the end of the game
  surprise = math.random(1, 4) -- 4 possible surprises
  if surprise == 1 then
    print("Surprise: Player gets 5 bonus points!") -- Player bonus points
    player_score = player_score + 5 -- Add 5 points to player
  elseif surprise == 2 then
    print("Surprise: AI steals 3 points from player!") -- AI steals points
    player_score = math.max(0, player_score - 3) -- AI steals 3 points
  elseif surprise == 3 then
    print("Surprise: Both scores are reset to 0!") -- Reset scores
    player_score = 0 -- Reset player score
    ai_score = 0 -- Reset AI score
  elseif surprise == 4 then
    print("Surprise: Extra bonus round!") -- Extra bonus round
    bonus_round() -- Call bonus round
  end
end

-- Call end-game surprise after final round
end_game_surprise() -- Execute surprise at the end

-- Call difficulty change at game start
change_difficulty() -- Adjust the game settings based on player input

-- Final game message
print("Thank you for playing this RNG game!") -- Thank the player
print("Final Score - Player: " .. player_score .. " AI: " .. ai_score) -- Show the final score
wait(1)
print("Remeber to follow me on roblox! :D")
print(I have youtube channel but is bad "Dystolation")
wait(1)
print("Thats basically it...")
