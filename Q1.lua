-- Define a simple Player class
Player = {
    storageValues = {} -- Store storage values for each player
}

-- Define a constructor function for Player objects
function Player:new(name)
    local player = {} -- Create a new player object
    setmetatable(player, self) -- Set the metatable for the new player object to 'self'
    self.__index = self -- Set the __index metamethod to allow accessing methods of the Player class
    player.name = name -- Set the name property of the player object
    return player -- Return the created player object
end

-- Define a method to set storage values for a player
function Player:setStorageValue(key, value)
    self.storageValues[key] = value -- Set the specified storage value for the player
end

-- Define the releaseStorage function to reset a specific storage value for a player
local function releaseStorage(player)
    player:setStorageValue(1000, -1) -- Reset storage value 1000 to -1 for the player
    print("Storage value 1000 reset to -1 for player: " .. player.name) -- Print a message indicating the reset
end

-- Define the onLogout function to handle player logout events
function onLogout(player)
    if player.storageValues[1000] == 1 then -- Check if the player's storage value 1000 is set to 1
        local start_time = os.clock() -- Get the current time
        local delay = 1 -- Define a delay in seconds
        
        -- Wait until the specified delay has passed
        repeat until os.clock() - start_time >= delay
        
        releaseStorage(player) -- Call the releaseStorage function to reset the storage value
    end
    print(player.name .. " logged out") -- Print a message indicating the player has logged out
    return true -- Return true to indicate successful logout
end

-- Test Examples
-- Create player objects and test the onLogout function with different scenarios

local player1 = Player:new("Tyler") -- Create a player named Alice
player1:setStorageValue(1000, 1) -- Set storage value 1000 to 1 for Alice
onLogout(player1) -- Call onLogout function for Alice (should reset storage value 1000)

local player2 = Player:new("Brandon") -- Create a player named Bob
player2:setStorageValue(1000, -1) -- Set storage value 1000 to -1 for Bob
onLogout(player2) -- Call onLogout function for Bob (should not reset storage value)

local player3 = Player:new("Fred") -- Create a player named Charlie
player3:setStorageValue(1000, 0) -- Set storage value 1000 to 0 for Charlie
onLogout(player3) -- Call onLogout function for Charlie (should not reset storage value)
