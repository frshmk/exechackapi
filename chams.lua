local weaponparams = {
    ["$basetexture"] = "sprites/physbeam",
    ["$nodecal"] = 1,
    ["$model"] = 1,
    ["$additive"] = 1,
    ["$nocull"] = 1,
    Proxies = {
        TextureScroll = {
            texturescrollvar = "$basetexturetransform",
            texturescrollrate = 0.4,
            texturescrollangle = 70,
        }
    }
}
 
local armparams = {
    ["$basetexture"] = "models/inventory_items/dreamhack_trophies/dreamhack_star_blur",
    ["$nodecal"] = 1,
    ["$model"] = 1,
    ["$additive"] = 1,
    ["$nocull"] = 1,
    Proxies = {
        TextureScroll = {
            texturescrollvar = "$basetexturetransform",
            texturescrollrate = 0.2,
            texturescrollangle = 50,
        }
    }
}
 
 
local IsDrawingGlow = false
local Glow = CreateMaterial("edgeglow","UnlitGeneric",weaponparams)
local GlowTwo = CreateMaterial("edgeglow2","UnlitGeneric", armparams)
 
hook.Add("PreDrawViewModel", "PreViewModelChams", function()
    render.SuppressEngineLighting(true)
    if IsDrawingGlow then
        render.SetColorModulation(1, 5, 20)
        render.MaterialOverride(Glow)
    else
        render.SetColorModulation(1, 1, 1)
    end
    render.SetBlend(1)
end)
 
hook.Add("PostDrawViewModel", "PostViewModelChams", function()
    render.SetColorModulation(1, 1, 1)
    render.MaterialOverride(None)
    render.SetBlend(1)
    render.SuppressEngineLighting(false)
 
    if IsDrawingGlow then return end
 
    IsDrawingGlow = true
    LocalPlayer():GetViewModel():DrawModel()
    IsDrawingGlow = false
end