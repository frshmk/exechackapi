
hitmarkerTable = {}

me = LocalPlayer()

hook.Add("HUDPaint", "DrawTracer",function ()
    for k, v in next, hitmarkerTable do
        local pos = v[1]:ToScreen()

        if(v[2] <= 0) then
            table.remove(hitmarkerTable, k);
            continue;
        end
        v[2] = v[2] - FrameTime()
        surface.SetDrawColor(255, 255,255)
        surface.DrawLine( pos.x - 8, pos.y - 8, pos.x - 2, pos.y - 2 )
        surface.DrawLine( pos.x - 8, pos.y + 8, pos.x - 2, pos.y + 2 )
        surface.DrawLine( pos.x + 8, pos.y - 8, pos.x + 2, pos.y - 2 )
        surface.DrawLine( pos.x + 8, pos.y + 8, pos.x + 2, pos.y + 2 )
    end
end)

hook.Add("PlayerTraceAttack", "BulletTracer", function (ent, dmg, dir, trace)
    if(!IsFirstTimePredicted()) then return; end

    local vHitPos, vSrc;
    vHitPos = trace.HitPos;
    vSrc = trace.StartPos;

    table.insert(hitmarkerTable, {vHitPos, 1})
end)

gameevent.Listen("player_hurt")
hook.Add("player_hurt", "Hitmarker", function (data)
    if(data.attacker != me:UserID()) then return end
    sound.PlayFile("hitmarker.wav", "mono", function()
    end)
end)

