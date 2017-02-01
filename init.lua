ropes = {
  name = 'ropes',
}

local rope_length = minetest.setting_get("ropes_rope_length")
if not rope_length then
	rope_length = 50
end
ropes.ropeLength = rope_length

local rope_ladder_length = minetest.setting_get("ropes_rope_ladder_length")
if not rope_ladder_length then
	rope_ladder_length = 50
end
ropes.ropeLadderLength = rope_ladder_length

dofile( minetest.get_modpath( ropes.name ) .. "/doc.lua" )
dofile( minetest.get_modpath( ropes.name ) .. "/functions.lua" )
dofile( minetest.get_modpath( ropes.name ) .. "/crafts.lua" )
dofile( minetest.get_modpath( ropes.name ) .. "/ropeboxes.lua" )
dofile( minetest.get_modpath( ropes.name ) .. "/ladder.lua" )

print("[Ropes] Loaded!")
