local ragdolls = ents.FindByClass( 'prop_ragdoll' )
		
for i = 1, #ragdolls do
    local ragdoll = ragdolls[ i ]
    
	timer.Create("ramzi_sadboyz",0,0,function()
        for _ = 1, 5 do
            net.Start( 'properties' )
            net.WriteString( 'statue' )
            net.WriteEntity( ragdoll )
            net.SendToServer()
            
            net.Start( 'properties' )
            net.WriteString( 'statue_stop' )
            net.WriteEntity( ragdoll )
            net.SendToServer()
        end
    end)
end