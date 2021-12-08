hook.Add("PostDraw2DSkyBox", "Lol", function()

render.OverrideDepthEnable( true, false )

cam.Start2D()

color = HSVToColor(CurTime()% 6*60,1,1)

surface.SetDrawColor(color.r, color.g, color.b)

surface.DrawRect(0,0,ScrW(), ScrH())

cam.End2D()



render.OverrideDepthEnable( false, false )

end)