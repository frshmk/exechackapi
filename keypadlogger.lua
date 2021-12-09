local grad = Material( "gui/gradient" )


function Vision()
local me = LocalPlayer()
if !me:IsValid() then return end
local e = me:GetEyeTrace().Entity
    -- if IsValid(e) and string.find( e:GetClass(), "Keypad") then
        -- local text;
        -- local color;
        -- if(e.code && e.code != "") then
            -- text = e.code;
            -- color = Color( 105, 255, 105, 150 )
        -- elseif(e.tempCode && e.tempCode != "") then
            -- text = e.tempCode;
            -- color = Color( 250, 150, 150, 150 )
        -- else
            -- text = "Unknown"
            -- color = Color(255,255,255)
        -- end
-- --        draw.WordBox( 8, ScrW() / 2, ScrH() / 2, text, "Default", color, Color(255,255,255,255) )
        -- surface.SetDrawColor( Color( 0,0,50, 150 ) )
        -- surface.SetMaterial( grad )
        -- surface.DrawTexturedRect( ScrW() / 2 + 57, ScrH() / 2 - 7, 50, 15 )
        -- draw.SimpleText(text, "DermaDefault", ScrW() / 2 + 60, ScrH() / 2, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    -- end



    for k,v in pairs(ents.GetAll()) do

        if IsValid(v) and string.find( v:GetClass(), "Keypad") then

            if v != e and me:GetPos():Distance( v:GetPos() ) < 8000 then

                local pos = v:GetPos():ToScreen()

                if pos.x > 0 and pos.x < ScrW() and pos.y > 0 and pos.y < ScrH() then

                    if (v.code && v.code != "") then

                        -- surface.SetDrawColor( Color( 0,0,50, 150 ) )

                        -- surface.SetMaterial( grad )

                        -- surface.DrawTexturedRect( pos.x, pos.y, 50, 15 )

                        draw.SimpleText( v.code, "TargetID", pos.x + 5, pos.y + 6, Color( 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

--                        draw.WordBox( 8, pos.x-5, pos.y-5, v.code, "Default", Color( 0, 255, 0, 150 ), Color(255,255,255,255) )

                    else

                        if(v.tempCode && v.tempCode != "") then

                            -- surface.SetDrawColor( Color( 0,0,50, 150 ) )

                            -- surface.SetMaterial( grad )

                            -- surface.DrawTexturedRect( pos.x, pos.y, 50, 15 )

                            draw.SimpleText( v.tempCode, "TargetID", pos.x + 5, pos.y + 6, Color( 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

                        -- else

                            -- surface.SetDrawColor( Color( 0,0,50, 150 ) )

                            -- surface.SetMaterial( grad )

                            -- surface.DrawTexturedRect( pos.x, pos.y, 50, 15 )

                            -- draw.SimpleText( "Unknown", "DermaDefault", pos.x + 5, pos.y + 6, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

                        end
                    end
                end
            end
        end
end
end

hook.Add("HUDPaint", "HUD", Vision)


local elements = {

    { -- Screen

        x = 0.075,

        y = 0.04,

        w = 0.85,

        h = 0.25,



    },

    { -- ABORT

        x = 0.075,

        y = 0.04 + 0.25 + 0.03,

        w = 0.85 / 2 - 0.04 / 2 + 0.05,

        h = 0.125,

        text = "ABORT",

    },

    { -- OK

        x = 0.5 + 0.04 / 2 + 0.05,

        y = 0.04 + 0.25 + 0.03,

        w = 0.85 / 2 - 0.04 / 2 - 0.05,

        h = 0.125,

        text = "OK",

    }

}



do
    for i = 1, 9 do
	
        local column = (i - 1) % 3

        local row = math.floor((i - 1) / 3)

        local element = {

            x = 0.075 + (0.3 * column),

            y = 0.175 + 0.25 + 0.05 + ((0.5 / 3) * row),

            w = 0.25,

            h = 0.13,

            text = tostring(i),

        }

        table.insert(elements, element)

    end

end





function CalculateKeypadCursorPos(ply, ent)

    if !ply:IsValid() then return end

    local tr = util.TraceLine( { start = ply:EyePos(), endpos = ply:EyePos() + ply:GetAimVector() * 65, filter = ply } )

    if !tr.Entity or tr.Entity ~= ent then return 0, 0 end

    local scale = ent.Scale

    if !scale then return 0, 0 end

    local pos, ang = ent:CalculateRenderPos(), ent:CalculateRenderAng()

    if !pos or !ang then return 0, 0 end

    local normal = ent:GetForward()

    local intersection = util.IntersectRayWithPlane(ply:EyePos(), ply:GetAimVector(), pos, normal)

    if !intersection then return 0, 0 end

    local diff = pos - intersection

    local x = diff:Dot( -ang:Forward() ) / scale

    local y = diff:Dot( -ang:Right() ) / scale

    return x, y

end



function KPGetHoveredElement(ply, ent)

    local scale = ent.Scale

    local w, h = ent.Width2D, ent.Height2D

    local x, y = CalculateKeypadCursorPos(ply, ent)

    for _, element in ipairs(elements) do

        local element_x = w * element.x

        local element_y = h * element.y

        local element_w = w * element.w

        local element_h = h * element.h

        if  element_x < x and element_x + element_w > x and

            element_y < y and element_y + element_h > y

        then

            return element

        end

    end

end


function Logic()

local me = LocalPlayer()

if !me:IsValid() then return end

for k, v in pairs(player.GetAll()) do

    local kp = v:GetEyeTrace().Entity

    if IsValid(kp) && IsValid(v) and string.find( kp:GetClass(), "Keypad") and v:EyePos():Distance(kp:GetPos()) <= 120 then

        kp.tempCode = kp.tempCode or ""

        kp.tempText = kp.tempText or ""

        kp.tempStatus = kp.tempStatus or 0

        if kp:GetText() != kp.tempText or kp:GetStatus() != kp.tempStatus then

            kp.tempText = kp:GetText()

            kp.tempStatus = kp:GetStatus()

            if(kp.tempText && !kp:GetSecure()) then

                kp.tempCode = kp.tempText

                timer.Simple(0, function()

                    if kp:GetStatus() == 1 && kp.tempCode && kp.tempCode != "" then

                        kp.code = kp.tempCode

                    end

                end)

            else

                local i = KPGetHoveredElement(v, kp)

                if (i) then i = i.text end

                if kp.tempText then

                    timer.Simple(0, function()

                        if kp:GetStatus() == 1 && kp.tempCode && kp.tempCode != "" then

                            kp.code = kp.tempCode

                        end

                    end)

                end



                if kp.tempText == "" || kp:GetStatus() == 2 then

                    kp.tempCode = ""

                end

                timer.Simple(0, function()

                    if(tonumber(i) && kp:GetText():len() != 0) then

                        kp.tempCode = kp.tempCode..i

                    end

                end)

            end

        end

    end
	end
	end
hook.Add("Think", "logic", Logic)
	

local function GetGays()
	return ents.FindByClass("Keypad")
end

hook.Add( "Think", "Gaypads" , function()
	local gays = GetGays()
	for k,v in pairs(gays) do
		if IsValid(v) then
			if !isbool(v.hacked) then
				v.hacked = false
			end
			if !v.hacked then
				if(v:GetStatus() == 1)then
					if(v:GetText() != "****")then
						v.hacked = true
						v.passi = v:GetText()
					end
				end
			end
		end
	end
end)

hook.Add( "HUDPaint", "Gaypads", function()
	for k,v in pairs(GetGays())do
		if(v.hacked)then
			local pos = ( v:GetPos() ):ToScreen()
			draw.SimpleText(v.passi,"TargetID",pos.x + 25,pos.y + 20,Color(255,0,0),1,1)
		end
	end
end)


concommand.Add("stop_hack_gaypads",function()
	hook.Remove( "Think", "Gaypads" )
	hook.Remove( "HUDPaint", "Gaypads" )
end)
