local color_green = Color( 0, 255, 0 )

hook.Add( "PreDrawHalos", "AddStaffHalos", function()
	local staff = {}

	for _, ply in ipairs( player.GetAll() ) do
		if ( LocalPlayer():GetPos():Distance(ply:GetPos()) < 1000 ) then
			staff[ #staff + 1 ] = ply
		end
	end

	halo.Add( staff, color_green, 0, 0, 2, true, true )
end )
