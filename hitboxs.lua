hook.Add("HUDPaint","2",function()
    local v = exechack_api.GetAimbotTarget()
    if v then
        local pos = v:GetPos()
        local min,max = v:GetCollisionBounds()
        local pos2 = pos + Vector(0, 0, max.z);
        local pos = pos:ToScreen();
        local pos2 = pos2:ToScreen();
        for i=0,v:GetHitBoxGroupCount()-1 do
            local count = v:GetHitBoxCount(i)
            if not count then continue end
            for hitbox=0,count do
                local bone = v:GetHitBoxBone(hitbox,i)
                if not bone then continue end
                local min, max = v:GetHitBoxBounds(hitbox,i)
                local bonepos, boneang = v:GetBonePosition(bone)
                cam.Start3D()
                render.DrawWireframeBox(bonepos,boneang,min,max,Color(255,255,255),true)
                cam.End3D()
            end
        end
    end
end)
