local DebugWhite = Material("models/debug/debugwhite")
local Wireframe = Material("models/wireframe")
local IsDrawingWireframe = false
 
hook.Add("PreDrawViewModel", "PreViewModelChams", function()
    render.SuppressEngineLighting(true)
    if IsDrawingWireframe then
        render.SetColorModulation(1, 1, 1)
        render.MaterialOverride(Wireframe)
    else
        render.SetColorModulation(1, 1, 1)
        render.MaterialOverride(Wireframe)
    end
    render.SetBlend(1)
end)
 
hook.Add("PostDrawViewModel", "PostViewModelChams", function()
    render.SetColorModulation(1, 1, 1)
    render.MaterialOverride(None)
    render.SetBlend(1)
    render.SuppressEngineLighting(false)
 
    if IsDrawingWireframe then return end
 
    IsDrawingWireframe = true
    LocalPlayer():GetViewModel():DrawModel()
    IsDrawingWireframe = false
end)
