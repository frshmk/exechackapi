local atttime = 0.2

local lastwep = LocalPlayer():GetActiveWeapon()

local function propkill()

    if LocalPlayer():GetActiveWeapon():GetClass() ~= "weapon_physgun" then
        RunConsoleCommand("use", "weapon_physgun")
        timer.Simple(0.3, function()
            RunConsoleCommand("use", lastwep:GetClass())
        end)
    end


    hook.Add("CreateMove", "PKill", function(cmd)
        cmd:SetMouseWheel(100)
    end)

    RunConsoleCommand("gm_spawn", "models/props_c17/furnitureStove001a.mdl")


    timer.Simple(atttime, function()
        RunConsoleCommand("+attack")
    end)

    timer.Simple(atttime + .1, function()
        RunConsoleCommand("-attack")
    end)

    timer.Simple(0.5, function()
        hook.Remove("CreateMove", "PKill")
        RunConsoleCommand("undo")
    end)
end


concommand.Add("ea_pkill", propkill)
