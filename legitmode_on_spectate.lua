local gay
local gay1
hook.Add("Think","1",function()
gay=false
for _,v in pairs(player.GetAll())do
if v:GetObserverTarget()==LocalPlayer()then
gay=true
end
end
if gay1~=gay then
gay1=gay
if gay then
exechack_api.cfg_SetValue("AIM_NOSPREAD",false)
exechack_api.cfg_SetValue("AIM_SILENT",false)
exechack_api.cfg_SetValue("AIM_SMOOTHING",4)
else
exechack_api.cfg_SetValue("AIM_NOSPREAD",true)
exechack_api.cfg_SetValue("AIM_SILENT",true)
exechack_api.cfg_SetValue("AIM_SMOOTHING",0)
end
end
end)
