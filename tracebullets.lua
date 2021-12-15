
tracerTable = {}
hitmarkerTable = {}

me = LocalPlayer()

CreateClientConVar("lamarr_tracer", "cable/redlaser", true, false)

local lamarr_tracer = GetConVar("lamarr_tracer")

hook.Add("PreDrawOpaqueRenderables", "DrawTracerBeam", function ()
        for k,v in next, tracerTable do
        if(v[3] <= 0) then
            table.remove(tracerTable, k);
            continue;
        end
        tracerTable[k][3] = tracerTable[k][3] - FrameTime();
        local pos1, pos2 = v[1], v[2];
        cam.Start3D();
        render.SetMaterial(Material( lamarr_tracer:GetString() ))
        render.DrawBeam(v[1], v[2], 4, 1, 1, v[4])
        cam.End3D();
    end
end)

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

    table.insert(tracerTable, {vHitPos, vSrc, 5, Color(0, 255, 0), me:EyeAngles()});
    table.insert(hitmarkerTable, {vHitPos, 1})
end)

gameevent.Listen("player_hurt")
hook.Add("player_hurt", "Hitmarker", function (data)
    if(data.attacker != me:UserID()) then return end
    sound.PlayFile("hitmarker.wav", "mono", function()
    end)
end)

-- vk.com/urbanichka
