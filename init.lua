vines = {
  name = 'vines',
}

local rope_length = minetest.setting_get("vines_rope_length")
if not rope_length then
	rope_length = 50
end
vines.ropeLength = rope_length

local rope_ladder_length = minetest.setting_get("vines_rope_ladder_length")
if not rope_ladder_length then
	rope_ladder_length = 50
end
vines.ropeLadderLength = rope_ladder_length

dofile( minetest.get_modpath( vines.name ) .. "/functions.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/aliases.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/crafts.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/ropeboxes.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/ladder.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/shear.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/vines.lua" )

print("[Vines] Loaded!")
