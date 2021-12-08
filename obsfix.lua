local a={}
hook.Add("HUDPaint","1",function()
	for b,c in next,a do
		if c and c:IsValid()and c:IsPopup() then
			c:SetPaintedManually(true)
			c:PaintManual()
		elseif c and c:IsValid() then
			c:SetPaintedManually(false)
		end
	end
end)
local d=vgui.Create
vgui.Create=function(e,f,...)
	local g=d(e,f,...)
	g:Prepare()
	if f==nil then 
		a[#a+1]=g
	end
	return g 
end
RunConsoleCommand("spawnmenu_reload")
