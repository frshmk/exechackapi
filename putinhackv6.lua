local file, Material, Fetch, find = file, Material, http.Fetch, string.find -- Нахуя писать хуйню которую я не собираюсь писать


local errorMat = Material("debug/debugvertexcolor")

local WebImageCache = {}

function http.DownloadMaterial(url, path, callback)

    if WebImageCache[url] then return callback(WebImageCache[url]) end



    local data_path = "data/".. path

    if file.Exists(path, "DATA") then

        WebImageCache[url] = Material(data_path, "smooth")

        callback(WebImageCache[url])

    else

        Fetch(url, function(img)

            if img == nil or find(img, "<!DOCTYPE HTML>", 1, true) then return callback(errorMat) end

            

            file.Write(path, img)

            WebImageCache[url] = Material(data_path, "smooth")

            callback(WebImageCache[url])

        end, function()

            callback(errorMat)

        end)

    end

end



local opacit, color, fovo, boolean, boolean2, doshit = 1, Color(255, 255, 255), 90, false, false, true

local function idinaxuy()

	local eb = vgui.Create("DHTML")

	eb:SetSize(640, 480)

	eb:Center()

	eb:MakePopup() -- Прикол приколом, но эту хуйню надо переписывать а мне лень да и поохуй

	eb:SetHTML([[

		<!DOCTYPE HTML>

	<link href="mainsite.css" rel="stylesheet">

	<head>

	<style type="text/css">

	body{

		overflow: hidden;

	}

	.zalupa {

		position: absolute;

		left: 0px;

		top: 0px;

		width: 100%;

		height: 22px;

		background: #9A16D9;

		box-shadow: inset 0px 4px 5px rgba(0, 0, 0, 0.25);

		border-radius: 90px 90px 0px 0px;

	}

	.pizda {

		position: absolute;

		width: 100%;

		height: 457px;

		left: 0px;

		top: 22px;

		background: url(https://media.discordapp.net/attachments/880058878396620830/880059798727573554/Vladimir-Putin-biografiya.jpg) no-repeat;

		box-shadow: inset 0px 0px 85px 20px #000000;

		background-size: cover;

	}

	.chlen {

		position: absolute;

		width: 100%;

		height: 100%;

		left: 0px;

		top: 0px;

		backdrop-filter: blur(4px);

		background: rgba(0, 0, 0, 0.3);

	}

	.huynya {

		position: absolute;

		width: 256px;

		height: 22px;

		left: 41px;

		top: 0px;

		font-family: "Bauhaus 93";

		font-style: normal;

		font-weight: normal;

		font-size: 18px;

		line-height: 26px;

		display: flex;

		align-items: center;

		text-align: center;

		color: #FFFFFF;

		text-shadow: 1px 1px 8px rgba(0,0,0,0.75);

	}

	.mudak {

		position: absolute;

		width: 22px;

		height: 22px;

		right: 0px;

		top: 0px;

		background: #FF7C7C;

		box-shadow: -4px 4px 8px rgba(0, 0, 0, 0.25);

		border-radius: 0px 90px 0px 0px;

	}

	.mudak:hover {

		background: #FF1C1C;

	}

	.femka {

		position: absolute;

		width: 100%;

		height: 100%;

		left: -2px;

		pointer-events: none;

		top: 2px;

		font-family: "Comic Sans MS";

		font-style: normal;

		font-weight: normal;

		font-size: 12px;

		line-height: 17px;

		vertical-align: central;

		text-align:center;

		color: #FFFFFF;

		text-shadow: 1px 1px 1px rgba(13, 13, 13, 0.49);

	}

	.padonok {

		position: absolute;

		width: 128px;

		height: 210px;

		left: 60px;

		top: 90px;

		background: #201A1A;

		border-radius: 22px;

	}

	.padonok2 {

		position: absolute;

		width: 128px;

		height: 150px;

		left: 456px;

		top: 90px;

		background: #201A1A;

		border-radius: 22px;

	}

	.suchka {

		position: absolute;

		width: 90px;

		height: 30px;

		left: 19px;

		top: 0px;

		font-family: Comic Sans MS;

		font-style: normal;

		font-weight: normal;

		font-size: 14px;

		line-height: 20px;

		display: flex;

		align-items: center;

		text-align: center;

		color: #FFFFFF;

		text-shadow: 1px 2px 1px #9A16D9;

	}

	.govno {

		position: absolute;

		width: 90px;

		height: 100px;

		left: 19px;

		top: 30px;

        background-color: #8A2BE2;

		border-radius: 10px;

	}

	.mocha {

		position: absolute;

		width: 90px;

		height: 22px;

		left: 19px;

		top: 141px;

		background: #FFFFFF;

		border-radius: 10px;

	}

	.ueba {

		position: absolute;

		width: 90px;

		height: 22px;

		left: 19px;

		top: 174px; 

		background: #FFFFFF;

		border-radius: 10px;

	}

    .putingif {
		position: absolute;

		width: 190px;

		height: 189px;

		left: 465px;

		top: 290px;

		background: url(https://media.discordapp.net/attachments/883349877713690675/910219191984980078/image0.gif) no-repeat;
    }

	</style>

	</head>

	<body>

		<div class="zalupa">

			<div class="huynya">Putin Hack V6</div>

			<div class="mudak" onclick="lua.exitebala();">

				<div class="femka">X</div>

			</div>

		</div>

		<div class="pizda">

			<div class="chlen">

				<div class="padonok">

					<div class="suchka">SETTINGS</div>

					<div class="govno"></div>

					<div class="mocha"></div>

					<div class="ueba"></div>

				</div>

				<div class="padonok2">

					<div class="suchka">OTHER</div>


				</div>

			</div>
            <div id="putingifchupapi" class="putingif"></div>

		</div>
	</body>

	]])

	eb:AddFunction("lua", "exitebala", function()

		eb:Remove()

	end) 

	

	local white, violet, black = Color(255, 255, 255), Color(154, 22, 217), Color(0, 0, 0)

	

	

	local ebuchka = vgui.Create("DColorMixer", eb)

	ebuchka:SetPos(79, 142)

	ebuchka:SetSize(90, 100)

	ebuchka:SetPalette(false)

	ebuchka:SetWangs(false)

	ebuchka:SetAlphaBar(false)

	ebuchka:SetColor(color)

	function ebuchka:ValueChanged(clr)

		color = clr

	end

	local pidorka = vgui.Create("DNumberScratch", eb)

	pidorka:SetPos(79, 253)

	pidorka:SetSize(90, 22)

	function pidorka:PaintOver(x,y)

		draw.RoundedBox(8, 0, 0, x, y, white)

		draw.RoundedBox(8, 0, 0, x*self:GetFraction(), y, violet)

		draw.SimpleText("Opacity", "DermaDefault", x/2, y/2, black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	end 

	function pidorka:OnValueChanged(val)

		opacit = val

	end

	pidorka:SetMax(1)

	pidorka:SetMin(0)

	pidorka:SetFraction(opacit)

	local huesos = vgui.Create("DNumberScratch", eb)

	huesos:SetPos(79, 286)

	huesos:SetSize(90, 22)

	function huesos:PaintOver(x,y)

		draw.RoundedBox(8, 0, 0, x, y, white)

		draw.RoundedBox(8, 0, 0, x*self:GetFraction(), y, violet)

		draw.SimpleText("FOV", "DermaDefault", x/2, y/2, black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	end 

	function huesos:OnValueChanged(val)

		fovo = val

	end

	huesos:SetMax(120)

	huesos:SetMin(50)

	huesos:SetValue(fovo)

	local loshok = vgui.Create("DCheckBoxLabel", eb)

	loshok:SetPos(475, 142)

	loshok:SetSize(90, 28)

	loshok:SetChecked(boolean)

	loshok:SetText("Enable HUD")

	function loshok:OnChange(bool)

		boolean = bool

	end

	local loh = vgui.Create("DCheckBoxLabel", eb)

	loh:SetPos(475, 170)

	loh:SetSize(90, 28)

	loh:SetChecked(boolean2)

	loh:SetText("Rainbow Colors")

	function loh:OnChange(bool)

		boolean2 = bool

	end

    local putingif = vgui.Create("DCheckBoxLabel",eb)
    putingif:SetPos(475,198)
    putingif:SetSize(90,28)
    putingif:SetValue(1)
    putingif:SetText("Dancing Putin")
    function putingif:OnChange(bool)
        if bool then
            eb:RunJavascript([[document.getElementById("putingifchupapi").style.display = 'block';]])
        else
            eb:RunJavascript([[document.getElementById("putingifchupapi").style.display = 'none';]])
        end
	end
end



local colormat = CreateMaterial("huylosykablya", "VertexLitGeneric", {

  ["$basetexture"] = "color/white",

  ["$model"] = 1,

  ["$vertexcolor"] = 1

})

hook.Add("PreDrawViewModel", "zaebalonazvaniapridumuvat'", function()
	if doshit then 
		local colo = boolean2 and HSVToColor((RealTime()*8)%360, 1, 1) or color

		render.SetBlend(opacit)

		render.SetColorModulation(colo.r/255, colo.g/255, colo.b/255)

		render.ModelMaterialOverride(colormat)
	end

end)


local tab = {}
hook.Add("CalcView", "ObamaPidora", function(ply, origin, angles, fov, znear, zfar )

	tab.origin = origin -- В аду пусть будут все гореть кто используют pairs для sequenced таблиц, дла таких отдельный котел в аду стоит.

	tab.angles = angles

	tab.fov = fovo

	tab.znear = znear

	tab.zfar = zfar

	return tab 

end)



concommand.Add("_putin", idinaxuy)





local gradient = Material "vgui/gradient-l"



local gradient2 = Material "vgui/gradient-r"



local function drawcirc( x, y, radius, color)



	local seg = 32



	local cir = {}



	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )



	for i = 0, seg do



		local a = math.rad( ( i / seg ) * -360 )



		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )



	end



	local a = math.rad( 0 ) -- This is needed for non absolute segment counts



	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )



	surface.SetDrawColor(color:Unpack())



	surface.DrawPoly( cir )



end



surface.CreateFont("Stratum", {



	font = "Arial",



	size = ScreenScale(8),



})



local black2 = Color(0, 0, 0, 230)



local white2 = Color(255, 255, 255)



local green = Color(70, 155, 45)



local blue = Color(70, 45, 155)



hook.Add("HUDPaint", "Urbacord", function()

	if !boolean then return end

	if !doshit then return end

	local x, y, rad, koren = ScrW()/2, ScrH()*0.93, ScreenScale(20), math.sqrt(2)/2



	render.SetStencilEnable(true)



	render.SetStencilWriteMask( 0xFF )



	render.SetStencilTestMask( 0xFF )



	render.SetStencilReferenceValue( 0 )



	render.SetStencilPassOperation( STENCIL_KEEP )



	render.SetStencilZFailOperation( STENCIL_KEEP )



	render.ClearStencil()



	render.SetStencilEnable( true )



	render.SetStencilReferenceValue( 1 )



	render.SetStencilCompareFunction( STENCIL_NEVER )



	render.SetStencilFailOperation( STENCIL_REPLACE )



	drawcirc(x, y, rad, black2)



	surface.DrawRect(math.floor(x+rad*koren), y-ScreenScale(4), math.floor(ScreenScale(50)+koren), ScreenScale(8), 0, 1, 1, 0)



	surface.DrawRect(math.floor(x-rad*koren)-ScreenScale(50), y-ScreenScale(4), ScreenScale(50)+koren, ScreenScale(8), 0, 1, 1, 0)



	render.SetStencilFailOperation(STENCIL_KEEP)



	render.SetStencilCompareFunction(STENCIL_EQUAL)



	surface.SetDrawColor(black2:Unpack())



	surface.DrawRect(math.floor(x-rad-2), y-rad, 2*rad+4, 2*rad)





	http.DownloadMaterial("https://media.discordapp.net/attachments/811307385594708039/883397843522555914/vladimir-putin-clip-art-49.png", "vladim3ir-putin-11530963758tritv37snc.png", function(mat)

		surface.SetDrawColor(255, 255, 255)

		surface.SetMaterial(mat)

		surface.DrawTexturedRect(math.floor(x-rad*koren), math.floor(y-rad*koren), math.floor(2*rad*koren), math.floor(2*rad*koren))

	end)



	surface.SetMaterial(gradient)



	surface.SetDrawColor(black2:Unpack())



	surface.DrawTexturedRect(x+rad+2, y-ScreenScale(4), ScreenScale(50), ScreenScale(8))



	draw.SimpleText("HP:", "Stratum", x+rad+2+ScreenScale(3), y-ScreenScale(0.5), white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)



	draw.SimpleText(LocalPlayer():Health(), "Stratum", x+rad+2+ScreenScale(15), y-ScreenScale(0.5), green, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)



	surface.SetMaterial(gradient2)



	surface.DrawTexturedRect(math.floor(x-rad-ScreenScale(50)), y-ScreenScale(4), ScreenScale(50)-2, ScreenScale(8))



	draw.SimpleText("ARMOR:", "Stratum", x-rad-2-ScreenScale(16), y-ScreenScale(0.5), white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)



	draw.SimpleText(LocalPlayer():Armor(), "Stratum", x-rad-2-ScreenScale(4), y-ScreenScale(0.5), blue, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)



	render.SetStencilEnable(false)



end)


hitmarkerTable = {}

me = LocalPlayer()

hook.Add("HUDPaint", "DrawTracer",function ()
    for k, v in next, hitmarkerTable do
        local pos = v[1]:ToScreen()

        if(v[2] <= 0) then
            table.remove(hitmarkerTable, k);
            continue;
        end
        v[2] = v[2] - FrameTime()
        surface.SetDrawColor(255, 255,255)
        surface.DrawLine( pos.x - 8, pos.y - 8, pos.x - 2, pos.y - 2 )
        surface.DrawLine( pos.x - 8, pos.y + 8, pos.x - 2, pos.y + 2 )
        surface.DrawLine( pos.x + 8, pos.y - 8, pos.x + 2, pos.y - 2 )
        surface.DrawLine( pos.x + 8, pos.y + 8, pos.x + 2, pos.y + 2 )
    end
end)

hook.Add("PlayerTraceAttack", "BulletTracer", function (ent, dmg, dir, trace)
    if(!IsFirstTimePredicted()) then return; end

    local vHitPos, vSrc;
    vHitPos = trace.HitPos;
    vSrc = trace.StartPos;

    table.insert(hitmarkerTable, {vHitPos, 1})
end)

gameevent.Listen("player_hurt")
hook.Add("player_hurt", "Hitmarker", function (data)
    if(data.attacker != me:UserID()) then return end
    sound.PlayFile("hitmarker.wav", "mono", function()
    end)
end)

local read = file.Read
function file.Read(str, data) -- Анти скринраб (Бадминский.)
	if str:Right(4) == ".jpg" then
		doshit = false
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
		doshit = true
		return capture
	else
		return read(str, data)
	end
end
