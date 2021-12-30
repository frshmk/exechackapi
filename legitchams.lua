local mat = Material("models/debug/debugwhite")
local SetStencilCompareFunction = render.SetStencilCompareFunction
local SetStencilEnable = render.SetStencilEnable
local SetStencilReferenceValue = render.SetStencilReferenceValue
local SetStencilFailOperation = render.SetStencilFailOperation
local SetStencilPassOperation = render.SetStencilPassOperation
local SetStencilWriteMask = render.SetStencilWriteMask
local SetStencilTestMask = render.SetStencilTestMask
local SetStencilZFailOperation = render.SetStencilZFailOperation
local ClearBuffersObeyStencil = render.ClearBuffersObeyStencil
local ClearStencil = render.ClearStencil
local SetDrawColor = surface.SetDrawColor
 
local color_yellow = Color(255, 200, 20)
local color_black = Color(0,0,0,0) or color_black
 
local chamColour = Color(255, 255, 0)
 
hook.Add("PostDrawOpaqueRenderables", "x", function()
 

        SetStencilWriteMask(0xFF)
        SetStencilTestMask(0xFF)
        SetStencilPassOperation(STENCIL_KEEP)
        SetStencilZFailOperation(STENCIL_KEEP)
        surface.SetDrawColor(color_white)
        SetStencilEnable(true)
        SetStencilReferenceValue(1)
        SetStencilCompareFunction(STENCIL_KEEP)
        SetStencilFailOperation(STENCIL_REPLACE)
        surface.DrawRect(0, 0, ScrW(), ScrH())
        SetStencilCompareFunction(STENCIL_EQUAL)
 
        cam.Start3D()
            ClearStencil()
            SetStencilEnable(true)
            SetStencilPassOperation( STENCIL_REPLACE )
            SetStencilReferenceValue( 1 )
            SetStencilCompareFunction( STENCIL_ALWAYS )
        
            for _, ent in ipairs(player.GetAll()) do
                if not ent:Alive() then goto skipdrawing end
                ent:DrawModel() 
                ::skipdrawing::
            end
            
            SetStencilCompareFunction( STENCIL_EQUAL )
 
            ClearBuffersObeyStencil( chamColour.r,chamColour.g,chamColour.b, 255, false )
            SetStencilEnable( false )
 
        cam.End3D()

 
    
    SetStencilEnable(false)
end)
