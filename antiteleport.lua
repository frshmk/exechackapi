local a=LocalPlayer():GetPos()timer.Create("a",0.1,0,function()if not LocalPlayer():Alive()then a=LocalPlayer():GetPos()return end;if LocalPlayer():GetPos():Distance(a)>1000 then RunConsoleCommand("darkrp","rpname "..math.random(2555555555))RunConsoleCommand("disconnect")end;a=LocalPlayer():GetPos()end)