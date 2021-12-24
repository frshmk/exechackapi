if not ec==nil then return end
ec=true
local a,b,c,d={},LocalPlayer(),math.Round
surface.CreateFont("A",{font="Arial",size=20,weight=1000,shadow=false,outline=false})
surface.CreateFont("B",{font="Amb",size=18})
a.menu,a.set,a.pos=false,false,{a=nil,v=nil,u=""}
a.setpos=function()
    local e=b:GetForward()
    local f=e:Angle()
    local g=b:EyePos()+e*300+Vector(0,0,200)
    local h=Angle(0,f.y-90,f.r+90)
    a.pos={v={x=c(g.x),y=c(g.y),z=c(g.z)},a={x=c(h.x),y=c(h.y),z=c(h.z)},b=b:UserID()}
end
local i=vgui.Create("DFrame")
i:SetPos(0,0)
i:SetTitle("")
i:SetSize(1920,1080)
i:SetPaintedManually(true)
i:ShowCloseButton(false)
i.Paint=function()end
sscren=vgui.Create("HTML",i)
sscren:SetPos(0,0)
sscren:SetSize(1920,1080)
sscren:SetPaintedManually(true)
hook.Add("PostDrawTranslucentRenderables","exectd",function()
    local j=a.pos
    if not j.v then return end
    local k,l=Vector(j.v.x,j.v.y,j.v.z),Angle(j.a.x,j.a.y,j.a.z)
    cam.Start3D2D(k,l,0.2)
        surface.SetDrawColor(30,30,30)
        surface.DrawRect(0,0,1920,1080)
        surface.SetDrawColor(10,10,10)
        surface.DrawRect(0,1080,1920,70)
        i:PaintManual()
    cam.End3D2D()
    if Player(j.b):IsValid()then
        cam.Start3D2D(k,l,0.5)
            draw.SimpleText("[CLIENTCINEMA] Owner: "..Player(j.b):Name(),"A",5,435,Color(255,255,255))
        cam.End3D2D()
    end
end)
local function m()
    local n=vgui.Create("DFrame")
    n:SetSize(1100,660)
    n:Center()
    n:SetTitle("")
    n:ShowCloseButton(false)
    n:SetRenderInScreenshots(false)
    n:MakePopup()
    n.Paint=function(self,o,p)
        local q=Material("pp/blurscreen")
        local r,s=self:LocalToScreen(0,0)
        local t,d=ScrW(),ScrH()
        surface.SetDrawColor(255,255,255)
        surface.SetMaterial(q)
        for o=1,3 do
            q:SetFloat("$blur",o/3*(5 or 6))
            q:Recompute()
            render.UpdateScreenEffectTexture()
            surface.DrawTexturedRect(r*-1,s*-1,t,d)
        end
        draw.RoundedBox(4,0,0,o,p,Color(49,100,255,170))
        draw.SimpleText("Client Cinema","B",5,3,Color(255,255,255,200),0,0)
        surface.SetDrawColor(Color(0,0,0,255))
        surface.DrawOutlinedRect(0,0,o,p)
        surface.DrawOutlinedRect(0,25,o,p)
        surface.SetDrawColor(Color(0,0,0,255))
        surface.DrawOutlinedRect(0,25,170,810)
    end
    local u=vgui.Create("DButton",n)
    u:SetTextColor(Color(150,150,150))
    u:SetText("X")
    u:SetFont("A")
    u:SetPos(1100-51,1)
    u:SetSize(50,24)
    u.DoClick=function()
        n:SizeTo(0,0,.2,0,.2)
        timer.Simple(0.3,function()
            n:SetVisible(false)
        end)
    end
    u.Paint=function(n,v,w)
        surface.SetDrawColor(Color(0,0,0,255))
        surface.DrawOutlinedRect(0,0,u:GetSize())
        draw.RoundedBox(0,0,0,v,w,Color(139,0,0,255))
    end
    u.OnCursorEntered=function(self)
        surface.PlaySound("garrysmod/ui_hover.wav")
        u.Paint=function(n,v,w)
            draw.RoundedBox(0,0,0,v,w,Color(220,20,60,255))
        end
        u.OnCursorExited=function(self)
            u.Paint=function(x,v,w)
                draw.RoundedBox(0,0,0,v,w,Color(139,0,0,255))
            end
        end
    end
    local f=30
    local function y(z,A)
        local B=vgui.Create("DButton",n)
        B:SetPos(5,f)
        B:SetSize(160,30)
        B:SetText(z)
        B:SetFont('A')
        B:SetTextColor(Color(255,255,255))
        B.DoClick=A
        B.OnCursorEntered=function(self)
            surface.PlaySound("garrysmod/ui_hover.wav")
        end
        B.Paint=function(C,o,p)
            draw.RoundedBox(0,0,0,500,500,Color(0,0,0,120))
            surface.SetDrawColor(Color(0,0,0))
            surface.DrawOutlinedRect(0,0,o,p)
        end
        f=f+35
    end
    if a.set or a.pos.b and a.pos.b==b:UserID()then
        local D=vgui.Create("HTML",n)
        D:SetPos(175,30)
        D:SetSize(920,623)
        D:OpenURL("https://www.youtube.com/")
        D.ConsoleMessage=function(C,C,f)
            if f:find("youtube.com/watch")then
                a.url=f:Replace("https://www.youtube.com/watch?v=","")
            end
        end
        y("Run Video",function()
            if a.url then
                D:Remove()
                a.pos.u=a.url
                b:ConCommand("say ,.z "..util.TableToJSON(a.pos))
                d:Close()
                d=nil
                a.set=false
                a.url=nil
            end
        end)
        y("Stop for all",function()
            a.pos.u=""
            b:ConCommand("say ,.z "..util.TableToJSON(a.pos))
        end)
        y("Cancel",function()
            a.set=false
            d:Close()
            d=nil
        end)
    else
        y("Setup Screen",function()
            a.set=true
            d:Close()
            d=nil
        end)
    end
    return n
end
hook.Add("Think","exectd",function()
    if a.set then a.setpos()end
    if input.IsKeyDown(KEY_HOME)and not a.menu then
        a.menu=true
        if d then d:Close()d=nil else d=m()end
        timer.Simple(0.3,function()
            a.menu=false
        end)
    end
end)
local e=chat.AddText
chat.AddText=function(...)
    for f,E in next,{...}do
        if isstring(E)and E:find(",.z ")then
            local F=util.JSONToTable(string.Explode(",.z ",E)[2]or"[]")
            a.pos=F
            sscren:OpenURL("https://www.youtube.com/embed/"..F.u.."?autoplay=1")
        end
    end
    return e(...)
end
