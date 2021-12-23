local FPS_table = {}
local MS_table = {}
Max_fps_nodes = 40
Max_ms_nodes = 40
FPS_inc = 0

hook.Add("HUDPaint","FPSHUD", function()

    FPS_get = (1/FrameTime())
    MS_get = LocalPlayer():Ping()
    
    if FPS_get > FPS_inc then FPS_inc = FPS_inc + 0.5 elseif FPS_get < FPS_inc then FPS_inc = FPS_inc - 1 end
    
    surface.SetDrawColor( 255,255,255,255 )
    surface.DrawRect( ScrW()/1.115, ScrH()/1.383, Max_fps_nodes * 5,300)
    
    surface.SetDrawColor( 50,50,50,255 )
    surface.DrawRect( ScrW()/1.115, ScrH()/1.42, Max_fps_nodes * 5,20)
    
    surface.SetDrawColor( 50,50,50,255 )
    surface.DrawRect( ScrW()/1.115, ScrH()/1.35, 20,1)
    
    surface.SetDrawColor( 50,50,50,255 )
    surface.DrawRect( ScrW()/1.115, ScrH()/1.35 + 115, 20,1)
    
    surface.SetFont( "Default" )
    surface.SetTextColor( 50,50,50,255 )
    surface.SetTextPos( ScrW()/1 - 20, ScrH()/1.35)
    surface.DrawText("250")
    
    surface.SetFont( "Default" )
    surface.SetTextColor( 50,50,50,255 )
    surface.SetTextPos( ScrW()/1 - 20, ScrH()/1.35 + 115)
    surface.DrawText("150")
    
    for k,v in pairs( FPS_table ) do
    
        surface.SetDrawColor( 50,50,50,255 )
        surface.DrawRect( ScrW()/1 + -k*5, ScrH()/1 - v, 5,5 + v)
        
        surface.SetFont( "TargetIDSmall" )
        surface.SetTextColor( 255,255,255,255 )
        surface.SetTextPos( ScrW()/1.11, ScrH()/1.4155)
        surface.DrawText("FPS "..math.Round(FPS_inc))
        
    end

    for k,v in pairs( MS_table ) do
    
        surface.SetDrawColor( 200,200,200,255 )
        surface.DrawRect( ScrW()/1 + -k*5, ScrH()/1 - v, 5,5 + v)
        
        surface.SetFont( "TargetIDSmall" )
        surface.SetTextColor( 255,255,255,255 )
        surface.SetTextPos( ScrW()/1.07, ScrH()/1.4155)
        surface.DrawText(" |    Ms "..math.Round(MS_get))
        
    end
    

end)

timer.Create("timerinc",0.1, 0, function()
 table.insert(FPS_table,1,math.Clamp(FPS_get,0,300))

 if table.Count(FPS_table) > Max_fps_nodes then
  table.remove(FPS_table)
 end
end)
timer.Create("timerms",0.1, 0, function()
 table.insert(MS_table,1,math.Clamp(MS_get,0,300))

 if table.Count(MS_table) > Max_ms_nodes then
  table.remove(MS_table)
 end
end)

