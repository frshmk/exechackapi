--=================== Pre Cache ================

surface.CreateFont("ESP_Font_Main",{font = "comfortaa", size = 18})
surface.CreateFont("ESP_Font_Flag",{font = "Arial", size = 12})
surface.CreateFont("questionMarkFont",{font = "Arial", size = 17, weight = 500,})
surface.CreateFont("netFont", {font = "Verdana", size = 15, weight = 100,})

local config = {}
local teamFilterSelected = {}
config.colors = {}
config.keybinds = {}

config["aim_master_toggle"] = false
config["aim_onkey"] = false
config["aim_norecoil"] = false
config["aim_prediction"] = false
config["aim_target"] = 1
config["aim_hitbox"] = 1
config["aim_fov"] = 30
config["aim_smoothing"] = false
config["aim_smoothing_value"] = 0
config["aim_ignorefriends"] = false

config["trigger_master_toggle"] = false
config["trigger_onkey"] = false


config["esp_player_box"] = false
config["esp_player_name"] = false
config["esp_player_hp"] = false
config["esp_player_armor"] = false
config["esp_player_weapon"] = false
config["esp_player_rank"] = false
config["esp_player_team"] = false
config["esp_player_skeleton"] = false
config["esp_player_snaplines"] = false
config["esp_player_glow"] = false
config["esp_player_chams"] = false
config["esp_player_chams_xyz"] = false
config["esp_player_chams_material"] = 1
config["esp_player_render_distance"] = 4000
config["esp_player_filtering"] = false
config["esp_player_highlight_box"] = false
config["esp_player_highlight_name"] = false

config["esp_other_fog"] = false
config["esp_other_fog_start"] = 0
config["esp_other_fog_end"] = 9000
config["esp_other_fog_density"] = 0.8
config["esp_other_nightmode"] = false
config["esp_other_nightmode_scale"] = 0.4
config["esp_other_hitsound"] = false
config["esp_other_drawfov"] = false
config["esp_other_fullbright"] = false
config["esp_other_thirdperson"] = false
config["esp_other_thirdperson_distance"] = 15

config["misc_autobunnyhop"] = false
config["misc_autostrafe"] = false
config["misc_ttt"] = false
config["misc_observerlist"] = false
config["misc_rainbow"] = false	
config["misc_rainbow_speed"] = 20

config["config_name"] = nil

config.colors["esp_player_box"] = "255 255 255 255"
config.colors["esp_player_name"] = "255 255 255 255"
config.colors["esp_player_hp"] = "0 255 0 255"
config.colors["esp_player_armor"] = "66 138 245 255"
config.colors["esp_player_weapon"] = "255 255 255 255"
config.colors["esp_player_rank"] = "255 0 0 255"
config.colors["esp_player_skeleton"] = "255 255 255 255"
config.colors["esp_player_snaplines"] = "255 255 255 255"
config.colors["esp_player_glow"] = "0 140 255 255"
config.colors["esp_player_chams"] = "30 111 146 255"
config.colors["esp_player_chams_xyz"] = "0 63 160 63"
config.colors["esp_player_highlight_box"] = "0 255 0 255"
config.colors["esp_player_highlight_name"] = "0 255 0 255"
config.colors["esp_other_fog"] = "118 144 184 255"
config.colors["esp_other_drawfov"] = "255 255 255 255"

config.keybinds["aim_onkey_key"] = 0
config.keybinds["trigger_onkey_key"] = 0
config.keybinds["menu_key"] = 72
config.keybinds["logger_key"] = 74
config.keybinds["thirdperson_key"] = 0

config["friends"] = {}

local verifyconfig = config

local KeyBinds = {[0] = "NONE", [1] = "0", [2] = "1", [3] = "2", [4] = "3", [5] = "4", [6] = "5", [7] = "6", [8] = "7", [9] = "8", [10] = "9", [11] = "A", [12] = "B", [13] = "C", [14] = "D", [15] = "E", [16] = "F", [17] = "G", [18] = "H", [19] = "I", [20] = "J", [21] = "K", [22] = "L", [23] = "M", [24] = "N", [25] = "O", [26] = "P", [27] = "Q", [28] = "R", [29] = "S", [30] = "T", [31] = "U", [32] = "V", [33] = "W", [34] = "X", [35] = "Y", [36] = "Z", [37] = "PAD_0", [38] = "PAD_1", [39] = "PAD_2", [40] = "PAD_3", [41] = "PAD_4", [42] = "PAD_5", [43] = "PAD_6", [44] = "PAD_7", [45] = "PAD_8", [46] = "PAD_9", [47] = "PAD_DIVIDE", [48] = "PAD_MULTIPLY", [49] = "PAD_MINUS", [50] = "PAD_PLUS", [51] = "PAD_ENTER", [52] = "PAD_DECIMAL", [53] = "LBRACKET", [54] = "RBRACKET", [55] = "SEMICOLON", [56] = "APOSTROPHE", [57] = "BACKQUOTE", [58] = "COMMA", [59] = "PERIOD", [60] = "SLASH", [61] = "BACKSLASH", [62] = "MINUS", [63] = "EQUAL", [64] = "ENTER", [65] = "SPACE", [66] = "BACKSPACE", [67] = "TAB", [68] = "CAPSLOCK", [69] = "NUMLOCK", [70] = "ESCAPE", [71] = "SCROLLLOCK", [72] = "INSERT", [73] = "DELETE", [74] = "HOME", [75] = "END", [76] = "PAGEUP", [77] = "PAGEDOWN", [78] = "BREAK", [79] = "LSHIFT", [80] = "RSHIFT", [81] = "LALT", [82] = "RALT", [83] = "LCONTROL", [84] = "RCONTROL", [85] = "LWIN", [86] = "RWIN", [87] = "APP", [88] = "UP", [89] = "LEFT", [90] = "DOWN", [91] = "RIGHT", [92] = "F1", [93] = "F2", [94] = "F3", [95] = "F4", [96] = "F5", [97] = "F6", [98] = "F7", [99] = "F8", [100] = "F9", [101] = "F10", [102] = "F11", [103] = "F12"}
local MouseBinds = {[107] = "MOUSE_LEFT", [108] = "MOUSE_RIGHT", [109] = "MOUSE_MIDDLE", [110] = "MOUSE_4", [111] = "MOUSE_5", [112] = "MOUSE_WHEEL_UP", [113] = "MOUSE_WHEEL_DOWN"}

local exploit_menu, frame, frameX, frameY, sheet, teamFilter, teamFilterX, teamFilterY, colorWindow, teamList, teamFilter, teamFilterWasOpen, teamFilterEnable, teamFilterX, teamFilterY, pList, pListWasOpen, cfgDropdown
local activeTab
local loadedCfg = {}
local editingText = false
local observingPlayers = {}
observingPlayers.watcher = {}
observingPlayers.spec = {}
local files, dir = file.Find( "timeshack/*.json", "DATA" )
local frametime, deviation = engine.ServerFrameTime()

--=================== Misc Functions ================

local function RandomString() return tostring(math.random(-9999999999, 9999999999)) end

function VerifyConfig()
	for k, v in pairs(verifyconfig) do
		if config[k] == nil then
			config[k] = verifyconfig[k]
			MsgC(Color(61, 149, 217), "\n[Time's Hack] ", Color(222, 222, 222), "The config value ", Color(255, 0, 0), k, Color(222, 222, 222), " was nil. To prevent errors in the cheat it has been set to the default value automatically. Please make sure to save your config with your desired settings to prevent this in the future.")
		end
	end
	for k, v in pairs(verifyconfig.colors) do
		if config.colors[k] == nil then
			if k == "config_name" then return end
			config.colors[k] = verifyconfig.colors[k]
			MsgC(Color(61, 149, 217), "\n[Time's Hack] ", Color(222, 222, 222), "The colour config value ", Color(255, 0, 0), k, Color(222, 222, 222), " was nil. To prevent errors in the cheat it has been set to the default value automatically. Please make sure to save your config with your desired settings to prevent this in the future.")
		end
	end
	for k, v in pairs(verifyconfig.keybinds) do
		if config.keybinds[k] == nil then
			config.keybinds[k] = verifyconfig.keybinds[k]
			MsgC(Color(61, 149, 217), "\n[Time's Hack] ", Color(222, 222, 222), "The keybind config value ", Color(255, 0, 0), k, Color(222, 222, 222), " was nil. To prevent errors in the cheat it has been set to the default value automatically. Please make sure to save your config with your desired settings to prevent this in the future.")
		end
	end
end

function GetENTPos ( Ent )
	if Ent:IsValid() then 
		local Points = {
			Vector( Ent:OBBMaxs().x, Ent:OBBMaxs().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMaxs().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMins().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMins().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMins().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMins().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMaxs().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMaxs().y, Ent:OBBMaxs().z )
		}
		local MaxX, MaxY, MinX, MinY
		local V1, V2, V3, V4, V5, V6, V7, V8
		local isVis
		for k, v in pairs( Points ) do
			local ScreenPos = Ent:LocalToWorld( v ):ToScreen()
			isVis = ScreenPos.visible
			if MaxX != nil then
				MaxX, MaxY, MinX, MinY = math.max( MaxX, ScreenPos.x ), math.max( MaxY, ScreenPos.y), math.min( MinX, ScreenPos.x ), math.min( MinY, ScreenPos.y)
			else
				MaxX, MaxY, MinX, MinY = ScreenPos.x, ScreenPos.y, ScreenPos.x, ScreenPos.y
			end

			if V1 == nil then
				V1 = ScreenPos
			elseif V2 == nil then
				V2 = ScreenPos
			elseif V3 == nil then
				V3 = ScreenPos
			elseif V4 == nil then
				V4 = ScreenPos
			elseif V5 == nil then
				V5 = ScreenPos
			elseif V6 == nil then
				V6 = ScreenPos
			elseif V7 == nil then
				V7 = ScreenPos
			elseif V8 == nil then
				V8 = ScreenPos
			end
		end
		return MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8, isVis
	end
end

local fakeRT = GetRenderTarget( "fakeRT" .. os.time(), ScrW(), ScrH() )
 
hook.Add( "RenderScene", "AntiScreenGrab", function( vOrigin, vAngle, vFOV )
    local view = {
        x = 0,
        y = 0,
        w = ScrW(),
        h = ScrH(),
        dopostprocess = true,
        origin = vOrigin,
        angles = vAngle,
        fov = vFOV,
        drawhud = true,
        drawmonitors = true,
        drawviewmodel = true
    }
 
    render.RenderView( view )
    render.CopyTexture( nil, fakeRT )
 
    cam.Start2D()
        hook.Run( "CheatHUDPaint" )
    cam.End2D()
 
    render.SetRenderTarget( fakeRT )
 
    return true
end )
 
hook.Add( "ShutDown", "RemoveAntiScreenGrab", function()
    render.SetRenderTarget()
end )

function ValidateESP(ply)
	if ply:IsBot() or ply:IsPlayer() then
		if ( IsValid(ply) && ply != LocalPlayer() && ply:Alive() && ply:GetPos():Distance(LocalPlayer():GetPos()) <= config["esp_player_render_distance"] ) then
			if !table.IsEmpty(teamFilterSelected) && config["esp_player_filter"] then
				for k, v in pairs(teamFilterSelected) do
					if team.GetName(ply:Team()) == v then
						return true
					end
				end
			else
				return true
			end
		else
			return false
		end
	end
end

function ValidateAimbot(ply)
	if ply:IsBot() or ply:IsPlayer() then
		if ply:GetMoveType() == MOVETYPE_NOCLIP then return end
		if config["aim_ignorefriends"] then
			if table.HasValue(config["friends"], ply:SteamID()) then
				return false
			end
		end
		if ( IsValid(ply) && ply != LocalPlayer() && ply:Alive() && ply:Team() != TEAM_SPECTATOR && !ply:IsDormant() && ply:GetPos():Distance(LocalPlayer():GetPos()) <= config["esp_player_render_distance"] ) then
			if !table.IsEmpty(teamFilterSelected) && config["esp_player_filter"] then
				for k, v in pairs(teamFilterSelected) do
					if team.GetName(ply:Team()) == v then
						return true
					end
				end
			else
				return true
			end
		else
			return false
		end
	end
end

local playerTable = {}

hook.Add("Think", RandomString(), function()
	for k, v in pairs(player.GetAll()) do
		if ValidateESP(v) && !table.HasValue(playerTable, v) then
			table.insert(playerTable, v)
		elseif !ValidateESP(v) && table.HasValue(playerTable, v) then
			table.RemoveByValue(playerTable, v)
		end
	end
end)

function CloseFrame()
	frameX, frameY = frame:GetPos()
	RememberCursorPosition()
	frame:Remove()
	frame = false
end

function SaveConfig()

	if cfgDropdown:GetSelected() == nil then return end
	
	local cfg = cfgDropdown:GetSelected()
	local JSONconfig = util.TableToJSON(config, true)
	file.Write("timeshack/"..cfg, JSONconfig)

	MsgC(Color(61, 149, 217), "\n[Time's Hack] ", Color(222, 222, 222), "Saved Config - ", Color(255, 0, 0), cfg, "\n")

end

function LoadDefault()

	local JSONconfig = file.Read("timeshack/default.json", "DATA")
	config = util.JSONToTable(JSONconfig)

	VerifyConfig()

	loadedCfg[0] = "default.json"
	for k, v in ipairs(files) do
		if v == "default.json" then
			loadedCfg[1] = k
		end
	end

	MsgC(Color(61, 149, 217), "\n[Time's Hack] ", Color(222, 222, 222), "Loaded Default Config\n")

end

function LoadConfig()

	if cfgDropdown:GetSelected() == nil then return end

	local cfg = cfgDropdown:GetSelected()
	local JSONconfig = file.Read("timeshack/"..cfg, "DATA")
	config = util.JSONToTable(JSONconfig)

	VerifyConfig()

	loadedCfg[0] = cfg
	for k, v in ipairs(files) do
		if v == cfg then
			loadedCfg[1] = k
		end
	end

	MsgC(Color(61, 149, 217), "\n[Time's Hack] ", Color(222, 222, 222), "Loaded Config - ", Color(255, 0, 0), cfg, "\n")

	CloseFrame()
	CreateTimeGUI()

end


function CreateConfig()

	if config["config_name"] == nil then return end
	
	if file.Exists("timeshack/"..config["config_name"]..".json", "DATA") then return end

	local JSONconfig = util.TableToJSON(config, true)
	file.CreateDir("timeshack")
	file.Write("timeshack/"..config["config_name"]..".json", JSONconfig)

	MsgC(Color(61, 149, 217), "\n[Time's Hack] ", Color(222, 222, 222), "Created Config - ", Color(255, 0, 0), config["config_name"], "\n")

	CloseFrame()
	CreateTimeGUI()

end


function DeleteConfig()

	if cfgDropdown:GetSelected() == nil then return end
	
	local cfg = cfgDropdown:GetSelected()
	file.Delete("timeshack/"..cfg)

	loadedCfg = {}

	MsgC(Color(61, 149, 217), "\n[Time's Hack] ", Color(222, 222, 222), "Deleted Config - ", Color(255, 0, 0), cfg, "\n")

	CloseFrame()
	CreateTimeGUI()

end

for k, v in ipairs(files) do
	if string.lower(v) == "default.json" then
		LoadDefault()
	end
end

function CheckObservers()

	if !config["misc_observerlist"] then return end

	observingPlayers = {}
	observingPlayers.watcher = {}
	observingPlayers.spec = {}

	for k, v in pairs(player.GetAll()) do
	    if v:IsValid() and v != LocalPlayer() then
	        local Trace = {}
	        Trace.start  = LocalPlayer():EyePos() + Vector(0, 0, 32)
	        Trace.endpos = v:EyePos() + Vector(0, 0, 32)
	        Trace.filter = {v, LocalPlayer()}
	        TraceRes = util.TraceLine(Trace)
	        if !TraceRes.Hit then
	            if (v:EyeAngles():Forward():Dot((LocalPlayer():EyePos() - v:EyePos())) > math.cos(math.rad(45))) then
	                if !table.HasValue(observingPlayers.watcher, v) then table.insert(observingPlayers.watcher, v ) end
	            end
	        end
	    end
	    if v:GetObserverTarget() == LocalPlayer() then
	    	if !table.HasValue(observingPlayers.spec, v) then table.insert(observingPlayers.spec, v) end
	    end
	end
end

timer.Create(RandomString(), 0.5, 0, CheckObservers)

--=================== Create GUI ================

function CreateTimeGUI()

	files, dir = file.Find( "timeshack/*.json", "DATA" )

	frame = vgui.Create("DFrame")
	frame:SetSize(320, 400)
	if frameX == nil or frameY == nil then
		frame:Center()
	else
		frame:SetPos(frameX, frameY)
	end
	frame:SetTitle("Time's Hack")
	frame:MakePopup()
	frame:ShowCloseButton(false)

	sheet = vgui.Create("DPropertySheet", frame)
	sheet:Dock(FILL)

	local aim = vgui.Create("DScrollPanel", sheet)
	local aimsbar = aim:GetVBar()
	function aimsbar:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function aimsbar.btnUp:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function aimsbar.btnDown:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function aimsbar.btnGrip:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	sheet:AddSheet("Aimbot", aim, "icon16/bomb.png")

	local visplayer = vgui.Create("DScrollPanel", sheet)
	local playerbar = visplayer:GetVBar()
	function playerbar:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function playerbar.btnUp:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function playerbar.btnDown:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function playerbar.btnGrip:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	sheet:AddSheet("Player", visplayer, "icon16/user.png")

	local visother = vgui.Create("DScrollPanel", sheet)
	local otherbar = visother:GetVBar()
	function otherbar:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function otherbar.btnUp:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function otherbar.btnDown:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function otherbar.btnGrip:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	sheet:AddSheet("Other", visother, "icon16/world.png")

	local misc = vgui.Create("DScrollPanel", sheet)
	local miscbar = misc:GetVBar()
	function miscbar:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function miscbar.btnUp:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function miscbar.btnDown:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function miscbar.btnGrip:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	sheet:AddSheet("Misc", misc, "icon16/cog.png")

	local config = vgui.Create("DScrollPanel", sheet)
	local configbar = config:GetVBar()
	function configbar:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function configbar.btnUp:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function configbar.btnDown:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function configbar.btnGrip:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	sheet:AddSheet("Config", config, "icon16/database.png")
	sheet:SwitchToName(activeTab)
	for k, v in pairs(sheet:GetItems()) do
		function v.Tab:OnDepressed()
			activeTab = v.Name
		end
	end

	CreateCheckBox("Enable Aimbot", 10, 10, "aim_master_toggle", false, aim)
	CreateCheckBox("Aimbot On Key", 10, 30, "aim_onkey", false, aim)
	CreateKeybind(110, 30, "aim_onkey_key", aim)
	CreateCheckBox("No-Recoil", 10, 50, "aim_norecoil", false, aim)
	CreateCheckBox("Predict Velocity", 10, 70, "aim_prediction", false, aim)
	CreateDropdown("Target Selection", 10, 90, {"Crosshair", "Closest Distance", "Lowest Health"}, "aim_target", aim)
	CreateDropdown("Hitbox Selection", 10, 130, {"Hitscan", "Head", "Body"}, "aim_hitbox", aim)
	CreateSlider("Aimbot FOV", 10, 175, "aim_fov", 0, 180, 0, aim)
	CreateCheckBox("Aimbot Smoothing", 10, 220, "aim_smoothing", false, aim)
	CreateSlider("Smoothing Scale", 10, 240, "aim_smoothing_value", 0, 2, 2, aim)
	CreateCheckBox("Ignore Friends", 10, 280, "aim_ignorefriends", false, aim)

	CreateCheckBox("Enable Triggerbot", 10, 300, "trigger_master_toggle", false, aim)
	CreateCheckBox("Triggerbot On Key", 10, 320, "trigger_onkey", false, aim)
	CreateKeybind(130, 320, "trigger_onkey_key", aim)

	CreateCheckBox("Box ESP", 10, 10, "esp_player_box", true, visplayer)
	CreateCheckBox("Name ESP", 10, 30, "esp_player_name", true, visplayer)
	CreateCheckBox("HP ESP", 10, 50, "esp_player_hp", true, visplayer)
	CreateCheckBox("Armor ESP", 10, 70, "esp_player_armor", true, visplayer)
	CreateCheckBox("Weapon ESP", 10, 90, "esp_player_weapon", true, visplayer)
	CreateCheckBox("Rank ESP", 10, 110, "esp_player_rank", true, visplayer)
	CreateCheckBox("Team ESP", 10, 130, "esp_player_team", false, visplayer)
	CreateCheckBox("Skeleton ESP", 10, 150, "esp_player_skeleton", true, visplayer)
	CreateCheckBox("Snaplines", 10, 170, "esp_player_snaplines", true, visplayer)
	CreateCheckBox("Glow ESP", 10, 190, "esp_player_glow", true, visplayer)
	CreateCheckBox("Player Chams", 10, 210, "esp_player_chams", true, visplayer)
	CreateCheckBox("Player Chams XYZ", 10, 230, "esp_player_chams_xyz", true, visplayer)
	CreateDropdown("Chams Material", 10, 250, {"Textured", "Flat", "Wireframe"}, "esp_player_chams_material", visplayer)
	CreateSlider("ESP Max Render Distance", 10, 295, "esp_player_render_distance", 500, 10000, 0, visplayer)
	CreateCheckBox("Highlight Friends Box", 10, 335, "esp_player_highlight_box", true, visplayer)
	CreateCheckBox("Highlight Friends Name", 10, 355, "esp_player_highlight_name", true, visplayer)

	CreateCheckBox("Fog Modulation", 10, 10, "esp_other_fog", true, visother)
	CreateSlider("Fog Start", 10, 30, "esp_other_fog_start", 0, 50000, 0, visother)
	CreateSlider("Fog End", 10, 70, "esp_other_fog_end", 0, 50000, 0, visother)
	CreateSlider("Fog Density", 10, 110, "esp_other_fog_density", 0, 1, 1, visother)
	CreateCheckBox("Nightmode", 10, 150, "esp_other_nightmode", false, visother)
	CreateSlider("Nightmode Scale", 10, 170, "esp_other_nightmode_scale", 0, 1, 1, visother)
	CreateCheckBox("Hitsound", 10, 210, "esp_other_hitsound", false, visother)
	CreateCheckBox("Draw Aimbot FOV", 10, 230, "esp_other_drawfov", true, visother)
	CreateCheckBox("Fullbright", 10, 250, "esp_other_fullbright", false, visother)
	CreateCheckBox("Thirdperson", 10, 270, "esp_other_thirdperson", false, visother)
	CreateKeybind(100, 270, "thirdperson_key", visother)
	CreateSlider("Thirdperson Distance", 10, 290, "esp_other_thirdperson_distance", 5, 50, 0, visother) 

	CreateCheckBox("Auto Bunnyhop", 10, 10, "misc_autobunnyhop", false, misc)
	CreateCheckBox("Auto Strafe", 10, 30, "misc_autostrafe", false, misc)
	CreateCheckBox("Reveal TTT/MurderMystery Info", 10, 50, "misc_ttt", false, misc)
	CreateCheckBox("Observer List", 10, 70, "misc_observerlist", false, misc)
	CreateCheckBox("Rainbow Physgun", 10, 90, "misc_rainbow", false, misc)
	CreateSlider("Rainbow Speed", 10, 110, "misc_rainbow_speed", 1, 100, 0, misc)
	CreateCheckBox("Auto Click", 10, 150, "misc_autoclick", false, misc)
	CreateButton("Player List", "Open the player list menu.", CreatePlayerList, 10, 170, misc)
	CreateButton("Filter Teams", "The filter will be applied when the filter menu is closed. This filter applies to ESP and Aimbot.", CreateFilterPanel, 10, 195, misc)

	CreateLabel("Menu Keybind", 10, 10, config)
	CreateKeybind(10, 30, "menu_key", config)
	CreateLabel("Net Logger Keybind", 10, 50, config)
	CreateKeybind(10, 70, "logger_key", config)
	local usercfgs = {}
	cfgDropdown = vgui.Create("DComboBox", config)
	cfgDropdown:SetSize(200, 20)
	cfgDropdown:SetPos(10, 90)
	if loadedCfg[0] != nil then
		cfgDropdown:ChooseOption(loadedCfg[0], loadedCfg[1])
	end
	for k, v in ipairs(files) do
		cfgDropdown:AddChoice(v)
	end
	cfgDropdown:SetSortItems(false)

	CreateButton("Save Config", "Save Config.", SaveConfig, 10, 115, config)
	CreateButton("Load Config", "Load Config.", LoadConfig, 10, 140, config)
	CreateButton("Create Config", "Create Config.", CreateConfig, 10, 165, config)
	CreateButton("Delete Config", "Delete Config.", DeleteConfig, 10, 190, config)
	CreateTextInput("Config Name", "config_name", 10, 215, 16, config)

	if teamFilterWasOpen then
		CreateFilterPanel()
		teamFilterWasOpen = false
	end
	if pListWasOpen then
		CreatePlayerList()
		pListWasOpen = false
	end

end

--=================== GUI Item Functions ================

function CreateCheckBox(lbl, x, y, cfg, col, par)

	local checkBox = vgui.Create("DCheckBoxLabel", par)
	checkBox:SetText(lbl)
	checkBox:SetPos(x, y)
	checkBox:SetValue( config[cfg] )
	function checkBox:OnChange( bVal )
		config[cfg] = bVal
	end
	
	if col then

		local colorPicker = vgui.Create("DImageButton", par)
		colorPicker:SetImage("icon16/color_wheel.png")
		colorPicker:SetSize(16, 16)
		colorPicker:SetPos(checkBox:GetWide() + 15, y - 1)
		function colorPicker:DoClick()

			if IsValid(colorWindow) then
				colorWindow:Remove()
			end
			colorWindow = vgui.Create("DFrame")
			colorWindow:SetSize(300, 225)
			colorWindow:SetTitle(lbl.." - Color Picker")
			local frameX, frameY = frame:GetPos()
			if frameX + 350 > ScrW() then
				colorWindow:Center()
			else
				colorWindow:SetPos(frameX + 350, frameY)
			end
			colorWindow:MakePopup()

			local colorSelector = vgui.Create("DColorMixer", colorWindow)
			colorSelector:Dock(FILL)
			colorSelector:DockPadding(5, 5, 5, 5)
			colorSelector:SetPalette(false)
			colorSelector:SetColor(string.ToColor(config.colors[cfg]))
			function colorSelector:ValueChanged(val)

				local r = tostring(val.r)
				local g = tostring(val.g)
				local b = tostring(val.b)
				local a = tostring(val.a)
				local col = r.." "..g.." "..b.." "..a
				config.colors[cfg] = col
			end
		end
	end
end

function CreateLabel(lbl, x, y, par)

	local label = vgui.Create("DLabel", par)
	label:SetText(lbl)
	local w, h = label:GetTextSize()
	label:SetSize(w, h)
	label:SetPos(x, y)

end

function CreateSlider(lbl, x, y, cfg, min, max, dec, par)

	local sliderLabel = vgui.Create("DLabel", par)
	sliderLabel:SetText(lbl)
	local w, h = sliderLabel:GetTextSize()
	sliderLabel:SetWide(w)
	sliderLabel:SetPos(x, y - h / 8)

	local slider = vgui.Create("DNumSlider", par)
	slider:SetWide(490)
	slider:SetPos(x - 210, y + 10)
	slider:SetMin(min)
	slider:SetMax(max)
	slider:SetTooltip(lbl)
	slider:SetDefaultValue(config[cfg])
	slider:ResetToDefaultValue()
	slider:SetDecimals(dec)
	function slider:OnValueChanged()
		config[cfg] = slider:GetValue()
	end

end

function CreateDropdown(lbl, x, y, choices, cfg, par)

	local dropdownLabel = vgui.Create("DLabel", par)
	dropdownLabel:SetText(lbl)
	local w, h = dropdownLabel:GetTextSize()
	dropdownLabel:SetWide(w)
	dropdownLabel:SetPos(x, y - h / 8)

	local dropdown = vgui.Create("DComboBox", par)
	dropdown:SetSize(200, 20)
	dropdown:SetPos(x, y + 20)
	for k, v in ipairs(choices) do
		dropdown:AddChoice(v)
	end
	dropdown:SetSortItems(false)
	dropdown:ChooseOptionID(config[cfg])
	function dropdown:OnSelect(index, value, data)
		config[cfg] = index
	end
end

function CreateKeybind(x, y, cfg, par)

	local keyBind = vgui.Create("DButton", par)
	if config.keybinds[cfg] >= 107 && config.keybinds[cfg] <= 113 then
		keyBind:SetText(MouseBinds[config.keybinds[cfg]])
	else
		keyBind:SetText(KeyBinds[config.keybinds[cfg]])
	end
	keyBind:SetSize(80, 16)
	keyBind:SetPos(x, y)
	function keyBind:DoClick()
		keyBind:SetText("...")
		local ESCStuff, ESCNum = false, 0
		keyBind.Think = function()
			if !ESCStuff then
				for i = 107, 113 do
					if input.IsMouseDown(i) then
						config.keybinds[cfg] = i
						keyBind:SetText(MouseBinds[i])
						keyBind.Think = nil
					end
				end
				for i = 0, 159 do
					if input.IsKeyDown(i) then
						if i == 70 then
							gui.HideGameUI()
							config.keybinds[cfg] = 0
							keyBind:SetText(KeyBinds[0])
							keyBind.Think = nil
							ESCStuff = true
						else
							config.keybinds[cfg] = i
							keyBind:SetText(KeyBinds[i])
							keyBind.Think = nil
						end
					end
				end
			end
		end
	end
end

function CreateButton(lbl, tooltip, fnc, x, y, par)

	local button = vgui.Create("DButton", par)
	button:SetSize(150, 20)
	button:SetPos(x, y)
	button:SetText(lbl)
	button:SetTooltip(tooltip)
	function button:DoClick()
		fnc()
	end
end

function CreateTextInput(lbl, cfg, x, y, chars, par)

	textInput = vgui.Create("DTextEntry", par)
	textInput:SetSize(200, 20)
	textInput:SetPos(x, y)
	textInput:IsMultiline( false )
	textInput:SetMaximumCharCount(chars)
	textInput:SetPlaceholderText(lbl)
	textInput.Think = function()
		if textInput:IsEditing() then
			editingText	= true
		else
			editingText = false
		end
		config[cfg] = textInput:GetValue()
	end 
end

function CreateFilterPanel()

	if !teamFilter then

		teamFilter = vgui.Create("DFrame")
		teamFilter:SetSize(300, 200)
		teamFilter:SetTitle("Filter By Teams")
		if teamFilterX == nil or teamFilterY == nil then
			teamFilter:Center()
		else
			teamFilter:SetPos(teamFilterX, teamFilterY)
		end
		teamFilter:MakePopup()
		function teamFilter:OnClose()
			teamFilterX, teamFilterY = teamFilter:GetPos()
			teamFilter = false
			config["esp_player_filter"] = teamFilterEnable:GetChecked()
			for k, v in pairs(teamList:GetSelected()) do
				if !table.HasValue(teamFilterSelected, v:GetValue(1)) then
					table.insert(teamFilterSelected, v:GetValue(1))
				end
			end
		end

		teamFilterEnable = vgui.Create("DCheckBoxLabel", teamFilter)
		teamFilterEnable:Dock(TOP)
		teamFilterEnable:DockMargin(10, 10, 10, 0)
		teamFilterEnable:SetText("Enable Team Based Filtering")
		if config["esp_player_filtering"] then
			teamFilterEnable:SetValue( true )
		end
		function teamFilterEnable:OnChange(bval)
			config["esp_player_filtering"] = bval
		end

		teamList = vgui.Create("DListView", teamFilter)
		teamList:Dock(FILL)
		teamList:DockMargin(10, 10, 10, 10)
		teamList:SetMultiSelect(true)
		teamList:AddColumn("Teams")
		teamList:SetSortable(true)

		for k, v in pairs(team.GetAllTeams()) do
			if !( team.GetName(k) == team.GetName(TEAM_CONNECTING) ) && !( team.GetName(k) == team.GetName(TEAM_SPECTATOR) ) then
				teamList:AddLine(team.GetName(k))
			end
		end
		if !table.IsEmpty(teamFilterSelected) then
			for k, v in pairs(teamFilterSelected) do
				for i, line in ipairs(teamList:GetLines()) do
					if line:GetValue(1) == v then
						teamList:SelectItem(line)
						break
					end
				end
			end
		end
		teamFilterSelected = {}
	end
end

function CreatePlayerList()

	if !pList then

		pList = vgui.Create("DFrame")
		pList:SetSize(475, 200)
		local frameW, frameH = frame:GetPos()
		if frameW - 50 < 0 then
			pList:Center()
		else
			pList:SetPos(frameW - 525, frameH)
		end
		pList:SetTitle("Players List")
		pList:MakePopup()
		function pList:OnClose()
			pList = false
		end

		local dlist = vgui.Create("DListView", pList)
		dlist:DockMargin(0, 0, 150, 0)
		dlist:Dock(FILL)
		dlist:SetMultiSelect(false)
		dlist:AddColumn("Name")
		dlist:AddColumn("Steam ID")
		dlist:AddColumn("Rank")

		for k, v in ipairs(player.GetAll()) do
			if v != LocalPlayer() then
				dlist:AddLine(v:Name(), v:SteamID(), v:GetUserGroup())
			end
		end

		local profile = vgui.Create("DButton", pList)
		profile:SetSize(130, 20)
		profile:SetPos(335, 29)
		profile:SetText("Open Profile")
		profile:SetTooltip("Opens the selected players steam profile.")
		function profile:DoClick()
			if dlist:GetSelectedLine() != nil then
				local _, line = dlist:GetSelectedLine()
				player.GetBySteamID(line:GetColumnText(2)):ShowProfile()
			end
		end

		local steamid = vgui.Create("DButton", pList)
		steamid:SetSize(130, 20)
		steamid:SetPos(335, 54)
		steamid:SetText("Copy SteamID")
		steamid:SetTooltip("Copies the selected players SteamID.")
		function steamid:DoClick()
			if dlist:GetSelectedLine() != nil then
				local _, line = dlist:GetSelectedLine()
				SetClipboardText(line:GetColumnText(2))
				chat.AddText(Color(61, 149, 217), "[Time's Hack] ", Color(222, 222, 222), "SteamID copied to clipboard.")
			end
		end

		local friend = vgui.Create("DCheckBoxLabel", pList)
		friend:SetText("Friend")
		friend:SetPos(335, 79)
		friend:SetValue( false )
		function friend:OnChange( bVal )
			if dlist:GetSelectedLine() != nil then
				local _, line = dlist:GetSelectedLine()
				if bVal then
					if table.HasValue(config["friends"], line:GetColumnText(2)) then return
					else table.insert(config["friends"], line:GetColumnText(2)) end
				else
					if table.HasValue(config["friends"], line:GetColumnText(2)) then
						table.RemoveByValue(config["friends"], line:GetColumnText(2))
					end
				end
			end
		end

		function dlist:OnRowSelected(ind, line)
			if table.HasValue(config["friends"], line:GetColumnText(2)) then
				friend:SetValue(true)
			else
				friend:SetValue(false)
			end
		end
	end
end

-- ===================== GUI Logic

hook.Add("Think", RandomString(), function()
    if input.IsKeyDown(config.keybinds["menu_key"]) && !insertdown then
		if teamFilter then
			teamFilterX, teamFilterY = teamFilter:GetPos()
			config["esp_player_filter"] = teamFilterEnable:GetChecked()
			for k, v in pairs(teamList:GetSelected()) do
				if !table.HasValue(teamFilterSelected, v:GetValue(1)) then
					table.insert(teamFilterSelected, v:GetValue(1))
				end
			end
			teamFilter:Remove()
			teamFilterWasOpen = true
			teamFilter = false
		end
		if colorWindow then
			colorWindow:Remove()
			colorWindow = false
		end
		if pList then
			pList:Remove()
			pListWasOpen = true
			pList = false
		end
		if frame then
			CloseFrame()
		else
			CreateTimeGUI()
			RestoreCursorPosition()
		end
    end
    if (input.IsKeyDown(config.keybinds["logger_key"]) && !homedown) then
		if !exploit_menu:IsVisible() then
			gui.EnableScreenClicker(true)
			RestoreCursorPosition()
			exploit_menu:MakePopup()
			exploit_menu:SetVisible(true)
		else
			RememberCursorPosition()
			gui.EnableScreenClicker(false)
			exploit_menu:Hide()
			exploit_menu:SetVisible(false)
		end
	end
	insertdown = input.IsKeyDown(config.keybinds["menu_key"])
	homedown = input.IsKeyDown(config.keybinds["logger_key"])
end)

hook.Add("CreateMove", RandomString(), function( ucmd )
	if ( frame || exploit_menu:IsVisible() ) && not gui.IsConsoleVisible() && not gui.IsGameUIVisible() && not editingText then
		local ply = LocalPlayer()
		local f, b, l, r, j, d = input.GetKeyCode(input.LookupBinding("+forward")), input.GetKeyCode(input.LookupBinding("+back")), input.GetKeyCode(input.LookupBinding("+moveleft")), input.GetKeyCode(input.LookupBinding("+moveright")), input.GetKeyCode(input.LookupBinding("+jump")), input.GetKeyCode(input.LookupBinding("+duck"))
		if input.IsKeyDown( f ) then ucmd:SetForwardMove( ply:GetMaxSpeed() ) end
		if input.IsKeyDown( b ) then ucmd:SetForwardMove( -ply:GetMaxSpeed() ) end
		if input.IsKeyDown( r ) then ucmd:SetSideMove( ply:GetMaxSpeed() ) end
		if input.IsKeyDown( l ) then ucmd:SetSideMove( -ply:GetMaxSpeed() ) end
		if input.IsKeyDown( d ) then ucmd:SetButtons( IN_DUCK ) end
		if input.IsKeyDown( j ) then ucmd:SetButtons( IN_JUMP ) end
	end
end)

--===================================
--=================================== Visuals
--===================================

-- ======================= ESP

local bones = {
	{ S = "ValveBiped.Bip01_Head1", E = "ValveBiped.Bip01_Neck1" },
	{ S = "ValveBiped.Bip01_Neck1", E = "ValveBiped.Bip01_Spine4" },
	{ S = "ValveBiped.Bip01_Spine4", E = "ValveBiped.Bip01_Spine2" },
	{ S = "ValveBiped.Bip01_Spine2", E = "ValveBiped.Bip01_Spine1" },
	{ S = "ValveBiped.Bip01_Spine1", E = "ValveBiped.Bip01_Spine" },
	{ S = "ValveBiped.Bip01_Spine", E = "ValveBiped.Bip01_Pelvis" },
	{ S = "ValveBiped.Bip01_Spine2", E = "ValveBiped.Bip01_L_UpperArm" },
	{ S = "ValveBiped.Bip01_L_UpperArm", E = "ValveBiped.Bip01_L_Forearm" },
	{ S = "ValveBiped.Bip01_L_Forearm", E = "ValveBiped.Bip01_L_Hand" },
	{ S = "ValveBiped.Bip01_Spine2", E = "ValveBiped.Bip01_R_UpperArm" },
	{ S = "ValveBiped.Bip01_R_UpperArm", E = "ValveBiped.Bip01_R_Forearm" },
	{ S = "ValveBiped.Bip01_R_Forearm", E = "ValveBiped.Bip01_R_Hand" },
	{ S = "ValveBiped.Bip01_Pelvis", E = "ValveBiped.Bip01_L_Thigh" },
	{ S = "ValveBiped.Bip01_L_Thigh", E = "ValveBiped.Bip01_L_Calf" },
	{ S = "ValveBiped.Bip01_L_Calf", E = "ValveBiped.Bip01_L_Foot" },
	{ S = "ValveBiped.Bip01_L_Foot", E = "ValveBiped.Bip01_L_Toe0" },
	{ S = "ValveBiped.Bip01_Pelvis", E = "ValveBiped.Bip01_R_Thigh" },
	{ S = "ValveBiped.Bip01_R_Thigh", E = "ValveBiped.Bip01_R_Calf" },
	{ S = "ValveBiped.Bip01_R_Calf", E = "ValveBiped.Bip01_R_Foot" },
	{ S = "ValveBiped.Bip01_R_Foot", E = "ValveBiped.Bip01_R_Toe0" },
}

hook.Add("CheatHUDPaint", RandomString(), function()

	for k, v in ipairs(player.GetAll()) do
		if ValidateESP(v) then
			local MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8, isVis = GetENTPos( v )
			if isVis then
				if config["esp_player_box"] then
					if config["esp_player_highlight_box"] then
						if table.HasValue(config["friends"], v:SteamID()) then
							surface.SetDrawColor(string.ToColor(config.colors["esp_player_highlight_box"]))
						else
							surface.SetDrawColor(string.ToColor(config.colors["esp_player_box"]))
						end
					else
						surface.SetDrawColor(string.ToColor(config.colors["esp_player_box"]))
					end
					surface.DrawLine( MaxX, MaxY, MinX, MaxY )
					surface.DrawLine( MaxX, MaxY, MaxX, MinY )
					surface.DrawLine( MinX, MinY, MaxX, MinY )
					surface.DrawLine( MinX, MinY, MinX, MaxY )
				end
				if config["esp_player_name"] then
					surface.SetFont("ESP_Font_Main")
					local w, h = surface.GetTextSize(v:Nick())
					local col
					if config["esp_player_highlight_name"] then
						if table.HasValue(config["friends"], v:SteamID()) then
							col = string.ToColor(config.colors["esp_player_highlight_name"])
						else
							col = string.ToColor(config.colors["esp_player_name"])
						end
					else
						col = string.ToColor(config.colors["esp_player_name"])
					end
					draw.SimpleTextOutlined(v:Nick(), "ESP_Font_Main", MaxX-(MaxX-MinX)/2-w/2, MinY-1, col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
				end
				if config["esp_player_hp"] then
					local hpMultiplier = v:Health() / v:GetMaxHealth()
					hpMultiplier = math.Clamp(hpMultiplier, 0, 1)
					local barLen = MinY - MaxY
					barlen = barLen * hpMultiplier
					local appliedBar = (MinY - MaxY) - barlen
					surface.SetFont("ESP_Font_Flag")
					local w, h = surface.GetTextSize(v:Health())
					draw.SimpleTextOutlined(v:Health(), "ESP_Font_Flag", MinX-w-6, MinY+10, string.ToColor(config.colors["esp_player_hp"]), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
					surface.SetDrawColor(0, 0, 0, 100)
					surface.DrawLine( MinX-2, MinY, MinX-2, MaxY )
					surface.DrawLine( MinX-3, MinY, MinX-3, MaxY )
					surface.SetDrawColor(0, 255, 0)
					surface.DrawLine( MinX-2, MinY-appliedBar, MinX-2, MaxY )
					surface.DrawLine( MinX-3, MinY-appliedBar, MinX-3, MaxY )
				end
				if config["esp_player_armor"] then
					local yOffset
					if config["esp_player_hp"] then
						yOffset = 20
					else
						yOffset = 10
					end
					surface.SetFont("ESP_Font_Flag")
					local w, h = surface.GetTextSize(v:Armor())
					if v:Armor() != 0 then
						draw.SimpleTextOutlined(v:Armor(), "ESP_Font_Flag", MinX-w-6, MinY+yOffset, string.ToColor(config.colors["esp_player_armor"]), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
					end
				end
				if config["esp_player_weapon"] then
					surface.SetFont("ESP_Font_Flag")
					if IsValid(v:GetActiveWeapon()) then
						local w, h = surface.GetTextSize(v:GetActiveWeapon():GetClass())
						draw.SimpleTextOutlined(v:GetActiveWeapon():GetClass(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2, MaxY+12, string.ToColor(config.colors["esp_player_weapon"]), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
					end
				end
				if config["esp_player_rank"] then
					local yOffset
					if config["esp_player_weapon"] then
						yOffset = 24
					else
						yOffset = 12
					end
					surface.SetFont("ESP_Font_Flag")
					local w, h = surface.GetTextSize(v:GetUserGroup())
					draw.SimpleTextOutlined(v:GetUserGroup(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2, MaxY+yOffset, string.ToColor(config.colors["esp_player_rank"]), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
				end
				if config["esp_player_team"] then
					local yOffset
					if config["esp_player_weapon"] && config["esp_player_rank"] then
						yOffset = 36
					elseif ( config["esp_player_weapon"] && !config["esp_player_rank"] ) || ( !config["esp_player_weapon"] && config["esp_player_rank"] ) then
						yOffset = 24
					else
						yOffset = 12
					end
					local teamColor = team.GetColor(v:Team())
					surface.SetFont("ESP_Font_Flag")
					local w, h = surface.GetTextSize(team.GetName(v:Team()))
					draw.SimpleTextOutlined(team.GetName(v:Team()), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2, MaxY+yOffset, teamColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
				end
				if config["esp_player_snaplines"] then
					surface.SetDrawColor( string.ToColor(config.colors["esp_player_snaplines"]))
					surface.DrawLine( ScrW() / 2 - 1, ScrH() , MaxX - ( MaxX - MinX ) / 2 - 1, MaxY )
				end
				if config["esp_player_skeleton"] then
					for _, b in pairs( bones ) do
						if v:LookupBone(b.S) != nil && v:LookupBone(b.E) != nil then
							local spos, epos = v:GetBonePosition(v:LookupBone(b.S)):ToScreen(), v:GetBonePosition(v:LookupBone(b.E)):ToScreen()
							if spos.visible && epos.visible then
								surface.SetDrawColor( string.ToColor(config.colors["esp_player_skeleton"]) )
								surface.DrawLine( spos.x, spos.y, epos.x, epos.y )
							end
						end
					end
				end
				if config["misc_observerlist"] then
					for k, v in ipairs(observingPlayers.watcher) do
						if !IsValid(v) then return end
						surface.SetFont("ESP_Font_Main")
						local nameWidth, nameHeight = surface.GetTextSize("Observer: "..v:Name())
						draw.SimpleText("Observer: "..v:Name(), "ESP_Font_Main", ScrW() - nameWidth - 2, 0 + (15 * ( k - 1 ) ), Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
					end
					for k, v in ipairs(observingPlayers.spec) do
						if !IsValid(v) then return end
						surface.SetFont("ESP_Font_Main")
						local nameWidth, nameHeight = surface.GetTextSize("Spectator: "..v:Name())
						draw.SimpleText("Spectator: "..v:Name(), "ESP_Font_Main", ScrW() - nameWidth - 2, 0 + (15 * #observingPlayers.watcher) + ( 15 * k ), Color(255, 0, 0), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
					end
				end
				if v.Traitor then
					surface.SetFont("ESP_Font_Flag")
					local w, h = surface.GetTextSize("Traitor")
					draw.SimpleTextOutlined("Traitor", "ESP_Font_Flag", MaxX+5, MinY + h, Color(255, 0, 0) , TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
				end
				if config["misc_ttt"] && engine.ActiveGamemode() == "murder" then
					if v:HasWeapon("weapon_mu_knife") then
						surface.SetFont("ESP_Font_Flag")
						local w, h = surface.GetTextSize("Murderer")
						draw.SimpleTextOutlined("Murderer", "ESP_Font_Flag", MaxX+5, MinY + h, Color(255, 0, 0) , TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))	
					end 	
				end
			end
		end
	end
end)

-- ======================= Glow

hook.Add("PreDrawHalos", RandomString(), function()
	if config["esp_player_glow"] then
		halo.Add(playerTable, string.ToColor(config.colors["esp_player_glow"]), 1, 1, 2, true, true)
	end
end)

-- ======================= Chams

local texturedCham = CreateMaterial( "textured", "VertexLitGeneric", {
  ["$basetexture"] = "models/debug/debugwhite",
  ["$model"] = 1,
  ["$translucent"] = 1,
  ["$vertexalpha"] = 1,
  ["$vertexcolor"] = 1
})

local wireframeCham = CreateMaterial( "wireframe", "Wireframe", {
  ["$basetexture"] = "models/debug/debugwhite",
  ["$model"]       = 1,
  ["$translucent"] = 1,
  ["$alpha"]       = 1,
  ["$nocull"]      = 1,
})

hook.Add("RenderScreenspaceEffects", RandomString(), function()

	local colorFix = (1 / 255)
	local chamColVis = string.ToColor(config.colors["esp_player_chams"])
	local chamColInvis = string.ToColor(config.colors["esp_player_chams_xyz"])

	if config["esp_player_chams_xyz"] then

		if config["esp_player_chams_material"] == 1 then
			cam.Start3D( EyePos(), EyeAngles() )
				for k, v in pairs( player.GetAll() ) do
					if ValidateESP(v) then
						cam.IgnoreZ(true)
						render.SetColorModulation( chamColInvis.r * colorFix, chamColInvis.g * colorFix, chamColInvis.b * colorFix )
						render.SetBlend( chamColInvis.a * colorFix)
						render.MaterialOverride( texturedCham )
						v:SetRenderMode( 1 )
						if chamColInvis.a == 255 then
							v:SetColor(Color(255, 255, 255, 255))
						else
							v:SetColor(Color(255, 255, 255, 0))
						end
						v:DrawModel()
						cam.IgnoreZ(false)
						render.SetColorModulation( 1, 1, 1 )
						render.SetBlend( 1 )
						render.MaterialOverride()
						v:DrawModel()
					end
				end
			cam.End3D()
		elseif config["esp_player_chams_material"] == 2 then
			cam.Start3D( EyePos(), EyeAngles() )
				for k, v in pairs( player.GetAll() ) do
					if ValidateESP(v) then
						render.SetColorModulation( 1, 1, 1 )
						render.MaterialOverride()
						v:DrawModel()
						render.SuppressEngineLighting( true )
						cam.IgnoreZ(true)
						render.SetColorModulation( chamColInvis.r * colorFix, chamColInvis.g * colorFix, chamColInvis.b * colorFix )
						render.SetBlend( chamColInvis.a * colorFix )
						render.MaterialOverride( texturedCham )
						v:SetRenderMode( 1 )
						if chamColInvis.a == 255 then
							v:SetColor(Color(255, 255, 255, 255))
						else
							v:SetColor(Color(255, 255, 255, 0))
						end
						v:DrawModel()
						cam.IgnoreZ(false)
						render.SuppressEngineLighting( false )
						render.SetColorModulation( 1, 1, 1 )
						render.SetBlend( 1 )
						render.MaterialOverride()
						v:DrawModel()
					end
				end
			cam.End3D()
		elseif config["esp_player_chams_material"] == 3 then
			cam.Start3D( EyePos(), EyeAngles() )
				for k, v in pairs( player.GetAll() ) do
					if ValidateESP(v) then
						cam.IgnoreZ(true)
						render.SetColorModulation( chamColInvis.r * colorFix, chamColInvis.g * colorFix, chamColInvis.b * colorFix )
						render.SetBlend( chamColInvis.a * colorFix )
						render.MaterialOverride( wireframeCham )
						v:SetRenderMode( 1 )
						v:SetColor(Color(255, 255, 255, 0))
						v:DrawModel()
						cam.IgnoreZ(false)
					end
				end
			cam.End3D()
		end
	end

	if config["esp_player_chams"] then

		if config["esp_player_chams_material"] == 1 then
			cam.Start3D( EyePos(), EyeAngles() )
				for k, v in pairs( player.GetAll() ) do
					if ValidateESP(v) then
						render.SetColorModulation( chamColVis.r * colorFix, chamColVis.g * colorFix, chamColVis.b * colorFix )
						render.SetBlend( chamColVis.a * colorFix)
						render.MaterialOverride( texturedCham )
						v:SetRenderMode( 1 )
						if chamColVis.a == 255 then
							v:SetColor(Color(255, 255, 255, 255))
						else
							v:SetColor(Color(255, 255, 255, 0))
						end
						v:DrawModel()
					end
				end
			cam.End3D()
		elseif config["esp_player_chams_material"] == 2 then
			cam.Start3D( EyePos(), EyeAngles() )
				for k, v in pairs( player.GetAll() ) do
					if ValidateESP(v) then
						render.SuppressEngineLighting( true )
						render.SetColorModulation( chamColVis.r * colorFix, chamColVis.g * colorFix, chamColVis.b * colorFix )
						render.SetBlend( chamColVis.a * colorFix)
						render.MaterialOverride( texturedCham )
						v:SetRenderMode( 1 )
						if chamColVis.a == 255 then
							v:SetColor(Color(255, 255, 255, 255))
						else
							v:SetColor(Color(255, 255, 255, 0))
						end
						v:DrawModel()
						render.SuppressEngineLighting( false )
					end
				end
			cam.End3D()
		elseif config["esp_player_chams_material"] == 3 then
			cam.Start3D( EyePos(), EyeAngles() )
				for k, v in pairs( player.GetAll() ) do
					if ValidateESP(v) then
						render.SetColorModulation( chamColVis.r * colorFix, chamColVis.g * colorFix, chamColVis.b * colorFix )
						render.SetBlend( chamColVis.a * colorFix)
						render.MaterialOverride( wireframeCham )
						v:SetRenderMode( 1 )
						v:SetColor(Color(255, 255, 255, 0))
						v:DrawModel()
					end
				end
			cam.End3D()
		end
	end
	if !config["esp_player_chams"] && !config["esp_player_chams_xyz"] then
		for k, v in pairs(player.GetAll()) do
			v:SetRenderMode(0)
		end
	end
end)

-- ======================= Fog

hook.Add("SetupWorldFog", RandomString(), function()

	if config["esp_other_fog"] then

		local col = string.ToColor(config.colors["esp_other_fog"])

		render.FogMode( MATERIAL_FOG_LINEAR )
		render.FogStart(config["esp_other_fog_start"])
		render.FogEnd(config["esp_other_fog_end"])
		render.FogMaxDensity(config["esp_other_fog_density"])
		render.FogColor(col.r, col.g, col.b)

		return true
	end
end)

hook.Add("SetupSkyboxFog", RandomString(), function( skyboxscale )

	if config["esp_other_fog"] then

		local col = string.ToColor(config.colors["esp_other_fog"])

		render.FogMode( MATERIAL_FOG_LINEAR )
		render.FogStart(config["esp_other_fog_start"] * skyboxscale)
		render.FogEnd(config["esp_other_fog_end"] * skyboxscale)
		render.FogMaxDensity(config["esp_other_fog_density"])
		render.FogColor(col.r, col.g, col.b)

		return true
	end
end)

-- ======================= Nightmode

hook.Add( "RenderScreenspaceEffects", "nightmode", function()

	if config["esp_other_nightmode"] then
		local nightmode = {
			[ "$pp_colour_addr" ] = 55 * (1 / 255),
			[ "$pp_colour_addg" ] = 45 * (1 / 255),
			[ "$pp_colour_addb" ] = 66 * (1 / 255),
			[ "$pp_colour_brightness" ] = -0.2,
			[ "$pp_colour_contrast" ] = config["esp_other_nightmode_scale"],
			[ "$pp_colour_colour" ] = 1,
			[ "$pp_colour_mulr" ] = 0,
			[ "$pp_colour_mulg" ] = 0,
			[ "$pp_colour_mulb" ] = 0
		}
		DrawColorModify( nightmode )
	end
end)	

--=================================== Hitsound

	
hook.Add("ScalePlayerDamage", "hitsound", function(ply, group, dmginfo)
	if config["esp_other_hitsound"] then
		if dmginfo:GetAttacker() == LocalPlayer() then
			surface.PlaySound("garrysmod/balloon_pop_cute.wav")
		end
	end
end)

--=================================== Fullbright


local LightingModeChanged = false
hook.Add("PreRender", RandomString(), function()
	if config["esp_other_fullbright"] then
		render.SetLightingMode( 1 )
		LightingModeChanged = true
	end
end )

function EndOfLightingMod()
	if LightingModeChanged then
		render.SetLightingMode( 0 )
		LightingModeChanged = false
	end
end
hook.Add("PostRender", RandomString(), EndOfLightingMod)
hook.Add("PreDrawHUD", RandomString(), EndOfLightingMod)


--=================================== Draw FOV

hook.Add("CheatHUDPaint", RandomString(), function()
	if config["aim_master_toggle"] && config["esp_other_drawfov"] && config["aim_fov"] < 90 then
		local X1 = math.tan( math.rad( config["aim_fov"] ) / 1.25 )
		local X2 = math.tan( math.rad( LocalPlayer():GetFOV() / 2 ) )
		local r = X1 / X2
		local pxR = r * ( ScrW() / 2 )
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, pxR, string.ToColor(config.colors["esp_other_drawfov"]))
	end
end)

--=================================== Camera Modifications

local intp

hook.Add("CalcView", RandomString(), function(ply, pos, ang, fov)

	if config["esp_other_thirdperson"] then
		local Camera = {}
		if config.keybinds["thirdperson_key"] == 0 then 
			intp = true
		end
		if ( ( ( config.keybinds["thirdperson_key"] >= 107 && config.keybinds["thirdperson_key"] <= 113 ) && input.IsMouseDown(config.keybinds["thirdperson_key"] ) && !toggledelay ) || input.IsKeyDown(config.keybinds["thirdperson_key"]) && !toggledelay ) then
			if !intp then
				intp = true
				toggledelay = true
				timer.Simple(0.5, function() toggledelay = false end)
			else
				intp = false
				toggledelay = true
				timer.Simple(0.5, function() toggledelay = false end)
			end
		end
		if intp then
			Camera.origin = pos - ( ang:Forward() * (config["esp_other_thirdperson_distance"] * 10) ) 
			Camera.angles = ang
			Camera.fov = fov
			Camera.drawviewer = true
			return Camera
		end
		if config["aim_norecoil"] && !intp then
			Camera.angles = LocalPlayer():EyeAngles()
			return Camera 
		end
	else
		local Camera = {}
		if config["aim_norecoil"] && !intp then
			Camera.angles = LocalPlayer():EyeAngles()
			return Camera
		end
	end
end)

--===================================
--=================================== Aimbot
--===================================

--=================================== No Recoil
 
local OEyeAngles = OEyeAngles or FindMetaTable( "Player" ).SetEyeAngles

FindMetaTable( "Player" ).SetEyeAngles = function( self, angle )

    if ( string.find( string.lower( debug.getinfo( 2 ).short_src ), "/weapons/" ) ) and config["aim_norecoil"] then return end

    OEyeAngles( self, angle )

end

--=================================== Aimbot

local predictedWeapons = {
	["weapon_crossbow"] = 3110;
}

local pred

hook.Add("CreateMove", RandomString(), function(ucmd)
	if config["aim_master_toggle"] then
		if !config["aim_onkey"] || ( ( ( config.keybinds["aim_onkey_key"] >= 107 && config.keybinds["aim_onkey_key"] <= 113 ) && input.IsMouseDown(config.keybinds["aim_onkey_key"]) ) || input.IsKeyDown(config.keybinds["aim_onkey_key"]) ) && !frame then
			if !LocalPlayer():Alive() then return end
			if LocalPlayer():GetActiveWeapon():Clip1() != 0 then
			local centerx, centery = ScrW() / 2, ScrH() / 2
			local PlayerDistance, NewPlayerDistance, PlayerHealth, NewPlayerHealth, playerCenter, newPlayerCenter = math.huge, math.huge, math.huge, math.huge, math.huge, math.huge
				for k, v in pairs(player.GetAll()) do
					if ValidateAimbot(v) then
						if isVisible(v) then
							if config["aim_prediction"] then
								pred = ( v:GetVelocity() * frametime )
							else
								pred = Vector(0, 0, 0)
							end
							local LOS, AimP, InFOV = false, false, false
							local CurAngle = ucmd:GetViewAngles()
							local CurPos = LocalPlayer():GetShootPos()
							local AimSpot

							if config["aim_hitbox"] == 1 then

								AimSpot = HitScan(v)

							elseif config["aim_hitbox"] == 2 && v:LookupBone("ValveBiped.Bip01_Head1") != nil then

								AimSpot = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Head1")) + Vector(0, 0, 1) + pred

							elseif config["aim_hitbox"] == 3 && v:LookupBone("ValveBiped.Bip01_Pelvis") != nil then

								AimSpot = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Pelvis")) + pred

							else

								AimSpot = v:LocalToWorld(v:OBBCenter()) + pred

							end

							if IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():GetClass() == "weapon_crossbow" then
								AimSpot = Prediction(v, AimSpot)
							end

							local FinAngle = ( AimSpot - CurPos ):Angle()
							FinAngle:Normalize()

							if config["aim_target"] == 1 then
								if math.sqrt((AimSpot:ToScreen().x - centerx) * (AimSpot:ToScreen().x - centerx) + (AimSpot:ToScreen().y - centery) * (AimSpot:ToScreen().y - centery)) < playerCenter then newPlayerCenter = math.sqrt((AimSpot:ToScreen().x - centerx) * (AimSpot:ToScreen().x - centerx) + (AimSpot:ToScreen().y - centery) * (AimSpot:ToScreen().y - centery)) AimP = true end
							elseif config["aim_target"] == 2 then
								if v:Health() < PlayerHealth then NewPlayerHealth = v:Health() AimP = true end
							elseif config["aim_target"] == 3 then
								if LocalPlayer():GetPos():Distance(v:GetPos()) < PlayerDistance then NewPlayerDistance = LocalPlayer():GetPos():Distance(v:GetPos()) AimP = true end
							end
							local angDiff = GetAngleDiffrence(CurAngle, FinAngle)
							angDiff = math.abs(math.NormalizeAngle(angDiff))
							if angDiff < config["aim_fov"] then
								InFOV = true 
							end

							if AimP && InFOV then
								if config["aim_smoothing"] && ( IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():GetClass() != "weapon_crossbow" ) then
									playerCenter = newPlayerCenter
									PlayerHealth = NewPlayerHealth
									PlayerDistance = NewPlayerDistance
									ucmd:SetViewAngles(Smoothing(FinAngle))
								else
									playerCenter = newPlayerCenter
									PlayerHealth = NewPlayerHealth
									PlayerDistance = NewPlayerDistance
									ucmd:SetViewAngles(FinAngle)
								end
							end
						end
					end
				end
			end
		end
	end
end)

function GetAngleDiffrence(from, to)

	local ang, aim

	ang = from:Forward()
	aim = to:Forward()

	return math.deg( math.acos( aim:Dot(ang) / aim:LengthSqr() ) )

end

function HitScan(v)
	local bones = {}
	local centerx, centery = ScrW() / 2, ScrH() / 2
	local BPHead, BPUpperChest, BPChest, BPLowerChest, BPPelvis, HeadDis, UpperChestDis, ChestDis, LowerChestDis, PelvisDis

	if v:LookupBone("ValveBiped.Bip01_Head1") != nil then
		BPHead = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Head1"))
		HeadDis = math.sqrt((centerx - BPHead:ToScreen().x) * (centerx - BPHead:ToScreen().x) + (centery - BPHead:ToScreen().y) * (centery - BPHead:ToScreen().y))
		table.insert(bones, HeadDis)
	end
	if v:LookupBone("ValveBiped.Bip01_Spine4") != nil then
		BPUpperChest = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Spine4"))
		UpperChestDis = math.sqrt((centerx - BPUpperChest:ToScreen().x) * (centerx - BPUpperChest:ToScreen().x) + (centery - BPUpperChest:ToScreen().y) * (centery - BPUpperChest:ToScreen().y))
		table.insert(bones, UpperChestDis)
	end
	if v:LookupBone("ValveBiped.Bip01_Spine2") != nil then
		BPChest = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Spine2"))
		ChestDis = math.sqrt((centerx - BPChest:ToScreen().x) * (centerx - BPChest:ToScreen().x) + (centery - BPChest:ToScreen().y) * (centery - BPChest:ToScreen().y))
		table.insert(bones, ChestDis)
	end
	if v:LookupBone("ValveBiped.Bip01_Spine1") != nil then
		BPLowerChest = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Spine1"))
		LowerChestDis = math.sqrt((centerx - BPLowerChest:ToScreen().x) * (centerx - BPLowerChest:ToScreen().x) + (centery - BPLowerChest:ToScreen().y) * (centery - BPLowerChest:ToScreen().y))
		table.insert(bones, LowerChestDis)
	end
	if v:LookupBone("ValveBiped.Bip01_Pelvis") != nil then
		BPPelvis = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Pelvis"))
		PelvisDis = math.sqrt((centerx - BPPelvis:ToScreen().x) * (centerx - BPPelvis:ToScreen().x) + (centery - BPPelvis:ToScreen().y) * (centery - BPPelvis:ToScreen().y))
		table.insert(bones, PelvisDis)
	end

	if table.IsEmpty(bones) then return v:LocalToWorld(v:OBBCenter()) + pred end

	local ClosestBone = math.min(unpack(bones))
	if ClosestBone == HeadDis then
		AimSpot = BPHead + Vector(0, 0, 1) + pred
		AimBone = "Head"
	elseif ClosestBone == UpperChestDis then
		AimSpot = BPUpperChest + pred
		AimBone = "Upper Chest"
	elseif ClosestBone == ChestDis then
		AimSpot = BPChest + pred
		AimBone = "Chest"
	elseif ClosestBone == LowerChestDis then
		AimSpot = BPLowerChest + pred
		AimBone = "Lower Chest"
	elseif ClosestBone == PelvisDis then
		AimSpot = BPPelvis + pred
		AimBone = "Pelvis"
	else
		AimSpot = v:LocalToWorld(v:OBBCenter()) + pred
		local errorDelay = false
		if !errorDelay then
			chat.AddText(Color(61, 149, 217), "[Time's Hack] ", Color(255, 0, 0), "|WARNING|", Color(222, 222, 222), "Hitscan Failed Please Report This To The Developer.")
			errorDelay = true
			timer.Simple(5, function() errorDelay = false end)
		end
	end	
	return AimSpot
end

function Prediction(v, pos)
	local ply = LocalPlayer()
	if ( type( v:GetVelocity() ) == "Vector" ) then
		local dis, wep = v:GetPos():Distance( ply:GetPos() ), ( ply.GetActiveWeapon && IsValid( ply:GetActiveWeapon() ) && ply:GetActiveWeapon():GetClass() )
		if ( wep && predictedWeapons[ wep ]  ) then
			local t = dis / predictedWeapons[ wep ]
			return ( pos + v:GetVelocity() * t )
		end
		return pos
	end
	return pos
end

function isVisible( v )
	local ply = LocalPlayer()
	
	local pos = v:LocalToWorld(v:OBBCenter())
	
	local trace = { 
		start = ply:GetShootPos(), 
		endpos = pos, 
		filter = { ply, v }, 
		mask = MASK_SHOT
	}
	local tr = util.TraceLine( trace )
	
	if( !tr.Hit ) then
		return true
	end
	return false
end

function Smoothing( ang )
	if ( config["aim_smoothing_value"] == 0 ) then return ang end
	local speed, ply = RealFrameTime() / ( config["aim_smoothing_value"] / 10 ), LocalPlayer()
	local angl = LerpAngle( speed, ply:EyeAngles(), ang )
	return Angle( angl.p, angl.y, 0 )
end

--=================================== Trigger

hook.Add("CreateMove", RandomString(), function( ucmd )
	if config["trigger_master_toggle"] then
		if !config["trigger_onkey"] || ( ( ( config.keybinds["trigger_onkey_key"] >= 107 && config.keybinds["trigger_onkey_key"] <= 113 ) && input.IsMouseDown(config.keybinds["trigger_onkey_key"]) ) || input.IsKeyDown(config.keybinds["trigger_onkey_key"]) ) && !frame then
			if IsValid(LocalPlayer()) && LocalPlayer():Alive() then
				if LocalPlayer():GetActiveWeapon():GetClass() != "weapon_physgun" then
					local tr = LocalPlayer():GetEyeTraceNoCursor()
					if tr.Entity:IsPlayer() then
						ply = tr.Entity
						if ValidateAimbot(ply) then
							if ucmd:KeyDown( IN_ATTACK2 ) && ucmd:KeyDown( IN_DUCK ) then 
								ucmd:SetButtons( IN_DUCK + IN_ATTACK2 + IN_ATTACK )
								timer.Simple( 0.05, function() RunConsoleCommand( "-attack" ) end ) 
							elseif ucmd:KeyDown( IN_DUCK ) then 
								ucmd:SetButtons( IN_DUCK + IN_ATTACK )
								timer.Simple( 0.05, function() RunConsoleCommand( "-attack" ) end )
							elseif ucmd:KeyDown( IN_ATTACK2 ) then 
								ucmd:SetButtons( IN_ATTACK2 + IN_ATTACK )
								timer.Simple( 0.05, function() RunConsoleCommand( "-attack" ) end ) 
							else
								ucmd:SetButtons( IN_ATTACK ) 
								timer.Simple( 0.05, function() RunConsoleCommand( "-attack" ) end )
							end
						end
					end
				end
			end
		end
	end
end)

--===================================
--=================================== Misc
--===================================

--=================================== Auto Strafe + Bhop

strafe = { }
strafe.MetaPlayer = FindMetaTable( "Player") 
strafe.oldKeyDown = strafe.MetaPlayer['KeyDown']
strafe.On = true
strafe.MetaPlayer['KeyDown'] = function( self, key )
	if self ~= LocalPlayer() then return end

	if (key == IN_MOVELEFT) and strafe.left then
		return true
	elseif (key == IN_MOVERIGHT) and strafe.right then
		return true
	else
		return strafe.oldKeyDown( self, key )
	end
end

local oldEyePos = LocalPlayer():EyeAngles()

function Autostrafe( cmd )
	if !( LocalPlayer():GetMoveType() == MOVETYPE_LADDER || LocalPlayer():GetMoveType() == MOVETYPE_NOCLIP ) then 
		if (cmd:KeyDown( IN_JUMP )) then
			if (strafe.On ) then

				local traceRes = LocalPlayer():EyeAngles()
									   
				if ( traceRes.y > oldEyePos.y ) then
					oldEyePos = traceRes
					cmd:SetSideMove( -1000000 )
					strafe.left = true
					strafe.right = false 
				elseif  ( oldEyePos.y > traceRes.y )  then
					oldEyePos = traceRes
					cmd:SetSideMove( 1000000 )
					strafe.right = true
					strafe.left = false
				end
			end
		end	
	end 
end

hook.Add("CreateMove", RandomString(), function( ucmd )
	if config["misc_autostrafe"] then
		Autostrafe( ucmd )
	end
	if config["misc_autobunnyhop"] then
		local ply = LocalPlayer()
		if ( ply:GetMoveType() == MOVETYPE_LADDER || ply:GetMoveType() == MOVETYPE_NOCLIP ) then return end
		if ( ucmd:KeyDown( IN_JUMP ) ) then
			if ( !ply:OnGround() ) then
				ucmd:SetButtons( ucmd:GetButtons() - IN_JUMP )
			end
		end
	end
end)

--=================================== TTT

--local twep = { "weapon_ttt_c4", "weapon_ttt_knife", "weapon_ttt_phammer", "weapon_ttt_sipistol", "weapon_ttt_flaregun", "weapon_ttt_push", "weapon_ttt_radio", "weapon_ttt_teleport", "(Disguise)" ,"spiderman's_swep", "weapon_ttt_trait_defilibrator", "weapon_ttt_xbow", "weapon_ttt_dhook", "weapon_awp", "weapon_jihadbomb", "weapon_ttt_knife", "weapon_ttt_c4", "weapon_ttt_decoy", "weapon_ttt_flaregun", "weapon_ttt_phammer", "weapon_ttt_push", "weapon_ttt_radio", "weapon_ttt_sipistol", "weapon_ttt_teleport", "weapon_ttt_awp", "weapon_ttt_silencedsniper", "weapon_ttt_turtlenade", "weapon_ttt_death_station", "weapon_ttt_tripmine"}
local twep = {}

for _,v in ipairs(player.GetAll()) do
    v.Traitor = nil
end
for _,v in ipairs(ents.GetAll()) do
    v.WepTracked = nil
end

hook.Add("TTTBeginRound", RandomString(), function()
	table.Empty(twep)
	for _, wep in pairs(weapons.GetList()) do
    	if wep and wep.CanBuy != nil then
      		for _, role in pairs(wep.CanBuy) do
        		if role == ROLE_TRAITOR then
          			if !table.HasValue(twep, wep.ClassName) then 
          				table.insert(twep, wep.ClassName)
          			end
        		end 
      		end
      	end
    end
end)

hook.Add("Think", RandomString(), function()
	if config["misc_ttt"] && engine.ActiveGamemode() == "terrortown" then
		if table.IsEmpty(twep) then
			twep = { "weapon_ttt_c4", "weapon_ttt_knife", "weapon_ttt_phammer", "weapon_ttt_sipistol", "weapon_ttt_flaregun", "weapon_ttt_push", "weapon_ttt_radio", "weapon_ttt_teleport", "(Disguise)" ,"spiderman's_swep", "weapon_ttt_trait_defilibrator", "weapon_ttt_xbow", "weapon_ttt_dhook", "weapon_awp", "weapon_jihadbomb", "weapon_ttt_knife", "weapon_ttt_c4", "weapon_ttt_decoy", "weapon_ttt_flaregun", "weapon_ttt_phammer", "weapon_ttt_push", "weapon_ttt_radio", "weapon_ttt_sipistol", "weapon_ttt_teleport", "weapon_ttt_awp", "weapon_ttt_silencedsniper", "weapon_ttt_turtlenade", "weapon_ttt_death_station", "weapon_ttt_tripmine"}
		end
	    if GAMEMODE.round_state != ROUND_ACTIVE then
	        for _,v in ipairs(player.GetAll()) do
	                v.Traitor = nil
	        end
	        for _,v in ipairs(ents.GetAll()) do
	                v.WepTracked = nil
	        end
	        return
	    end
	    for _,v in ipairs( ents.GetAll() ) do
	        if v and IsValid(v) and (table.HasValue(twep, v:GetClass()) and !v.WepTracked) then
	            local pl = v.Owner
	            if pl and IsValid(pl) and pl:IsTerror() then
	                if pl:IsDetective() then
	                    v.WepTracked = true
	                else
	                    v.WepTracked = true
	                    pl.Traitor = true
	                    chat.AddText(Color(61, 149, 217), "[Time's Hack] ", Color(222, 222, 222), pl,  " is a ", Color(255,0,0), "TRAITOR", Color(222, 222, 222), " with a ", Color(255, 0, 0), v:GetClass() .. "!")
	                end
	            end
	        end
	    end
	end
end)

--=================================== Rainbow Physgun

hook.Add("Think", RandomString(), function()
	if config["misc_rainbow"] then
		local col = HSVToColor( ( CurTime() * config["misc_rainbow_speed"] ) % 360, 1, 1 )
		if LocalPlayer():Alive() && IsValid(LocalPlayer():GetActiveWeapon()) then
			if LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" then
				LocalPlayer():SetWeaponColor( Color(col.r, col.g, col.b):ToVector() )
			end
		end
	end
end)

--=================================== Auto Click

hook.Add("CreateMove", RandomString(), function( cmd )
	if config["misc_autoclick"] then
		if LocalPlayer():Alive() && IsValid(LocalPlayer():GetActiveWeapon()) then
			if LocalPlayer():GetActiveWeapon():GetClass() != "weapon_physgun" then
				if LocalPlayer():KeyDown( IN_ATTACK ) then cmd:RemoveKey(IN_ATTACK) end
			end
		end
	end
end)

--===================================
--=================================== Net Logger
--===================================

local netCodes = netCodes or {
	["SendToServer"] = net.SendToServer,
	["Start"] = net.Start,
	["WriteAngle"] = net.WriteAngle,
	["WriteBit"] = net.WriteBit,
	["WriteBool"] = net.WriteBool,
	["WriteColor"] = net.WriteColor,
	["WriteData"] = net.WriteData,
	["WriteDouble"] = net.WriteDouble,
	["WriteEntity"] = net.WriteEntity,
	["WriteFloat"] = net.WriteFloat,
	["WriteInt"] = net.WriteInt,
	["WriteMatrix"] = net.WriteMatrix,
	["WriteNormal"] = net.WriteNormal,
	["WriteString"] = net.WriteString,
	["WriteTable"] = net.WriteTable,
	["WriteUInt"] = net.WriteUInt,
	["WriteVector"] = net.WriteVector
}

function tableToString(t)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local buffer = ""

local function construct_net_block(t, netName)
	makeString = "net." ..netName .. "("
	for i=1, #t do
		indexValue = t[i]
		if (type(indexValue) == "number") then
			if (i == #t) then makeString = makeString .. indexValue  else makeString = makeString .. indexValue .. ", " end
		elseif (type(indexValue) == "boolean") then
			makeString = makeString .. tostring(indexValue)
		elseif (type(indexValue) == "string") then
			if (i == #t) then makeString = makeString .. "\"" .. indexValue .. "\"" else makeString = makeString .. "\"" .. indexValue .. "\", " end
		elseif (type(indexValue) == "Player" || type(indexValue) == "Entity" || type(indexValue) == "NPC") then
			makeString = makeString .. "Entity(" .. tostring(indexValue:EntIndex()) .. ")"
		elseif (type(indexValue) == "Vector") then
			makeString = makeString .. "Vector(" .. string.gsub(tostring(indexValue), "%s+", ", ") .. ")"
		elseif (type(indexValue) == "table") then
			makeString = makeString .. table.ToString(indexValue)
		else
			--ErrorNoHalt("[Net Logger] !!! UNHANDLED !!! " .. "type(index): " .. "[" .. type(indexValue) .. "]" .. " index: " ..  "[" .. tostring(indexValue) .. "]")
		end
	end
	
	buffer = buffer .. makeString .. ")" .. "\n"
	if (string.match(buffer, "SendToServer")) then
		hook.Run( "RecvNetMsg", buffer )
		buffer = ""
	end
end

function handle_net_message(netName)
	return function (...) -- just doing this so I can give access to netName in construct_net_block function
		construct_net_block({...}, netName)
		hook.Add( "RecvNetMsg", "netlogger", function(netmsg)
			detour_net_functions(false)
			RunString(netmsg)
			detour_net_functions(true)
		end)
			
		-- netCodes[netName](...)
	end
end


function detour_net_functions(bool) -- WriteTable calls a bunch of other net functions internally, so got to turn it off
	if (bool) then
		for k, v in pairs(netCodes) do
			net[k] = handle_net_message(k)
		end
	else
		for k, v in pairs(netCodes) do
			net[k] = v
		end
	end
		
end


if (!detoured_net_functions) then
	detoured_net_functions = true
	detour_net_functions(true)
end

function mysplit(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={} ; i=1
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                t[i] = str
                i = i + 1
        end
        return t
end

local net_message_box = {
	setTextAndCount = function(self, text, count)
		newLineCount = #mysplit(text, "\n")
		self:SetTitle(" #" .. tostring(count))
		self.netmsgBox:SetText(text)
		W, H = self.netmsgBox:GetSize()
		self:SetSize(W, H + 125)
		self:SizeToContents()
	end,
	Init = function(self)
		outer_self = self
		self:ShowCloseButton( false )
		self:SetSize(150, 400)
		self.W, self.H = self:GetSize()
		self.netmsgBox = vgui.Create( "DTextEntry", self)
		self.netmsgBox:SetPos( 40, 50 )
		self.netmsgBox:Dock(FILL)
		self.netmsgBox:SetEditable(false)
		self.netmsgBox:SetMultiline(true)
		self.netmsgBox.Paint = function(self,w,h)
			self:DrawTextEntryText(Color(255, 255, 255), Color(30, 130, 255), Color(255, 255, 255))
		end

	end,
	Think = function(self, w, h)
		if (self:IsHovered()) then

		end
	end
}

vgui.Register("netmessagebox", net_message_box, "DFrame")

local net_message_table = {}
local PANEL = {
	addToCatergory = function(self, netmsg, freq)
		local name = mysplit(netmsg, "\n")[1]
		if !net_message_table[name] then
			local Category = self.CategoryList:Add(name)
			Category:SetExpanded(false)

			local countLabel = vgui.Create( "DLabel", Category )
			countLabel:SetFont("netFont")
			countLabel:SetColor(Color(255,255,255))
			countLabel:SetPos( 280, 0 )
			countLabel:SetSize(200,16)
			countLabel:SetText("COUNT: 1")

			net_message_box = vgui.Create("netmessagebox")
			net_message_box:Dock( TOP )
			net_message_box:setTextAndCount(netmsg, 1)


			DScrollPanel = vgui.Create( "DScrollPanel")
			Category:SetContents(DScrollPanel)

			DScrollPanel:Add(net_message_box)
			DScrollPanel:Dock( FILL )

			net_message_table[name] = {panel = Category, count = 1, countLabel = countLabel, DScrollPanel = DScrollPanel}
		else
			count = net_message_table[name].count + 1
			countLabel = net_message_table[name]["countLabel"]
			panel = net_message_table[name]["panel"]
			DScrollPanel = net_message_table[name]["DScrollPanel"]

			net_message_table[name] = { panel = panel, count = count, countLabel = countLabel, DScrollPanel = DScrollPanel}

			panel:SetLabel(name)

			countLabel:SetFont("netFont")
			countLabel:SetColor(Color(255,255,255))
			countLabel:SetPos( 280, 0 )
			countLabel:SetText("COUNT: " .. count)

			net_message_box = vgui.Create("netmessagebox")
			net_message_box:setTextAndCount(netmsg, count)
			net_message_box:Dock( TOP )
			DScrollPanel:Add(net_message_box)
			DScrollPanel:Dock( FILL )

			self.i = 0
		end
	end,
}

function PANEL:IsOpen(b)
	self.isFrameOpen = b
end

function PANEL:Init()
	self.isFrameOpen = true

	self.W, self.H = self:GetSize()

	outside_self = self
	self:SetSize(400, 400)
	self:SetTitle("Net Logger")
	self:Center()
	self:SetVisible( false )
	self:ShowCloseButton( false )
	--self:SetPaintedManually( true )
	self:SetDeleteOnClose(false)
	self.W, self.H = self:GetSize()

	self.NetLoggerPanel = vgui.Create( "DPanel", self )
	self.NetLoggerPanel:Dock( FILL )
	self.NetLoggerPanel:DockPadding(0, 0, 0, 0)

	self.CategoryList = vgui.Create( "DCategoryList", self.NetLoggerPanel )
	self.CategoryList:Dock( FILL )

	c = 0
	hook.Add( "RecvNetMsg", "netlogger2", function( netmsg )
		c = c + 1
		self:addToCatergory(netmsg, c)
	end )

end

vgui.Register("frame_handler", PANEL, "DFrame")

exploit_menu = vgui.Create("frame_handler")
exploit_menu:MakePopup()


--==================== Injection Welcome Message Thing

print("\n")
MsgC(Color(61, 149, 217), "████████╗██╗███╗░░░███╗███████╗██╗░██████╗  ██╗░░██╗░█████╗░░█████╗░██╗░░██╗\n╚══██╔══╝██║████╗░████║██╔════╝╚█║██╔════╝  ██║░░██║██╔══██╗██╔══██╗██║░██╔╝\n░░░██║░░░██║██╔████╔██║█████╗░░░╚╝╚█████╗░  ███████║███████║██║░░╚═╝█████═╝░\n░░░██║░░░██║██║╚██╔╝██║██╔══╝░░░░░░╚═══██╗  ██╔══██║██╔══██║██║░░██╗██╔═██╗░\n░░░██║░░░██║██║░╚═╝░██║███████╗░░░██████╔╝  ██║░░██║██║░░██║╚█████╔╝██║░╚██╗\n░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝╚══════╝░░░╚═════╝░  ╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝\n")

notification.AddLegacy("Successfully Loaded Time's Hack - Welcome " .. LocalPlayer():Nick() .. " | " .. os.date("%I:%M %p"), NOTIFY_HINT, 5)
surface.PlaySound( "buttons/button15.wav" )

--==================== Credits

--[[

TTT Traitor Detector - https://www.unknowncheats.me/forum/garry-s-mod/103976-gmod-ttt-traitor-detector-lua-script.html
Net Logger - https://www.mpgh.net/forum/showthread.php?t=1432417
Smeg Hack - https://www.unknowncheats.me/forum/other-fps-games/140626-smeg-hack-garrys-mod-lua-hack.html
Hermes - https://github.com/fr1kin/gmod-lua-scripts/tree/master/hermes/hermesv2_release
Various UC Posts

]]
