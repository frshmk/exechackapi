local ragdolls = ents.FindByClass( 'prop_ragdoll' )
		
for i = 1, #ragdolls do
    local ragdoll = ragdolls[ i ]
    
    if ragdoll:IsRagdoll() and gamemode.Call( 'CanProperty', LocalPlayer(), 'motioncontrol_ragdoll', ragdoll ) then
        for _ = 1, 1000 do
            net.Start( 'properties' )
            net.WriteString( 'motioncontrol_ragdoll' )
            net.WriteEntity( ragdoll )
            net.SendToServer()
        end
    end
end