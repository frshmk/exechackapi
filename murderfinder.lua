local shit={}
timer.Create("gdfgdgd",1,0,function()
if engine.ActiveGamemode()=="murder" then
for j,p in pairs(player.GetAll())do 
for dK,dL in pairs(p:GetWeapons())do 
if string.find(dL:GetClass(),"weapon_mu_knife")then 
local f=dL.Owner
shit.murder="Murder is "..f:GetBystanderName().." | "..f:Nick()
end
end 
end
shit.oldmurder=shit.oldmurder or""
if shit.murder == shit.oldmurder then
else
LocalPlayer():ChatPrint(shit.murder or"")
shit.oldmurder=shit.murder
end
end
end)

-- vk.com/urbanichka
