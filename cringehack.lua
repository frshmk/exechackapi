-- Создал это все Govnocoder, уважайте его бля, хоть он и ленивая жопа.
-- Created by GovnoCoder, да бля, я просто поменял ник чела на говно кодер, ну бля вы сами посмотрите на эту пасту, кринж
-- Это спиздил Jlucenok, но ему похуй на ваше мнение (ну кроме зайки SHOTinDOT)
local crtconvar = CreateConVar
local runluastring = ""
local convar = GetConVar
local crtcmd = concommand.Add
local read = file.Read
local print = print
local PrintTable = PrintTable
local GetConVar = GetConVar
local hook_Remove = hook.Remove
local runconsole = RunConsoleCommand
local netStart = net.Start
local funcinfo = jit.util.funcinfo
local VectorPos = Vector(0, 0, 0)
local Angles = Angle(0, 0, 0)
crtconvar("edebugcam", 0, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("ewallhack", 1, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("entnames", "", FCVAR_ARCHIVE, "")
crtconvar("efriends", "", FCVAR_ARCHIVE, "")
crtconvar("ewallhackchams", 1, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("ewallhackbox", 1, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("ewallhackall", 0, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("ewallhackallonlybox", 0, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("eaimspeed", 2, FCVAR_ARCHIVE, "", 0, 10000)
crtconvar("eaim", 1, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("efullbright", 0, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("eaimfov", 15, FCVAR_ARCHIVE, "", 1, 360)
crtconvar("eaimbody", 1, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("eaimselfteam", 0, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("eaimm2", 1, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("emouse", 1, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("ecambind", "", FCVAR_ARCHIVE, "")
crtconvar("emousehardcode", 0, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("eaimstealth", 0, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("ehop", 1, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("epads", 1, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("esayenable", 0, FCVAR_ARCHIVE, "", 0, 1)
crtconvar("esay", "", FCVAR_ARCHIVE, "")
convar("edebugcam"):SetBool(false)
local hook_add = hook.Add
local netstarttab = {}
local function lerpcolor(t, fromcol, tocol)
    local f1 = Lerp(t, fromcol.r, tocol.r)
    local f2 = Lerp(t, fromcol.g, tocol.g)
    local f3 = Lerp(t, fromcol.b, tocol.b)
    return Color(f1, f2, f3)
end
crtcmd("printnetstrings", function()
    PrintTable(netstarttab)
end)
crtcmd("ecam", function()
    hook.Remove("ShouldDrawLocalPlayer", "ThirdPersonDrawPlayer")
    hook_add("ShouldDrawLocalPlayer", "ECAMDRAW", function()
        return convar("edebugcam"):GetBool()
    end)
    convar("edebugcam"):SetBool(!convar("edebugcam"):GetBool())
    VectorPos = LocalPlayer():EyePos()
    Angles = LocalPlayer():EyeAngles()
end)
hook_add("CreateMove", "ecammove", function(cmd)
    local speed = input.IsKeyDown(input.GetKeyCode(input.LookupBinding( "+speed")) ) and 16 or 8
    if convar("edebugcam"):GetBool() then
        if input.IsKeyDown(input.GetKeyCode(input.LookupBinding( "+forward")) ) then
            VectorPos = VectorPos + Angles:Forward() * speed
        end
        if input.IsKeyDown(input.GetKeyCode(input.LookupBinding( "+back")) ) then
            VectorPos = VectorPos - Angles:Forward() * speed
        end
        if input.IsKeyDown(input.GetKeyCode(input.LookupBinding( "+moveleft")) ) then
            VectorPos = VectorPos - Angles:Right() * speed
        end
        if input.IsKeyDown(input.GetKeyCode(input.LookupBinding( "+moveright")) ) then
            VectorPos = VectorPos + Angles:Right() * speed
        end
        Angles = Angles + Angle(cmd:GetMouseY()/12,-cmd:GetMouseX()/12,0)
        runconsole("-forward")
        runconsole("-moveleft")
        runconsole("-back")
        runconsole("-moveright")
    end
end)
hook_add("RenderScene", "edebugcam", function()
    if convar("edebugcam"):GetBool() then
        cam.Start2D()
            render.RenderView({
                origin = VectorPos,
                angles = Angles,
                x = 0,
                y = 0,
                w = ScrW(),
                h = ScrH(),
                fov = 90,
                viewmodelfov = 50,
                drawhud = true,
            })
        cam.End2D()
        return true
    end
    return false
end)
crtcmd("run", function(ply, cmd, tb, str)
    RunString(str, "LuaCmd")
end)
crtcmd("setname", function()
    local convar1 = convar("entnames"):GetString() or ""
    local name =  LocalPlayer():GetEyeTrace().Entity:GetClass()
    if name != "worldspawn" then
        convar("entnames"):SetString(convar1 .. ", " .. LocalPlayer():GetEyeTrace().Entity:GetClass())
    end
end)
local function printeru()
    local tab = ents.FindInSphere(LocalPlayer():EyePos(), 80)
    local tab1 = {}
    for i=1, #tab do
        if tab[i]:GetClass():find("printer") then
            table.insert(tab1, tab[i])
        end
    end
    return tab1
end
crtcmd("spizditdengi",function(_, __, __, strargs) -- Вороство денег с derma-принтеров
    local args = strargs:Split(", ")
    for k, v in pairs(printeru()) do
        local printerstate = args[1]
        local func = v[printerstate]
        if func(v) == false then
            print("О, а он выключен! Включаем!")
            netStart(args[3])
                net.WriteEntity(v)
            net.SendToServer()
        end
        print("Отлично, теперь можно разводить лохов!")
        netStart(args[2])
            net.WriteEntity(v)
        net.SendToServer()
    end
end)
local function getallfellas()
    local tab = {}
    for k, v in pairs(ents.GetAll()) do
        local dist = math.Dist(v:GetPos().x, v:GetPos().y, LocalPlayer():EyePos().x, LocalPlayer():EyePos().y) <= 2048
        if dist and (v:IsPlayer() and v:Alive() and v!= LocalPlayer())  then
            table.insert(tab, v)
        end
    end
    return tab
end
local function getallnadmfellas()
    local tab = {}
    for k, v in pairs(ents.GetAll()) do
        local dist = math.Dist(v:GetPos().x, v:GetPos().y, LocalPlayer():EyePos().x, LocalPlayer():EyePos().y) <= 2048
        if dist and (v:IsPlayer() and v:Alive() and v!= LocalPlayer() and (!v:IsAdmin() or v:GetUserGroup() == "user" or ply:GetUserGroup() == "vip+" or v:GetUserGroup() == "vip" ))  then
            table.insert(tab, v)
        end
    end
    return tab
end
local function getnadms()
    local tab = {}
    for k, v in pairs(player.GetAll()) do
        if !v:IsAdmin() then table.insert(tab, v) end
    end
    return tab
end
local function getadms()
    local tab = {}
    for k, v in pairs(player.GetAll()) do
        if v:IsAdmin() then table.insert(tab, v) end
    end
    return tab
end
local function getalladmfellas()
    local tab = {}
    for k, v in pairs(ents.GetAll()) do
        local dist = math.Dist(v:GetPos().x, v:GetPos().y, LocalPlayer():EyePos().x, LocalPlayer():EyePos().y) <= 2048
        if dist and (v:IsPlayer() and v:Alive() and v!= LocalPlayer() and (v:IsAdmin() or v:GetUserGroup() != "user" and v:GetUserGroup() != "vip" and ply:GetUserGroup() != "vip+" ))  then
            table.insert(tab, v)
        end
    end
    return tab
end
local function min(a, b)
    return math.min(a,b)
end
local function abs(arg)
    return math.abs(arg)
end
local function mode()
    render.SetLightingMode(0)
end
local function tablemin(table, func)
    local max, value = LocalPlayer(), math.huge
    local tab1 = GetConVar("efriends"):GetString():Split(", ")
    for k, v in pairs(table) do
        local ang = GetConVar("eaimbody"):GetBool() and LocalPlayer():EyeAngles() - (( v:GetPos() +Vector(0, 0, 48) ) - LocalPlayer():EyePos()):Angle() or LocalPlayer():EyeAngles() - (v:EyePos() - LocalPlayer():EyePos()):Angle()
        local arg1 = abs(ang[1]) <= GetConVar("eaimfov"):GetInt() or abs ( abs(ang[1]) -360 ) <= GetConVar("eaimfov"):GetInt()
        local arg2 = abs(ang[2]) <= GetConVar("eaimfov"):GetInt() or abs ( abs(ang[2]) -360 ) <= GetConVar("eaimfov"):GetInt()
        if func(v) < value and arg1 and arg2 and v:Alive() and !_G.table.HasValue(tab1, v:Name()) then
            local vc = team.GetColor(v:Team())
            local tr = util.TraceLine({
                start = LocalPlayer():EyePos(),
                endpos = v:EyePos() - Vector(0, 0, 10),
                filter = LocalPlayer(),
                mask = MASK_SHOT,
            })
            local lc = team.GetColor(LocalPlayer():Team())
            if !GetConVar("eaimselfteam"):GetBool() and lc.r == vc.r and lc.g == vc.g and lc.b == vc.b or not(tr.Entity == v) then continue end
            max, value = v, func(v)
        end
    end
    if max == LocalPlayer() then return end
    return max, value
end
local function setangle(ang1, ang2)
    local fps = GetConVar("eaimspeed"):GetInt() * FrameTime()
    return Angle( math.Round(ang1[1]) < math.Round(ang1[2]) and -1 or math.Round(ang1[1]) > math.Round(ang2[1]) and 1 or 0, math.Round(ang1[2]) < math.Round(ang2[2]) and -1 or math.Round(ang1[2]) > math.Round(ang2[2]) and 1 or 0, 0)
end
hook_add("PreRender", "EFU1250LLBR", function()
     render.FogMode( 0 )
    render.SetLightingMode(GetConVar("efullbright"):GetInt())
end)
hook_add("PostRender", "EFUL125LBAR", mode)
hook_add("PreDrawHUD", "EFUL153LBAR", mode)
hook_add("Think", "EKypaad", function()
    if !convar("epads"):GetBool() then return end
    for k,v in pairs(ents.FindByClass("keypad")) do
        if v:GetStatus() == 1 and (isfunction(v.GetDisplayText) and !v:GetDisplayText():find("*") or isfunction(v.GetText) and !v:GetText():find("*") ) and !v.kozel then
            v.kozel = isfunction(v.GetDisplayText) and v:GetDisplayText() or isfunction(v.GetText) and v:GetText()
            print("КeyПаD взл0мaH")
        end
    end
end)
local saycor = coroutine.create(function() -- Я люблю именно вариант с корутинами, нежели чем с Таймерами.
    while true do
        RunConsoleCommand("say", convar("esay"):GetString())
        coroutine.wait(0.25)
    end
end)
hook_add("Think", "Essay",function()
    if convar("esayenable"):GetBool() then
        coroutine.resume(saycor)
    end
end)
hook_add("HUDPaint", "Eky1245paads", function()
    if !convar("epads"):GetBool() then return end
    for k, v in pairs(ents.FindInSphere(LocalPlayer():EyePos(), 4096)) do
        if v.kozel then
            local pos = v:GetPos():ToScreen()
            draw.SimpleText(v.kozel, "DermaDefault", pos.x, pos.y, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleTextOutlined(v.kozel, "DermaDefault", pos.x, pos.y, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 4, Color(0, 0, 0))
        end
    end
end)
hook_add("PrePlayerDraw", "Wa513llHK", function()
    if !convar("ewallhack"):GetBool() or !convar("ewallhackchams"):GetBool() then return end
    render.SetStencilWriteMask( 0xFF )
    render.SetStencilTestMask( 0xFF )
    render.SetStencilReferenceValue( 0 )
    render.SetStencilPassOperation( STENCIL_KEEP )
    render.SetStencilFailOperation( STENCIL_KEEP )
    render.SetStencilZFailOperation( STENCIL_KEEP )
    render.ClearStencil()
    render.SetStencilEnable( true )
    render.SetStencilReferenceValue( 1 )
    render.SetStencilCompareFunction( STENCIL_NOTEQUAL )
    render.SetStencilZFailOperation( STENCIL_REPLACE )
end)
hook_add("PostPlayerDraw", "Wal14523lHK", function(ply)
    if !convar("ewallhack"):GetBool() then return end
    if convar("ewallhackbox"):GetBool() then
        local min, max = ply:GetCollisionBounds()
        local color = lerpcolor(ply:Health() / ply:GetMaxHealth(), Color(255, 0, 0), Color(0, 255, 0) )
        cam.Start3D(convar("edebugcam"):GetBool() and VectorPos or EyePos(), convar("edebugcam"):GetBool() and Angles or EyeAngles(), convar("edebugcam"):GetBool() and 90 or LocalPlayer():GetFOV()+15)
            render.SetColorMaterial()
            render.DepthRange(0, 0)
            render.DrawWireframeBox( ply:GetPos(), ply:GetAngles(), min, max, Color(color.r, color.g, color.b,150), false)
            render.DrawBox(ply:GetPos(), ply:GetAngles(), min, max, Color(color.r, color.g, color.b,50))
            render.DepthRange(0, 1)
        cam.End3D()
    end
    render.SetStencilCompareFunction( STENCIL_EQUAL )
    if convar("ewallhackchams"):GetBool() then
        if ply:IsAdmin() or (ply:GetUserGroup() != "user" and ply:GetUserGroup() != "vip" and ply:GetUserGroup() != "vip+") then
            local playercol = team.GetColor(ply:Team())
            local cos = math.sin(SysTime() * 4) * 100
            render.ClearBuffersObeyStencil(playercol.r + cos, playercol.g + cos, playercol.b + cos, 255, false);
        else
            local playercol = team.GetColor(ply:Team())
            render.ClearBuffersObeyStencil(playercol.r, playercol.g, playercol.b, 255, false);
        end
    end
    render.SetStencilEnable( false )
end)
hook_add("PostDrawTranslucentRenderables", "EWA143LLH", function()
    if convar("entnames"):GetString() != "" then
        for k, v in pairs(convar("entnames"):GetString():Split(", ")) do
            for k1, v1 in pairs(ents.FindByClass(v)) do
                if v1 == Entity(0) then continue end
                render.SetStencilWriteMask( 0xFF )
                render.SetStencilTestMask( 0xFF )
                render.SetStencilReferenceValue( 0 )
                render.SetStencilPassOperation( STENCIL_KEEP )
                render.SetStencilFailOperation( STENCIL_KEEP )
                render.SetStencilZFailOperation( STENCIL_KEEP )
                render.ClearStencil()
                render.SetStencilEnable( true )
                render.SetStencilReferenceValue( 1 )
                render.SetStencilCompareFunction( STENCIL_NOTEQUAL )
                render.SetStencilZFailOperation( STENCIL_REPLACE )
                v1:DrawModel()
                render.SetStencilCompareFunction( STENCIL_EQUAL )
                render.ClearBuffersObeyStencil(255, 255, 255, 255, false);
                render.SetStencilEnable( false )
            end
        end
    end
    if convar("edebugcam"):GetBool() then
        LocalPlayer():DrawModel()
    end
    if convar("ewallhackall"):GetBool() and convar("ewallhack"):GetBool() then
        for k, ply in pairs(player.GetAll()) do
            if convar("ewallhackallonlybox"):GetBool() and ply != LocalPlayer() and ply:Alive() then
                local min, max = ply:GetCollisionBounds()
                local color = lerpcolor(ply:Health() / ply:GetMaxHealth(), Color(255, 0, 0), Color(0, 255, 0) )
                cam.Start3D(convar("edebugcam"):GetBool() and VectorPos or EyePos(), convar("edebugcam"):GetBool() and Angles or EyeAngles(), convar("edebugcam"):GetBool() and 90 or LocalPlayer():GetFOV()+15)
                render.SetColorMaterial()
                render.DrawWireframeBox( ply:GetPos(), ply:GetAngles(), min, max, Color(color.r, color.g, color.b,150), false)
                render.DrawBox(ply:GetPos(), ply:GetAngles(), min, max, Color(color.r, color.g, color.b,50))
                cam.End3D()
            elseif ply != LocalPlayer() and ply:Alive() then
                ply:DrawModel()
            end
        end
    end
end)
local jumping = false
hook_add("Tick", "H124op", function()
    if convar("ehop"):GetBool() then
        if (input.IsKeyDown( KEY_SPACE ) ) and !vgui.CursorVisible() then
            if LocalPlayer():IsOnGround() then
                runconsole("+jump")
                jumping = true
            else
                runconsole("-jump")
                jumping = false
            end
        elseif convar("ehop"):GetBool() and LocalPlayer():IsOnGround() and jumping then
            runconsole("-jump")
            jumping = false
        end
    end
end)
hook_add("CreateMove", "M123OUSE", function()
    if !input.IsMouseDown(MOUSE_LEFT) or vgui.CursorVisible() or !convar("emouse"):GetBool() or !IsValid(LocalPlayer():GetActiveWeapon()) or IsValid(LocalPlayer():GetActiveWeapon()) and istable(LocalPlayer():GetActiveWeapon().Primary) and  LocalPlayer():GetActiveWeapon().Primary.Automatic == true then return end
    if convar("emousehardcode"):GetBool() then
        gui.InternalMousePressed(MOUSE_LEFT)
    else
        runconsole "+attack"
        LocalPlayer():ConCommand "-attack"
    end
end)
function jit.util.funcinfo(func, pos)
    local tab = funcinfo(func, pos)
    if #tab.source < 2 then
        tab.source = "@LuaCmd"
        print("Тебя блять спалить пытаются.")
    end
    return tab
end
function jit.attach()
    return "Хуй соси"
end
function RunConsoleCommand(str, ...)
    if str == "__screenshot_internal" or str == "screenshot" then
        print("Тебя скринграбят, епта!")
    else
        runconsole(str, ...)
    end
end
local antisg = GetRenderTarget("antis23g", 1024, 1024)
function file.Read(str, data) -- Анти скринраб (Бадминский.)
    if str:Right(4) == ".jpg" then
        print(str, "Это скринграб")
        print("Тебя скринрабят, осторозняя!")
        local bool = convar("ewallhack"):GetBool()
        convar("ewallhack"):SetBool(false)
        local target = GetRenderTarget("antisg2", 1024, 1024, true)
        render.PushRenderTarget(target)
            render.Clear(255, 255, 255, 255, false, false)
            cam.Start2D()
                render.RenderView({
                    origin = LocalPlayer():GetPos()+Vector(0, 0, 64),
                    angles = LocalPlayer():GetAngles(),
                    x = 0,
                    y = 0,
                    w = 1024,
                    h = 720,
                    fov = 90,
                    viewmodelfov = 50,
                    drawhud = true,
                })
            cam.End2D()
            local capture = render.Capture({format = "jpg", x = 0, y = 0, w = 1024, h = 720})
        render.PopRenderTarget()
        convar("ewallhack"):SetBool(bool)
        return capture
    else
        return read(str, data)
    end
end
local netStart = net.Start
function net.Start(str) -- Для GTS и ScreenGrab 2.0 (не бадминский)
    netstarttab[str] = true
    if !str:find("GimmeThatScreen") and !str:find("Screengrab") and !str:match("QAC_") then
        netStart(str)
    else
        print("Screen grab wants your screenshot! Aborting")
    end
end
local netReceive = net.Receive
function net.Receive(str, func)
    if !str:find("GimmeThatScreen") and !str:find("Screengrab") then
        netReceive(str, func)
    else
        print("Тебя ресивнуть пытаются. Абортни все!")
    end
end
hook_add("Think", "A23im321", function()
    local mouse = convar("eaimm2"):GetBool() and MOUSE_RIGHT or MOUSE_MIDDLE
    if !convar("eaim"):GetBool() or !input.IsMouseDown(mouse) or table.IsEmpty(getallfellas()) then return end
    local ply = tablemin(player.GetAll(), function(a)
        local ang = LocalPlayer():EyeAngles() - (a:EyePos() - LocalPlayer():EyePos()):Angle()
        return (ang[1] <= 180 and ang[1] or ang[1] - 360) + (ang[2] <= 180 and ang[2] or ang[2] - 360) +  LocalPlayer():EyePos():Distance(a:EyePos()) / 4
    end)
    if ply == nil then return end
    local attachid = ply:LookupAttachment( "eyes" )
    local attach = ply:GetAttachment(attachid)
    if attach then
        head = attach.Pos
    else
        head = ply:EyePos()
    end
    if convar("eaimbody"):GetBool() then head = ply:GetPos() + Vector(0, 0, 48) end
    local newangles = (head - LocalPlayer():EyePos()):Angle()
    LocalPlayer():SetEyeAngles(newangles)
end)
local function CreateFonts()
    surface.CreateFont("EHTitle", {
        font = "Arial",
        size = ScreenScale(18),
        extended = true,
        weight = 500,
    })
    surface.CreateFont("EHText", {
        font = "Arial",
        size = (10/640)*1366,
        extended = true,
        weight = 500,
    })
    surface.CreateFont("EHTextShadowed", {
        font = "Arial",
        size = (10/640)*1366,
        extended = true,
        weight = 500,
        shadow = true,
    })
end
local function CreatePanel(panel, name)
    local name = name or "DScrollPanel"
    local funcpanel = vgui.Create(name, panel)
    funcpanel:Dock(FILL)
    funcpanel:DockMargin(0, ScrH()/15, 0, 0)
    funcpanel:SetVisible(false)
    if name == "DScrollPanel" then
        local bar = funcpanel:GetVBar()
        function bar:Paint(x,y)
            surface.SetDrawColor(25, 25, 25, 255)
            draw.NoTexture()
            surface.DrawRect(0, 0, x, y)
        end
        bar:SetHideButtons(true)
        bar.btnGrip.lerp = 0
        function bar.btnGrip:OnCursorEntered()
            self:SetCursor "hand"
        end
        function bar.btnGrip:OnCursorExited()
            self:SetCursor "arrow"
        end
        function bar.btnGrip:Think()
            if self:IsHovered() then
                self.lerp = math.min(1,self.lerp + FrameTime() * 8)
            else
                self.lerp = math.max(0,self.lerp - FrameTime() * 8)
            end
        end
        function bar.btnGrip:Paint(x,y)
            local color = Color(Lerp(self.lerp, 105, 175), Lerp(self.lerp, 255, 175), Lerp(self.lerp, 0, 255))
            draw.RoundedBox(24, 0, 0, x, y, color)
        end
    end
    return funcpanel
end

CreateFonts()
hook.Add("OnScreenSizeChanged", "EHFonts", function()
    CreateFonts()
end)
local keydown = false
hook_add("Think", "ecambind", function()
    if #convar("ecambind"):GetString() > 0 and input.IsKeyDown(input.GetKeyCode(convar("ecambind"):GetString())) and !keydown and !vgui.CursorVisible() then
        RunConsoleCommand("ecam")
        keydown = true
    elseif #convar("ecambind"):GetString() > 0 and !input.IsKeyDown(input.GetKeyCode(convar("ecambind"):GetString())) and !vgui.CursorVisible() then
        keydown = false
    end
end)
local function Checkbox(name, command, frame, size)
    local enablewh = frame:Add "DPanel"
    enablewh:Dock(TOP)
    enablewh:DockMargin(15, 25, 0, 0)
    enablewh:SetSize(0, size)
    function enablewh:Paint(x,y)
        draw.SimpleText(name, "EHText", x*0.1, y*0.5, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
    enablewh.checkbox = vgui.Create("DPanel", enablewh)
    enablewh.checkbox:Dock(LEFT)
    enablewh.checkbox:SetSize(enablewh:GetTall(), 0)
    enablewh.checkbox.lerp = 0
    enablewh.checkbox.on = convar(command):GetBool()
    enablewh.checkbox.command = command
    function enablewh.checkbox:OnCursorEntered()
        self:SetCursor "hand"
    end
    function enablewh.checkbox:OnCursorExited()
        self:SetCursor "arrow"
    end
    function enablewh.checkbox:GetToggled()
        return enablewh.checkbox.on
    end
    function enablewh.checkbox:SetToggled(bool)
        enablewh.checkbox.on = bool
    end
    function enablewh.checkbox:Think()
        if self:IsHovered() then
            self.lerp = math.min(1,self.lerp + FrameTime() * 8)
        else
            self.lerp = math.max(0,self.lerp - FrameTime() * 8)
        end
    end
    function enablewh.checkbox:Paint(x,y)
        local color = Color(Lerp(self.lerp, 255, 175), Lerp(self.lerp, 255, 175), Lerp(self.lerp, 255, 255))
        draw.RoundedBox(50, 0, 0, x, y, color)
        if self:GetToggled() then
            surface.SetDrawColor(0, 0, 0)
            draw.NoTexture()
            surface.DrawTexturedRectRotated(x*0.5, y*0.5, x*0.8, y*0.08, 45 )
            surface.DrawTexturedRectRotated(x*0.5, y*0.5, x*0.8, y*0.08, -45 )
        end
    end
    function enablewh.checkbox:OnMousePressed()
        convar(self.command):SetBool(!convar(self.command):GetBool())
        self:SetToggled(convar(self.command):GetBool())
    end
    return enablewh
end
local function otkroy_blya_menu()
    local frame = vgui.Create("EditablePanel")
    frame:SetSize(ScrW()/1.5, ScrH()/1.5)
    frame:Center()
    frame.pressed = false
    frame.mousepos = {0,0}
    frame:MakePopup()
    function frame:OnMousePressed()
        local x,y = input.GetCursorPos()
        local x1,y1 = self:ScreenToLocal(x, y)
        if y1 <= ScrH() / 5 then
            self.pressed = true
            self.mousepos = {x1,y1}
        end
    end
    function frame:OnMouseReleased()
        self.pressed = false
    end
    function frame:SetActivePanel(panel)
        frame.activepanel:SetVisible(false)
        frame.activepanel = panel
        frame.activepanel:SetVisible(true)
    end
    function frame:Think()
        if self.pressed then
            local x,y = input.GetCursorPos()
            self:SetPos(x-self.mousepos[1], y-self.mousepos[2])
        end
    end
    function frame:Paint(x,y)
        draw.RoundedBoxEx(60, 0, 0, x, y*0.1, Color(25,25,25), false, true)
        surface.SetDrawColor(25, 25, 25)
        draw.NoTexture()
        surface.DrawRect(0, y*0.1, x, y*0.9)
        draw.SimpleText("Cringe Hack", "EHTitle", x*0.015, y*0.005)
    end
    frame.btnclose = vgui.Create("DPanel", frame)
    frame.btnclose:SetSize(ScrW()/22, ScrH()/15)
    frame.btnclose:AlignRight(ScrW()*0.008)
    frame.btnclose.lerp = 0
    function frame.btnclose:OnCursorEntered()
        self:SetCursor "hand"
    end
    function frame.btnclose:OnCursorExited()
        self:SetCursor "arrow"
    end
    function frame.btnclose:OnMousePressed()
        frame:Remove()
    end
    function frame.btnclose:Think()
        if self:IsHovered() then
            self.lerp = math.min(1,self.lerp + FrameTime() * 8)
        else
            self.lerp = math.max(0,self.lerp - FrameTime() * 8)
        end
    end
    function frame.btnclose:Paint(x,y)
        local color = Color(Lerp(self.lerp, 105, 255), Lerp(self.lerp, 255, 175), Lerp(self.lerp, 0, 175))
        draw.RoundedBox(8, 0, 0, x, y, color)
        surface.SetDrawColor(0, 0, 0)
        draw.NoTexture()
        surface.DrawTexturedRectRotated(x*0.5, y*0.5, x*0.8, y*0.08, 45 )
        surface.DrawTexturedRectRotated(x*0.5, y*0.5, x*0.8, y*0.08, -45 )
    end
    frame.leftmenu = vgui.Create("DScrollPanel", frame)
    frame.leftmenu:Dock(LEFT)
    frame.leftmenu:DockMargin(0, ScrH()/15, 0, 0)
    frame.leftmenu:SetSize(ScrW()/10, 0) -- Высота не имеет значенияю
    frame.leftmenu:SetPadding(15)
    local bar = frame.leftmenu:GetVBar()
    function bar:Paint(x,y)
        surface.SetDrawColor(125, 225, 125, 255)
        draw.NoTexture()
        surface.DrawRect(0, 0, x, y)
    end
    bar:SetHideButtons(true)
    bar.btnGrip.lerp = 0
    function bar.btnGrip:OnCursorEntered()
        self:SetCursor "hand"
    end
    function bar.btnGrip:OnCursorExited()
        self:SetCursor "arrow"
    end
    function bar.btnGrip:Think()
        if self:IsHovered() then
            self.lerp = math.min(1,self.lerp + FrameTime() * 8)
        else
            self.lerp = math.max(0,self.lerp - FrameTime() * 8)
        end
    end
    function bar.btnGrip:Paint(x,y)
        local color = Color(Lerp(self.lerp, 105, 175), Lerp(self.lerp, 255, 175), Lerp(self.lerp, 0, 255))
        draw.RoundedBox(24, 0, 0, x, y, color)
    end
    -- Панельки к кнопкам
    -- START меню
    frame.startpanel = CreatePanel(frame, "DPanel")
    frame.startpanel:SetVisible(true)
    frame.startpanel.text = vgui.Create("DLabel", frame.startpanel)
    frame.startpanel.text:Dock(FILL)
    frame.startpanel.text:SetFont("EHText")
    frame.startpanel.text:SetColor(Color(0,0,0))
    frame.startpanel.text:SetContentAlignment(5)
    frame.startpanel.text:SetText("This is a starting page\nSelect some categories in left menu to toggle EHack's options.\nThis cheat was created by GovnoCoder, respect him.\nLink:https://exechack.cc ")
    frame.activepanel = frame.startpanel -- Ставим на начало активку как стартовую менюшку
    function frame.startpanel:Paint(x,y)
        draw.RoundedBox(8, 0, 0, x, y, Color(255,255, 255))
    end
    --- WH меню
    frame.whpanel = CreatePanel(frame)
    function frame.whpanel:Paint(x,y)
        draw.RoundedBox(8, 0, 0, x, y, Color(0,0,0))
    end
    Checkbox("Enable WallHack", "ewallhack", frame.whpanel, 50)
    Checkbox("Enable boxes", "ewallhackbox", frame.whpanel, 50)
    Checkbox("Enable chams", "ewallhackchams", frame.whpanel, 50)
    Checkbox("WallHack all players", "ewallhackall", frame.whpanel, 50)
    Checkbox("Draw only boxes", "ewallhackallonlybox", frame.whpanel, 50)
    -- Aim меню
    frame.aimpanel = CreatePanel(frame)
    function frame.aimpanel:Paint(x,y)
        draw.RoundedBox(8, 0, 0, x, y, Color(0,0,0))
    end
    Checkbox("Enable Aim", "eaim", frame.aimpanel, 50)
    Checkbox("Aim to bodies", "eaimbody", frame.aimpanel, 50)
    Checkbox("Aim by right mouse button", "eaimm2", frame.aimpanel, 50)
    Checkbox("Aim teammates (same job color)", "eaimselfteam", frame.aimpanel, 50)
    -- Кнопки
    frame.otherpanel = CreatePanel(frame)
    function frame.otherpanel:Paint(x,y)
        draw.RoundedBox(8, 0, 0, x, y, Color(0,0,0))
    end
    Checkbox("Enable BHOP", "ehop", frame.otherpanel, 50)
    Checkbox("Enable Fullbright", "efullbright", frame.otherpanel, 50)
    Checkbox("Enable attack spam", "emouse", frame.otherpanel, 50)
    Checkbox("Enable keypad hacking", "epads", frame.otherpanel, 50)
    Checkbox("Enable chat spam", "esayenable", frame.otherpanel, 50)
    local bind = frame.otherpanel:Add("DPanel")
    bind:Dock(TOP)
    bind:DockMargin(15, 25, 15, 0)
    bind:SetSize(25, 50)
    function bind:Paint(x, y)
        draw.SimpleText("Free Cam bind", "EHText", x*0.1, y*0.5, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
    bind.binder = vgui.Create("DBinder", bind)
    bind.binder:Dock(RIGHT)
    bind.binder:DockMargin(0, 0, ScrW()/9, 0)
    bind.binder:SetSize(150, 0)
    bind.binder.lerp = 0
    bind.binder:SetValue(input.GetKeyCode(convar("ecambind"):GetString()) )
    function bind.binder:Paint(x,y)
        if self:IsHovered() then
            self.lerp = math.min(1,self.lerp + FrameTime() * 8)
        else
            self.lerp = math.max(0,self.lerp - FrameTime() * 8)
        end
        local color = Color(Lerp(self.lerp, 105, 175), Lerp(self.lerp, 255, 175), Lerp(self.lerp, 0, 255))
        draw.RoundedBox(24, 0, 0, x, y, color)
    end
    function bind.binder:OnChange(txt)
        convar("ecambind"):SetString(input.GetKeyName(txt))
    end
    local saytext = frame.otherpanel:Add("DLabel")
    saytext:Dock(TOP)
    saytext:DockMargin(15, 25, 15, 0)
    saytext:SetSize(0, 50)
    saytext:SetFont("EHText")
    saytext:SetWrap(true)
    saytext:SetAutoStretchVertical(true)
    saytext:SetText("Type here text which you want to spam with.")
    local esay = frame.otherpanel:Add("DTextEntry")
    esay:Dock(TOP)
    esay:SetValue(convar("esay"):GetString())
    esay:DockMargin(15, 25, 15, 0)
    esay:SetFont("EHText")
    function esay:OnEnter(txt)
        convar("esay"):SetString(self:GetValue())
    end
    local entnamestext = frame.otherpanel:Add("DLabel")
    entnamestext:Dock(TOP)
    entnamestext:DockMargin(15, 25, 15, 0)
    entnamestext:SetSize(0, 50)
    entnamestext:SetFont("EHText")
    entnamestext:SetWrap(true)
    entnamestext:SetAutoStretchVertical(true)
    entnamestext:SetText("Type here entity's class name. If you want to wallhack them, you can use * for a filter. You can split entities via ','")
    local entnames = frame.otherpanel:Add("DTextEntry")
    entnames:SetValue(convar("entnames"):GetString())
    entnames:Dock(TOP)
    entnames:DockMargin(15, 25, 15, 0)
    entnames:SetFont("EHText")
    function entnames:OnEnter(text)
        convar("entnames"):SetString(self:GetValue())
    end
    local efriendstext = frame.otherpanel:Add("DLabel")
    efriendstext:Dock(TOP)
    efriendstext:DockMargin(15, 25, 15, 0)
    efriendstext:SetSize(0, 50)
    efriendstext:SetFont("EHText")
    efriendstext:SetWrap(true)
    efriendstext:SetAutoStretchVertical(true)
    efriendstext:SetText("Type here your friends name. You can split players via ,")
    local efriends = frame.otherpanel:Add("DTextEntry")
    efriends:Dock(TOP)
    efriends:SetValue(convar("efriends"):GetString())
    efriends:DockMargin(15, 25, 15, 0)
    efriends:SetFont("EHText")
    function efriends:OnEnter(text)
        convar("efriends"):SetString(self:GetValue())
    end
    frame.runpanel = CreatePanel(frame, "DPanel")
    function frame.runpanel:Paint(x,y)
        surface.SetDrawColor(55, 55, 55)
        surface.DrawRect(0, 0, x, y)
    end
    local runbutton = frame.runpanel:Add("DPanel")
    local runlua = frame.runpanel:Add("DTextEntry")
    runbutton:Dock(TOP)
    runbutton:SetSize(0, 25)
    runbutton.lerp = 0
    function runbutton:OnCursorEntered()
        self:SetCursor "hand"
    end
    function runbutton:OnCursorExited()
        self:SetCursor "arrow"
    end
    function runbutton:Think()
        if self:IsHovered() then
            self.lerp = math.min(1,self.lerp + FrameTime() * 8)
        else
            self.lerp = math.max(0,self.lerp - FrameTime() * 8)
        end
    end
    function runbutton:Paint(x,y)
        local color = Color(Lerp(self.lerp, 105, 175), Lerp(self.lerp, 255, 175), Lerp(self.lerp, 0, 255))
        draw.RoundedBox(24, 0, 0, x, y, color)
        draw.SimpleText("RunLua", "EHTextShadowed", x*0.5, y*0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    function runbutton:OnMousePressed()
        RunString(runlua:GetValue(), "LuaCmd")
    end
    function runlua:OnChange()
        runluastring = self:GetValue()
    end
    runlua:SetValue(runluastring)
    runlua:Dock(FILL)
    runlua:SetTabbingDisabled(true)
    runlua:SetPaintBackgroundEnabled(false)
    runlua:SetTextColor(Color(255, 255, 255))
    runlua:SetMultiline(true)
    function runlua:Paint(x,y)
        draw.RoundedBox(8, 0, 0, x, y, Color(25, 25, 25))
        self:DrawTextEntryText(Color(255, 255, 255), Color(175, 175, 255), Color(155, 155, 155))
    end
    -- Кнопочки
    local buttons = {
        {name = "Start info", panel = frame.startpanel},
        {name = "WallHack", panel = frame.whpanel},
        {name = "Aim", panel = frame.aimpanel},
        {name = "Other", panel = frame.otherpanel},
        {name = "RunLua", panel = frame.runpanel},
    }
    for k, v in pairs(buttons) do
        local button = frame.leftmenu:Add("DPanel")
        button:Dock(TOP)
        button:SetSize(0, 75)
        button:DockMargin(3, 5, 3, 5)
        button.lerp = 0
        function button:OnCursorEntered()
            self:SetCursor "hand"
        end
        function button:OnCursorExited()
            self:SetCursor "arrow"
        end
        function button:Think()
            if self:IsHovered() then
                self.lerp = math.min(1,self.lerp + FrameTime() * 8)
            else
                self.lerp = math.max(0,self.lerp - FrameTime() * 8)
            end
        end
        function button:Paint(x,y)
            local color = Color(Lerp(self.lerp, 105, 175), Lerp(self.lerp, 255, 175), Lerp(self.lerp, 0, 255))
            draw.RoundedBox(24, 0, 0, x, y, color)
            draw.SimpleText(v.name, "EHTextShadowed", x*0.5, y*0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        function button:OnMousePressed()
            frame:SetActivePanel(v.panel)
        end
    end
end
crtcmd("cringemenu",otkroy_blya_menu )