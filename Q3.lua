-- Define a mock Player class for demonstration purposes
Player = {}

-- Constructor function for the Player class
function Player:new(id)
    -- Create a new player object
    local obj = {}
    -- Set the player's ID
    obj.id = id
    -- Initialize the player's party attribute with a new Party object
    obj.party = Party:new()  -- Assume Player has a Party object
    -- Return the newly created player object
    return obj
end

-- Define a mock Party class for demonstration purposes
Party = {}

-- Constructor function for the Party class
function Party:new()
    -- Create a new party object
    local obj = {}
    -- Initialize the members attribute as an empty table
    obj.members = {}

    -- Method to add a member to the party
    function obj:addMember(player)
        table.insert(self.members, player)
    end

    -- Method to retrieve members of the party
    function obj:getMembers()
        return self.members
    end

    -- Method to remove a member from the party
    function obj:removeMember(player)
        for i, v in ipairs(self.members) do
            if v == player then
                table.remove(self.members, i)
                -- Print a message confirming the removal of the member from the party
                print("Removed member: " .. player:getName() .. " from the party.")
                break
            end
        end
    end

    -- Return the newly created party object
    return obj
end

-- Function: do_something_with_PlayerParty
-- Parameters:
--    playerId: The ID of the player whose party will be modified.
--    membername: The name of the member to be removed from the party.
function do_something_with_PlayerParty(playerId, membername)
    -- Print an execution message indicating the function is being executed with provided parameters
    print("Executing do_something_with_PlayerParty for playerId: " .. playerId .. ", membername: " .. membername)
    
    -- Get the player object based on the provided playerId
    local player = Player:new(playerId)
    
    -- Check if the player object exists
    if player then
        -- Print a message indicating that the player object is found with the provided ID
        print("Player found with ID: " .. playerId)
        
        -- Get the party object associated with the player
        local party = player.party
        
        -- Check if the party object exists
        if party then
            -- Print a message indicating that the party object is found for the player
            print("Party found for player " .. playerId)
            
            -- Get the members of the party
            local members = party:getMembers()
            
            -- Loop through the members of the party
            for k, v in pairs(members) do
                -- Check if the member's name matches the provided membername
                if v:getName() == membername then
                    -- Print a message indicating the removal of the member from the party
                    print("Removing member: " .. membername .. " from the party.")
                    -- Remove the member from the party
                    party:removeMember(v)
                    -- Optionally, break the loop if only one occurrence is expected
                    -- break
                end
            end
        else
            -- Print an error message if the party object doesn't exist for the player
            print("Error: Party object not found for player " .. playerId)
        end
    else
        -- Print an error message if the player object doesn't exist with the provided ID
        print("Error: Player object not found with ID " .. playerId)
    end
end

-- Test examples
-- Assuming playerId = 1 and membername = "Alice"
do_something_with_PlayerParty(1, "Tyler")

-- Assuming playerId = 2 and membername = "Bob"
do_something_with_PlayerParty(2, "Brandon")

-- Assuming playerId = 3 (non-existent) and membername = "Charlie"
do_something_with_PlayerParty(3, "Fred")
