-- Define a function that prints the names of guilds with fewer members than a given count
    function printSmallGuildNames(memberCount)
        -- Sample guild names and corresponding member counts for testing
        local guilds = {
            {"Guild A", 40},
            {"Guild B", 60},
            {"Guild C", 30},
            {"Guild D", 70}
        }
    
        -- Loop through each guild in the guilds table
        for _, guild in ipairs(guilds) do
            -- Extract the guild's name and maximum member count
            local guildName = guild[1]
            local guildMaxMembers = guild[2]
    
            -- Check if the guild's maximum member count is less than the provided count
            if guildMaxMembers < memberCount then
                -- Print the guild's name if it meets the condition
                print(guildName)
            end
        end
    end
    
    -- Test the function with a sample member count
    printSmallGuildNames(50)
    
