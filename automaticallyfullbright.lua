local a,b
if game.GetMap()~="rp_bangclaw"then return end
hook.Add("Think","fullbright",function()
	a=false
	if LocalPlayer():GetPos().z>=0 then a=true end
	if b~=a then
		b=a
		if a then
			exechack_api.cfg_SetValue("WH_FULLBRIGHT",false)
		else 
			exechack_api.cfg_SetValue("WH_FULLBRIGHT",true)
		end 
	end 
end)
