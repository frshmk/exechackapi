concommand.Add("fb",function()
fb = !fb

if fb then
    exechack_api.cfg_SetValue("WH_FULLBRIGHT",true)
else
    exechack_api.cfg_SetValue("WH_FULLBRIGHT",false)
end
end)
