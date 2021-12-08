for _,v in pairs(player.GetHumans())do
    http.Fetch("https://api.steampowered.com/IPlayerService/IsPlayingSharedGame/v0001/?key=5DCF81C641ACAE4B5E5332A5E04B5FCD&format=json&steamid="..v:SteamID64().."&appid_playing=4000",function(a)
        local dianon_gaya=util.JSONToTable(a)["response"]["lender_steamid"]
        if dianon_gaya=="0"then return end
        print(v:Nick().."\nReal: https://steamcommunity.com/profiles/"..dianon_gaya.."\nFake: https://steamcommunity.com/profiles/"..v:SteamID64())
    end)
end
