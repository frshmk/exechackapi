hook.Add( "Think", "DynamicLights", function()
    local dlight = DynamicLight( LocalPlayer():EntIndex() )
    if ( dlight ) then
        dlight.pos = LocalPlayer():GetShootPos()
        local col = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
        dlight.r = col.r
        dlight.g = col.g
        dlight.b = col.b
        dlight.brightness = 2
        dlight.Decay = 1000
        dlight.Size = 300
        dlight.DieTime = CurTime() + 1
    end
end )
