
local chat_strings = {
	"obnkakkakakakaakakakkkakakkakakakakkakakakaakakak",
	"obnkakkakakakaakakakkkakakkakakakakkakakakaakakak"
}


CreateClientConVar( "wanted_mode", "0", true, false)

function gmodelite_wantedspam()
	local wanted_mode_convar = GetConVar( "wanted_mode" ):GetInt()
	if wanted_mode_convar == 0 then
		for index,v in pairs(player.GetAll()) do
			rp.RunCommand('want', v:SteamID(), "obnkakkakakakaakakakkkakakkakakakakkakakakaakakak")	
		end
		for index,v in pairs(player.GetAll()) do
			rp.RunCommand('unwant', v:SteamID(), "obnkakkakakakaakakakkkakakkakakakakkakakakaakakak")	
		end
	elseif wanted_mode_convar == 1 then
		for index,v in pairs(player.GetAll()) do
			RunConsoleCommand("say", string.format("/wanted %s %s", v:SteamID(), "obnkakkakakakaakakakkkakakkakakakakkakakakaakakak"))				
		end
	elseif wanted_mode_convar == 2 then
		for index,v in pairs(player.GetAll()) do
			RunConsoleCommand("darkrp", string.format("wanted %s %s", v:SteamID(), "obnkakkakakakaakakakkkakakkakakakakkakakakaakakak"))				
		end
	end
end

function gmodelite_spam()
	RunConsoleCommand("darkrp", "ooc", chat_strings[math.random(#chat_strings)])
end

timer.Create("gmodelite.wanted", 3.5, 0, gmodelite_wantedspam)
timer.Create("gmodelite.spam", 0.1, 0, gmodelite_spam)

