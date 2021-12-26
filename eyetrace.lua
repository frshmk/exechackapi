function Penis( )
	cam.Start3D( EyePos(), EyeAngles() )
		for k, pl in pairs( player.GetAll() ) do
			if pl && IsValid( pl ) && pl:Alive() && pl != LocalPlayer() then
				local tr = pl:GetEyeTrace();
				local color = team.GetColor( pl:Team() );
				render.DrawLine( pl:GetShootPos(), tr.HitPos, color, true );
			end
		end
	cam.End3D()
end
hook.Add( "RenderScreenspaceEffects", "Penis", Penis )
