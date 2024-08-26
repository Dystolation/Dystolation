local pet = {
    name = "Buddy",
    hunger = 50,
    happiness = 50,
    energy = 50,
    age = 0,
    alive = true
}

print("Welcome to the Virtual Pet Simulator!")
print("Your pet's name is " .. pet.name .. ".")

local function showStats()
    print("\n-- Current Stats --")
    print("Hunger: " .. pet.hunger)
    print("Happiness: " .. pet.happiness)
    print("Energy: " .. pet.energy)
    print("Age: " .. pet.age .. " days")
end

local function feedPet()
    if pet.hunger > 10 then
        pet.hunger = pet.hunger - 10
        pet.happiness = pet.happiness + 5
        print(pet.name .. " enjoyed the food!")
    else
        print(pet.name .. " is not hungry right now.")
    end
end

local function playWithPet()
    if pet.energy > 20 then
        pet.happiness = pet.happiness + 10
        pet.energy = pet.energy - 20
        print(pet.name .. " had a great time playing!")
    else
        print(pet.name .. " is too tired to play.")
    end
end

local function restPet()
    pet.energy = pet.energy + 30
    if pet.energy > 100 then
        pet.energy = 100
    end
    print(pet.name .. " had a good rest!")
end

local function agePet()
    pet.age = pet.age + 1
    pet.hunger = pet.hunger + 5
    pet.energy = pet.energy - 10
    pet.happiness = pet.happiness - 5
    if pet.hunger >= 100 or pet.happiness <= 0 or pet.energy <= 0 then
        pet.alive = false
    end
end

local function checkStatus()
    if pet.hunger >= 100 then
        print(pet.name .. " is starving!")
    elseif pet.happiness <= 0 then
        print(pet.name .. " is depressed!")
    elseif pet.energy <= 0 then
        print(pet.name .. " has collapsed from exhaustion!")
    else
        return
    end
end

local function endGame()
    print("\nUnfortunately, " .. pet.name .. " has passed away.")
    print("Thank you for playing the Virtual Pet Simulator.")
    os.exit()
end

while pet.alive do
    showStats()
    print("\nWhat would you like to do?")
    print("1. Feed " .. pet.name)
    print("2. Play with " .. pet.name)
    print("3. Let " .. pet.name .. " rest")
    print("4. Do nothing (let a day pass)")
    print("Enter your choice (1-4): ")
    local choice = io.read("*n")

    if choice == 1 then
        feedPet()
    elseif choice == 2 then
        playWithPet()
    elseif choice == 3 then
        restPet()
    elseif choice == 4 then
        print("A day passes...")
    else
        print("Invalid choice.")
    end

    agePet()
    checkStatus()

    if not pet.alive then
        endGame()
    end
end
