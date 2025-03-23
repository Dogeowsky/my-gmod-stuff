-- by Pompin84/Dogeowsky
-- dziwne to glua

-- Maximum number of maps stored in the file
maxCachedMaps = 3
-- The pool of maps on the server from which the next map will be drawn
mapPool =  {
    "ttt_67thway_v5_2014",
    "ttt_abyss",
    "ttt_airbus_b3",
    "ttt_airship_toppat",
    "ttt_arctic_hl2",
    "ttt_casino_b2",
    "ttt_clue_2018_b7",
    "ttt_clueless_rv",
    "ttt_desperados",
    "ttt_grovestreet_a13",
    "ttt_minecraft_b5",
    "ttt_minecraftcity_v4",
    "ttt_overwatch",
    "ttt_pelicantown",
    "ttt_plaza_b7",
    "ttt_rooftops_2016_v1",
    "ttt_skyscraper",
    "ttt_terrortrain_2019_b1",
    "ttt_tokyodistrict",
    "ttt_waterworld_tropical",
    "ttt_westward"
}

timer.Simple(0, function()
    -- Loading saved maps into the table (if the file exists)
    lastMaps = string.Explode("\n", file.Read("lastmaps.txt"))

    -- Removal of empty entries
    for i = #lastMaps, 1, -1 do
        if lastMaps[i] == "" then
            table.remove(lastMaps, i)
        end
    end

    -- Inserting the current map to the end of the table
    table.insert(lastMaps, game.GetMap())

    -- Removing the first entry until the number of entries is less than the maxCachedMaps
    while #lastMaps > maxCachedMaps do
        table.remove(lastMaps, 1)
    end

    -- Saving a modified list in a file
    file.Write("lastmaps.txt", table.concat(lastMaps, "\n"))

    -- Selecting a new map with avoidance of previous one
    local nextMap
    repeat
        nextMap = mapPool[math.random(1, #mapPool)]
    until not table.HasValue(lastMaps, nextMap)

    -- Set the new map as the next
    RunConsoleCommand("nextlevel", nextMap)
end)
