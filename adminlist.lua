local h_add = hook.Add
local prs = pairs
local plrTable = player.GetAll
local h_remove = hook.Remove
local clr = Color
local isval = IsValid
local tostr = tostring
local s_createFont = surface.CreateFont
local s_drawRect = surface.DrawTexturedRect
local s_setColor = surface.SetDrawColor
local s_getTextSize = surface.GetTextSize
local s_setFont = surface.SetFont
local vgui_create = vgui.Create
local m_rand = math.Rand
local t_create = timer.Create
local t_remove = timer.Remove
local t_exists = timer.Exists
local scrw, scrh = ScrW(), ScrH()

local cfglist = {}

--------------------------------------------------------------------------

cfglist.refreshDelay = 1
cfglist.interval = 1
cfglist.fontSize = 16
cfglist.fontName = "Arial"
cfglist.outlined = true
cfglist.colorBG = clr(29, 29, 29, 255)
cfglist.colorPoloskaSverhu = clr(39, 39, 39, 255)
cfglist.roflanListName = 'Пидоры в сети: '

--------------------------------------------------------------------------

s_createFont("listMainFont", {
	
	font = cfglist.fontName,
	extended = true,
	size = cfglist.fontSize,
	weight = 500,
	outline = cfglist.outlined

})

local function drawEbaniiKvadrat(x, y, w, h, c)

	s_setColor(c.r, c.g, c.b, c.a)
	s_drawRect(x, y, w, h)

end

local function getEbaniiRazmerStrokiSuka(txt)

	s_setFont('listMainFont')
	local a, b = s_getTextSize(txt)

	return a, b

end

local h_name = tostr(m_rand(10000000, 99999999))
local t_name = tostr(m_rand(10000000, 99999999))

local labelsList = {}

local function openAdminList()

	if isval(listFrame) then listFrame:Close() t_remove(t_name) return end

	listFrame = vgui_create("DFrame")
	listFrame:SetPos(scrw * 0.5, scrh * 0.5)
	listFrame:SetSize(300, 200)
	listFrame:SetTitle(cfglist.roflanListName)
	listFrame:SetDraggable(true)
	listFrame:SetSizable(true)
	listFrame:ShowCloseButton(false)

	listFrame.lblTitle:SetFont("listMainFont")
	listFrame.lblTitle.kostil = true

	function listFrame:Paint(w, h)

		drawEbaniiKvadrat(0, 0, w, h, cfglist.colorBG)
		drawEbaniiKvadrat(0, 0, w, listFrame.lblTitle:GetTall(), cfglist.colorPoloskaSverhu)

	end

	t_create(t_name, cfglist.refreshDelay, 0, function()

		if not isval(listFrame) then t_remove(t_name) return end 
			
		for k,v in prs(labelsList) do
					
			v:Remove()

			if labelsList ~= {} then 

				labelsList = {}

			end

		end

		for k,v in prs(plrTable()) do

			if v:GetUserGroup() ~= "user" then 

				local adminList = vgui_create("DLabel", listFrame)
				
				local txtToAdd = v:Nick() .. " (" .. v:GetUserGroup() .. ')'
				
				local txtToAddW, txtToAddH = getEbaniiRazmerStrokiSuka(txtToAdd)
				
				adminList:SetSize(txtToAddW, cfglist.interval + listFrame.lblTitle:GetTall())
				adminList:SetFont("listMainFont")
				adminList:SetText(txtToAdd)
				adminList:SetPos(3, (cfglist.interval + listFrame.lblTitle:GetTall()) * k)

				labelsList[#labelsList + 1] = adminList

			end

		end

	end)

end

openAdminList()
