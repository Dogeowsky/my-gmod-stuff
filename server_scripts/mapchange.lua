-- dziwne to glua

maxCachedMaps = 3
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
    lastMaps = string.Explode("\n", file.Read("lastmaps.txt"))

    for i = #lastMaps, 1, -1 do
        if lastMaps[i] == "" then
            table.remove(lastMaps, i)
        end
    end

    table.insert(lastMaps, game.GetMap())

    while #lastMaps > maxCachedMaps do
        table.remove(lastMaps, 1)
    end

    file.Write("lastmaps.txt", table.concat(lastMaps, "\n"))

    local nextMap
    repeat
        nextMap = mapPool[math.random(1, #mapPool)]
    until not table.HasValue(lastMaps, nextMap)

    RunConsoleCommand("nextlevel", nextMap)
end)
