vines = {
  name = 'vines',
  recipes = {}
}

local enableVines = true

if enableVines then
	dofile( minetest.get_modpath( vines.name ) .. "/functions.lua" )
end
dofile( minetest.get_modpath( vines.name ) .. "/aliases.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/crafts.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/ropeboxes.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/ladder.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/shear.lua" )
if enableVines then
	dofile( minetest.get_modpath( vines.name ) .. "/vines.lua" )
end

print("[Vines] Loaded!")
