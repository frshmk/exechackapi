local function ChildCheck(pan)
	local title = "You have been reported! Please answer all your reports."
	if !pan || !IsValid(pan) then return end
	if pan.GetTitle && pan:GetTitle() == title then
		pan:Remove();
		return
	end
	for k,v in pairs(pan:GetChildren()) do
		if v.GetTitle && v:GetTitle() == title then
			v:Remove();
			return
		end
		if #v:GetChildren() > 0 then
			ChildCheck(v)
		end
	end
end

local function poopy()
	local pan = vgui.GetHoveredPanel()
	ChildCheck(pan)
end

hook.Add("CreateMove", "poopyier", poopy)
