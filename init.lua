vines = {
  name = 'vines',
  ropeLadderLength = 50,
  ropeLength = 50,
}

dofile( minetest.get_modpath( vines.name ) .. "/functions.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/aliases.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/crafts.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/ropeboxes.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/ladder.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/shear.lua" )
dofile( minetest.get_modpath( vines.name ) .. "/vines.lua" )

print("[Vines] Loaded!")
