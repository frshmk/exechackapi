surface.CreateFont( "sdelal_d3d9c", {
    font = "CloseCaption_Bold", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 50,
    weight = 600,
    shadow = true,
} )
local ply = LocalPlayer()
hook.Add( "HUDPaint", "VelocityIndicator", function()
    local color_sin = (math.sin(CurTime()) + 1) / 2
    surface.SetDrawColor(color_sin * 255, 0, 255 - (color_sin * 255), 150, 220)
    surface.SetMaterial( Material("gui/gradient_up") )
    surface.DrawTexturedRect(ScrW() / 2 - 225, ScrH() - 105, 450, 100)   
    surface.SetDrawColor(10,10,10,220)
    surface.DrawRect(ScrW() / 2 - 225, ScrH() - 105, 450, 100)
    // Outline
    surface.SetDrawColor( 0, 0, 0, 250 )
    surface.DrawOutlinedRect( ScrW() / 2 - 225, ScrH() - 105, 450, 100, 1 )
    surface.SetDrawColor( color_sin * 255, 0, 255 - (color_sin * 255), 255 )
    surface.DrawOutlinedRect( ScrW() / 2 - 226, ScrH() - 106, 452, 102, 1 )
    surface.SetDrawColor( 0, 0, 0, 250 )
    surface.DrawOutlinedRect( ScrW() / 2 - 227, ScrH() - 107, 454, 104, 1 )
    //Speedometer   
    local plyspeed = math.Round(ply:GetVelocity():Length())
    draw.SimpleTextOutlined( "Speed: "..plyspeed, "sdelal_d3d9c", ScrW() / 2, ScrH() - 70,  Color(color_sin * 255, 0, 255 - (color_sin * 255), 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0 , 0 ))

    if plyspeed < 440 then
    surface.SetDrawColor(color_sin * 255, 0, 255 - (color_sin * 255), 150, 220)
    surface.SetMaterial( Material("gui/gradient") )
    surface.DrawTexturedRect(ScrW() / 2 - 220, ScrH() - 35, plyspeed, 25)   
   end
    if plyspeed >= 440 then
    surface.SetDrawColor(color_sin * 255, 0, 255 - (color_sin * 255), 150, 220)
    surface.SetMaterial( Material("gui/gradient") )
    surface.DrawTexturedRect(ScrW() / 2 - 220, ScrH() - 35, 440, 25)   
   end
    surface.SetDrawColor( 0, 0, 0, 250 )
    surface.DrawOutlinedRect( ScrW() / 2 - 220, ScrH() - 35, 440, 25, 1 )
end)
