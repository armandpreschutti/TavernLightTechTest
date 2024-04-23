-- Simulated game object with getPlayerByName method
local g_game = {
    getPlayerByName = function(name)
        -- Simulated player lookup by name
        if name == "Tyler" then
            return { name = "Tyler", isOnline = true }
        elseif name == "Brandon" then
            return nil
        elseif name == "Fred" then
            return { name = "Fredd", isOnline = false }
        else
            return nil
        end
    end
}

-- Simulated Player class
local Player = {
    new = function()
        return { isOnline = false }  -- Default isOnline state is false
    end,
    isPlayerOnline = function(self)  -- Renamed method to avoid conflict
        return self.isOnline  -- Return the value of isOnline property
    end
}

-- Simulated Item class
local Item = {
    createItem = function(itemId)
        -- Simulated item creation
        if itemId == 123 or itemId == 789 then
            return { itemId = itemId }
        else
            return nil
        end
    end
}

-- Simulated IOLoginData module
local IOLoginData = {
    loadPlayerByName = function(player, name)
        -- Simulated loading player from database
        -- Assuming loading is always successful in this example
        return true
    end,
    savePlayer = function(player)
        -- Simulated saving player data to database
        print("Saving player data for " .. player.name)
    end
}

-- addItemToPlayer function
function addItemToPlayer(recipient, itemId)
    -- Player exists in memory
    -- -----------------------------
    print("Attempting to find player: " .. recipient)
    local player = g_game:getPlayerByName(recipient)
    if not player then
        print("Player not found in memory. Loading player from database.")
        player = Player.new(nil)
        if not IOLoginData.loadPlayerByName(player, recipient) then
            print("Failed to load player from database. Exiting function.")
            return
        end
    else
        print("Player found in memory.")
    end

    -- Item creation successful
    -- -----------------------------
    print("Attempting to create item with ID: " .. itemId)
    local item = Item.createItem(itemId)
    if not item then
        print("Failed to create item.")
        if not player:isPlayerOnline() then  -- Updated method call
            print("Player is offline. Saving player data.")
            IOLoginData.savePlayer(player)
        else
            print("Player is online. Exiting function.")
        end
        return
    else
        print("Item created successfully.")
    end

    -- g_game:internalAddItem(player:getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT)

    if not player:isPlayerOnline() then
        -- Save player data if player is offline
        print("Player is offline. Saving player data.")
        IOLoginData.savePlayer(player)
    end

    -- Cleanup (Lua automatically handles memory management)
    print("Function execution complete.")
end

-- Test Example 1: Player exists in memory
addItemToPlayer("Tyler", 123)

-- Test Example 2: Player doesn't exist, item creation fails
addItemToPlayer("Brandon", 456)

-- Test Example 3: Player offline, item creation successful
addItemToPlayer("Fred", 789)
