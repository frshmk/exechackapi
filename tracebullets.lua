local time = 10
local width = 3

local ENTITY = FindMetaTable("Entity")
local _GetPos = ENTITY.GetPos
local CurTime = CurTime
local table_insert = table.insert
local table_remove = table.remove
local cam_Start3D, cam_End3D = cam.Start3D, cam.End3D
local render_SetMaterial = render.SetMaterial
local render_DrawBeam = render.DrawBeam
local ipairs = ipairs
local IsValid = IsValid
local Player = Player
local traces = {}
local optimize_tbl = {}
local LocalPlayer = LocalPlayer()
local offset = Vector(0, 0, 50)
local color_white = Color(255, 255, 255)

gameevent.Listen("player_hurt")
hook.Add("player_hurt", "gjkghjkhjk", function(tbl)
    local target = Player(tbl.userid or 0)
    if target ~= LocalPlayer then return end

    local attacker = Player(tbl.attacker or 0)
    if not IsValid(attacker) then return end
    
    if optimize_tbl[attacker] then
        table_remove(traces, optimize_tbl[attacker])
    end
    
    local trace = {}
    trace.time = CurTime() + time
    trace.startpos = _GetPos(attacker) + offset
    trace.endpos = _GetPos(target) + offset
    trace.attacker = attacker
        
    optimize_tbl[attacker] = table_insert(traces, trace)
end)

--[[
    sprites/purplelaser1
    sprites/orangelight1_gmod
    sprites/laserbeam
    sprites/bluelaser1
]]

local mat = Material("sprites/orangelight1_gmod")

hook.Add("PreDrawEffects", "f546yyghdf76r7dy", function()
    for i = #traces, 1, -1 do
        local trace = traces[i]
        
        if trace.time < CurTime() then
            table_remove(traces, i)
            optimize_tbl[trace.attacker] = nil
            continue
        end
        
        local startpos = trace.startpos
        local endpos = trace.endpos
        
        cam_Start3D()
            render_SetMaterial(mat)
            render_DrawBeam(startpos, endpos, width, 1, 1, color_white)
        cam_End3D()
    end
end)
