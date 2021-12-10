LocalPlayer():ChatPrint("TTT Finder Loaded")
local twep = { "weapon_ttt_c4", "weapon_ttt_knife", "weapon_ttt_phammer", "weapon_ttt_sipistol", "weapon_ttt_flaregun", "weapon_ttt_push", "weapon_ttt_radio", "weapon_ttt_teleport", "(Disguise)" ,"spiderman's_swep", "weapon_ttt_trait_defilibrator", "weapon_ttt_xbow", "weapon_ttt_dhook", "weapon_awp", "weapon_jihadbomb", "weapon_ttt_knife", "weapon_ttt_c4", "weapon_ttt_decoy", "weapon_ttt_flaregun", "weapon_ttt_phammer", "weapon_ttt_push", "weapon_ttt_radio", "weapon_ttt_sipistol", "weapon_ttt_teleport", "weapon_ttt_awp", "weapon_ttt_silencedsniper", "weapon_ttt_turtlenade", "weapon_ttt_death_station", "weapon_ttt_sg552", "weapon_ttt_tripmine"}

for _,v in pairs(player.GetAll()) do
        v.HatTraitor = nil
end
for _,v in pairs(ents.GetAll()) do
        v.HatESPTracked = nil
end

hook.Add("PostDrawOpaqueRenderables", "wire_animations_idle", function()
        if GAMEMODE.round_state != ROUND_ACTIVE then
                for _,v in pairs(player.GetAll()) do
                        v.HatTraitor = nil
                end
                for _,v in pairs(ents.GetAll()) do
                        v.HatESPTracked = nil
                end
                return
        end
        for _,v in pairs( ents.GetAll() ) do
                if v and IsValid(v) and (table.HasValue(twep, v:GetClass()) and !v.HatESPTracked) then
                        local pl = v.Owner
                        if pl and IsValid(pl) and pl:IsTerror() then
                                if pl:IsDetective() then
                                        v.HatESPTracked = true
                                else
                                        v.HatESPTracked = true
                                        pl.HatTraitor = true
                                        chat.AddText( pl, Color(255,125,0), " is a ",Color(255,0,0), "TRAITOR",Color(255,125,0), " with a ",Color(255,0,0),v:GetClass().."!")
                                end
                        end
                end
        end

end)
