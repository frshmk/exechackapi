surface.CreateFont("45", {font = "Bahnschrift", extended = false, size = 30, weight = 1000, antialias = true})
surface.CreateFont(
    "56",
    {font = "Bahnschrift", extended = false, size = 30, blursize = 4, weight = 1000, antialias = true}
)
local a = {}
hook.Add(
    "HUDPaint",
    "123",
    function()
        local b = {}
        for c, d in pairs(a) do
            cam.Start3D()
            local e = d.pos:ToScreen()
            local f = e.x
            local g = e.y
            cam.End3D()
            cam.Start2D()
            surface.SetFont("56")
            local h = surface.GetTextSize(tostring(d.num))
            surface.SetTextColor(0, 0, 0, 255 * d.life)
            surface.SetTextPos(f - h / 2, g)
            surface.DrawText(tostring(d.num))
            surface.SetFont("45")
            surface.SetTextColor(255, 255 - d.num, 255 - d.num, 255 * d.life)
            surface.SetTextPos(f - h / 2, g)
            surface.DrawText(tostring(d.num))
            d.pos = d.pos + Vector(0, 0, RealFrameTime() * 32)
            d.pos = d.pos + d.vec * RealFrameTime() * 8
            d.life = d.life - RealFrameTime() * 1 / 0.75
            if d.life > 0 then
                table.insert(b, d)
            end
            cam.End2D()
        end
        a = b
    end
)
gameevent.Listen("player_hurt")
hook.Add(
    "player_hurt",
    "11",
    function(i)
        local j = 0
        for d, l in pairs(player.GetAll()) do
            if l:UserID() == i.userid then
                entt = l
                j = l:Health()
            end
            if l:UserID() == i.attacker then
                k = l
            end
        end
        if entt:Health() == 0 then
            return
        end
        if not k == LocalPlayer() then
            return
        end
        local k = entt:GetPos() + Vector(0, 0, 60)
        local m = string.Replace(i.health - j, "-", "")
        m = math.Round(m, 1)
        table.insert(a, {pos = k, life = 1, num = m, vec = VectorRand()})
    end
)
