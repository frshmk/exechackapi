local curprofa = -1
local gray, white, green, graywhite = Color(50, 50, 50), Color(255, 255, 255), Color(100, 255, 100), Color(200, 200, 200)
local rp = RPExtraTeams
local function shit()
	local f = vgui.Create("DFrame")
	f:SetTitle("jobsniper")
	f:SetSize(ScrW()/2, ScrH()/2)
	f:Center()
	f:MakePopup()
	function f:Paint(x,y)
		draw.RoundedBox(8, 0, 0, x,y, gray)
	end
	local s = f:Add("DScrollPanel")
	s:Dock(FILL)
	for i = 1, #team.GetAllTeams() do
		local b = s:Add("DButton")
		function b:Paint(x,y)
			local col = self:IsHovered() and white or curprofa == self.id and green or graywhite
			draw.RoundedBox(8, 0, 0, x,y, col)
		end
		b:SetText(rp[i].name)
		function b:DoClick()
			if curprofa == self.id then
				curprofa = -1
			else
				curprofa = self.id
			end
		end
		b.id = i
		b:Dock(TOP)
		b:SetSize(0, 32)
	end
end

hook.Add("Think", "Sychka", function()
	if curprofa == -1 or curprofa == LocalPlayer():Team() then return end
	local limit = rp[curprofa].max == 0 and math.huge or rp[curprofa].max
	if team.NumPlayers(curprofa) < limit then
		RunConsoleCommand("say", "/" .. rp[curprofa].command)
	end
end)
concommand.Add("_jobsniper", shit)