local cooltable = table.Copy(_G)
local yeet = {}
    yeet.ply = LocalPlayer()
    yeet.hooks = {}
    gameevent.Listen("entity_killed")
    gameevent.Listen("player_connect")
    gameevent.Listen("player_disconnect")
    gameevent.Listen("player_changename")
    gameevent.Listen("server_cvar")
    gameevent.Listen("player_say")
    yeet.messageJustSent = false
    yeet.messages = 0
    yeet.EventsAlpha = 0
    timer.Create("eventListTimer", 8, 0, function() yeet.messageJustSent = false end)

    function yeet.drawText(x, y, text, font, color) surface.SetTextColor(color) surface.SetTextPos(x, y) surface.SetFont(font) surface.DrawText(text) end
    function yeet.addHook(event, func) yeet.randomString = tostring(math.random(0, 9999999999)) cooltable.hook.Add(event, yeet.randomString, func) table.insert(yeet.hooks, event) table.insert(yeet.hooks, yeet.randomString) end
 
function yeet.eventListOpen()
    yeet.eventList = vgui.Create("DFrame")
    yeet.eventList:SetDraggable(false)
    yeet.eventList:ShowCloseButton(false)
    yeet.eventList:SetPos(-5, 22)
    yeet.eventList:SetSize(800, 200)
    yeet.eventList:SetTitle("")
    yeet.eventList.Paint = function() end

    yeet.Events = vgui.Create("RichText", yeet.eventList)
    yeet.Events:Dock(FILL)
    yeet.Events:SetVerticalScrollbarEnabled(false) 
    yeet.Events.Paint = function()
        -- if(false) then yeet.eventList:SetPos(-5, 22) else yeet.eventList:SetPos(-5, -27) end
        if(!yeet.messageJustSent) then if(yeet.EventsAlpha > 0) then yeet.EventsAlpha = yeet.EventsAlpha - 4 end end
        if(yeet.messages > 5 && yeet.messageJustSent) then yeet.Events:GotoTextEnd() end
        yeet.Events:SetAlpha(yeet.EventsAlpha)

    end

    yeet.Events.PerformLayout = function(self)
        self:SetFontInternal("ChatFont")
    end

    function yeet.addEventlistMessage(message1, message2,message3)
        timer.Stop("eventListTimer")
        yeet.messageJustSent = true
        yeet.messages = yeet.messages + 1
        yeet.EventsAlpha = 255
        if(yeet.messageJustSent) then timer.Start("eventListTimer") end
        yeet.Events:InsertColorChange(0, 0, 0, 255)
        yeet.Events:AppendText("|")
        
        yeet.Events:InsertColorChange(255, 255, 255, 255)
        yeet.Events:AppendText("Cheesy")

        yeet.Events:InsertColorChange(255, 0, 0, 255)
        yeet.Events:AppendText("Logs")

        yeet.Events:InsertColorChange(0, 0, 0, 255)
        yeet.Events:AppendText("|")

        
        if (message3 != nil) then
            yeet.Events:InsertColorChange(255, 255, 255, 255)
            yeet.Events:AppendText(" ".. message1)
            yeet.Events:InsertColorChange(255, 0, 0, 255)
            yeet.Events:AppendText(" ".. message2)
            yeet.Events:InsertColorChange(255, 0, 0, 255)
            yeet.Events:AppendText(" ".. message3.. "\n")
            
        elseif(message2 != nil) then
            yeet.Events:InsertColorChange(255, 255, 255, 255)
            yeet.Events:AppendText(" ".. message1)
            yeet.Events:InsertColorChange(255, 0, 0, 255)
            yeet.Events:AppendText(" ".. message2.. "\n")
            else
        yeet.Events:InsertColorChange(255, 255, 255, 255)
            yeet.Events:AppendText(" ".. message1 .. "\n")
        end
        
    end
    yeet.eventList:SetPaintedManually( true )
end
yeet.addHook("player_connect", function(data)
--print("hi")
-- if(GetConVar("jeff_eventlog"):GetInt() == 1) then
    yeet.addEventlistMessage(data["name"].. " connected to the server.")
--  end




for k, v in pairs(player.GetAll()) do
    v.espAlpha = 0
end
end)

yeet.addHook("player_disconnect", function(data)
--if(GetConVar("jeff_eventlog"):GetInt() == 1) then
    yeet.addEventlistMessage(data["name"].. " disconnected from the server. (".. data["reason"]..")")
-- end
end)

yeet.addHook("player_changename", function(data)
--  if(GetConVar("jeff_eventlog"):GetInt() == 1) then
    yeet.addEventlistMessage("[".. data["userid"].. "] ".. data["oldname"].. " has changed his/her name to ".. data["newname"].. ".")
--  end
end)



yeet.addHook("server_cvar", function(data)
--if(GetConVar("jeff_eventlog"):GetInt() == 1) then
    yeet.addEventlistMessage(data["cvarname"].. " was changed to ".. data["cvarvalue"]..".")
-- end
end)

yeet.addHook("entity_killed", function(info)
local Entity = Entity

yeet.inflictor = Entity(info.entindex_inflictor)
yeet.killer = Entity(info.entindex_attacker)
yeet.victim = Entity(info.entindex_killed)

--if(GetConVar("jeff_eventlog"):GetInt() == 1) then
    if(IsValid(yeet.killer) && IsValid(yeet.victim) && yeet.killer:IsPlayer() && yeet.victim:IsPlayer()) then
        if(yeet.killer == yeet.victim && yeet.victim ~= yeet.ply) then
            yeet.addEventlistMessage(yeet.victim:Nick().. " killed themself.")
        elseif(yeet.killer == yeet.victim && yeet.victim == yeet.ply) then
            yeet.addEventlistMessage("You killed yourself.")
        elseif(yeet.killer == yeet.ply) then
            yeet.addEventlistMessage("You killed ", yeet.victim:Nick().. ".")
        elseif(yeet.victim == yeet.ply) then
            yeet.addEventlistMessage("You were killed by ", yeet.killer:Nick().. ".")
        else
            yeet.addEventlistMessage(yeet.killer:Nick(), " killed ", yeet.victim:Nick().. ".")
        end
    elseif(IsValid(yeet.victim) && !yeet.killer:IsPlayer() && yeet.victim:IsPlayer()) then
        if(IsValid(yeet.inflictor) && yeet.inflictor:GetClass() == "prop_physics") then
            if(yeet.victim == yeet.ply) then
                yeet.addEventlistMessage("You were killed by a prop.")
            else
                yeet.addEventlistMessage(yeet.victim:Nick().. " was killed by a prop.")
            end
        elseif(yeet.victim == yeet.ply) then
            yeet.addEventlistMessage("You were killed by the world.")
        else
            yeet.addEventlistMessage(yeet.victim:Nick().. " was killed by the world.")
        end
    end
--end
end)
yeet.eventListOpen()
hook.Add("HUDPaint", "Eventkill", function()
    yeet.eventList:PaintManual()
end )
