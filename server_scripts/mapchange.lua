-- dziwne to glua

--maksymalna liczba zapisanych map
maxCachedMaps = 3
--pula map
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

-- kod
timer.Simple(0, function()
    lastMaps = string.Explode("\n", file.Read("lastmaps.txt"))

    if #lastMaps >= maxCachedMaps then
        file.Write("lastmaps.txt", "")
        for i = 1, maxCachedMaps do
            if i == maxCachedMaps then
                lastMaps[i] = game.GetMap()
            else
                lastMaps[i] = lastMaps[i + 1]
            end

            file.Append("lastmaps.txt", lastMaps[i] .. "\n")
        end
    else
        file.Append("lastmaps.txt", game.GetMap() .. "\n")
    end

    nextMap = mapPool[math.random(1, #mapPool)]

    while table.HasValue(lastMaps, nextMap) do
        nextMap = mapPool[math.random(1, #mapPool)]
    end

    RunConsoleCommand("nextlevel", nextMap)
end)
