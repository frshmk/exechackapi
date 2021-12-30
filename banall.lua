local timer_send = 0
local cold_down = 0.1


local function SendMessage()
    for k, v in pairs(player.GetAll()) do
        if v ~= LocalPlayer() then
            timer.Simple(timer_send, function()
                LocalPlayer():ConCommand("say /ban "..v:Name().."10 obdrist") -- Если вам нужно под ulx, то пишите: LocalPlayer():ConCommand("ulx ban "..v:Name().." 10mi nwb")
          end)

            timer_send = timer_send + cold_down
        end
    end
end

timer.Create("SpamMessage", 0.1, 0, function()
    SendMessage()
end)
