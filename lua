local minValue = 1 -- Sets the minimum value for the random number range
local maxValue = 100 -- Sets the maximum value for the random number range
local attempts = 0 -- Initializes attempts counter to zero
local targetNumber = 0 -- Placeholder for the randomly generated target number
local maxAttempts = 5 -- The maximum number of attempts allowed
local gameOver = false -- Boolean to track if the game has ended

function startGame() -- Defines the function to start the game
    print("Welcome to the RNG Game!") -- Prints a welcome message
    print("Guess the number between " .. minValue .. " and " .. maxValue .. "!") -- Concatenates and prints the min and max range
    targetNumber = math.random(minValue, maxValue) -- Generates a random number between minValue and maxValue
    attempts = 0 -- Resets the attempt counter to zero
    gameOver = false -- Resets the gameOver state to false
    print("You have " .. maxAttempts .. " attempts to guess the number!") -- Informs player of the number of attempts available
end

function guessNumber(playerGuess) -- Function to process the player's guess
    if gameOver then -- Checks if the game is already over
        print("Game over! Please restart.") -- Prints game over message if game is already finished
        return -- Stops the function from proceeding further
    end

    attempts = attempts + 1 -- Increments the attempts counter by 1

    if playerGuess == targetNumber then -- Checks if the player's guess matches the target number
        print("Congratulations! You've guessed the correct number!") -- Informs player of success if they guessed correctly
        gameOver = true -- Sets gameOver to true since the player won
    elseif playerGuess < targetNumber then -- If the guess is lower than the target number
        print("Your guess is too low!") -- Informs the player that their guess is too low
    else -- If the guess is higher than the target number
        print("Your guess is too high!") -- Informs the player that their guess is too high
    end

    if attempts >= maxAttempts then -- Checks if the player has reached the maximum number of attempts
        gameOver = true -- Ends the game if the player used all attempts
        print("You've used all your attempts! The correct number was " .. targetNumber .. ".") -- Reveals the correct number after all attempts are used
    end
end

function resetGame() -- Defines a function to reset the game
    print("Resetting the game...") -- Informs the player that the game is resetting
    startGame() -- Calls the startGame function to begin a new game
end

-- Main loop for game simulation
startGame() -- Starts the game when the script runs

-- Example guesses below. You can replace these with user input in real use case.
guessNumber(50) -- Simulates a player guessing 50
guessNumber(75) -- Simulates a player guessing 75
guessNumber(88) -- Simulates a player guessing 88
guessNumber(92) -- Simulates a player guessing 92
guessNumber(99) -- Simulates a player guessing 99

-- Game control and decision logic
if gameOver then -- If the game is over
    print("Do you want to play again? (y/n)") -- Asks the player if they want to play again
    local playerInput = "y" -- Simulates the player inputting 'y'
    if playerInput == "y" then -- Checks if the player chose to play again
        resetGame() -- Resets the game if they chose to play again
    else
        print("Thanks for playing!") -- Thanks the player and ends the game
    end
else
    print("The game is still in progress...") -- Informs the player that the game is still going
end

-- More test cases for player guesses
guessNumber(5) -- Simulates a guess of 5
guessNumber(10) -- Simulates a guess of 10
guessNumber(15) -- Simulates a guess of 15
guessNumber(20) -- Simulates a guess of 20

-- Check game state again
if gameOver then -- If game is over after these guesses
    print("Game ended!") -- Prints that the game has ended
else
    print("Still going... Keep guessing!") -- Encourages the player to keep guessing
end

-- Additional test with higher guesses
guessNumber(25) -- Simulates a guess of 25
guessNumber(30) -- Simulates a guess of 30
guessNumber(35) -- Simulates a guess of 35

-- Scenario when the game restarts again
resetGame() -- Resets the game and starts again
guessNumber(40) -- New guess after reset
guessNumber(45) -- Another guess after reset

-- More game state checks
if gameOver then -- Checks if the game is over again
    print("This is the end of the game!") -- Prints that the game has finished
else
    print("Keep playing to guess the correct number!") -- Encourages to keep guessing
end

-- Final scenario
guessNumber(50) -- Final guess to close out the game
print("Thanks for playing our RNG game!") -- Final message to the player
