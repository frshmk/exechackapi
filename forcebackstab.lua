local function Backstab( ucmd )
		viewang = ucmd:GetViewAngles()
            if(input.WasKeyPressed(KEY_E)) then
            	backstabdelay=true
        end
        if(backstabdelay == true) then
        	ucmd:SetViewAngles(viewang + Angle(45, 90 , 0))
        	RunConsoleCommand("+attack2")
            timer.Simple(0.07, function() RunConsoleCommand("-attack2") end)
            timer.Simple(0.05, function() backstabdelay = false end)
        end
    end
hook.Add("CreateMove", "Backstab", Backstab)
