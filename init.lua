ropes = {
  name = 'ropes',
}

-- internationalization boilerplate
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

ropes.ropeLength = tonumber(minetest.setting_get("ropes_rope_length"))
if not ropes.ropeLength then
	ropes.ropeLength = 50
end

ropes.ropeLadderLength = tonumber(minetest.setting_get("ropes_rope_ladder_length"))
if not ropes.ropeLadderLength then
	ropes.ropeLadderLength = 50
end

ropes.woodRopeBoxMaxMultiple = tonumber(minetest.setting_get("ropes_wood_rope_box_max_multiple"))
if not ropes.woodRopeBoxMaxMultiple then
	ropes.woodRopeBoxMaxMultiple = 2
end

ropes.copperRopeBoxMaxMultiple = tonumber(minetest.setting_get("ropes_copper_rope_box_max_multiple"))
if not ropes.copperRopeBoxMaxMultiple then
	ropes.copperRopeBoxMaxMultiple = 5
end

ropes.steelRopeBoxMaxMultiple = tonumber(minetest.setting_get("ropes_steel_rope_box_max_multiple"))
if not ropes.steelRopeBoxMaxMultiple then
	ropes.steelRopeBoxMaxMultiple = 9
end

ropes.create_all_definitions = minetest.setting_getbool("ropes_create_all_definitions")


dofile( minetest.get_modpath( ropes.name ) .. "/doc.lua" )
dofile( minetest.get_modpath( ropes.name ) .. "/functions.lua" )
dofile( minetest.get_modpath( ropes.name ) .. "/crafts.lua" )
dofile( minetest.get_modpath( ropes.name ) .. "/ropeboxes.lua" )
dofile( minetest.get_modpath( ropes.name ) .. "/ladder.lua" )

local upgrade_counter = 1
-- For players who used to use the combined vine/rope mod fork I split this out of
local swapper = function(old_node, new_node, upgrade_name)
	minetest.register_lbm({
		name = "ropes:" .. upgrade_name .. "_" .. tostring(upgrade_counter),
		nodenames = {old_node},
		action = function(pos, node)
			minetest.swap_node(pos, {name=new_node, param2=node.param2})
		end
	})
	upgrade_counter = upgrade_counter + 1
end
for i=1,5 do
	swapper(string.format("vines:%irope_block", i), string.format("ropes:%irope_block", i), "vines_to_ropes_upgrade")
end
swapper("vines:rope", "ropes:rope", "vines_to_ropes_upgrade")
swapper("vines:rope_bottom", "ropes:rope_bottom", "vines_to_ropes_upgrade")
swapper("vines:rope_end", "ropes:rope_bottom", "vines_to_ropes_upgrade")
swapper("vines:rope_top", "ropes:rope_top", "vines_to_ropes_upgrade")
swapper("vines:ropeladder_top", "ropes:ropeladder_top", "vines_to_ropes_upgrade")
swapper("vines:ropeladder", "ropes:ropeladder", "vines_to_ropes_upgrade")
swapper("vines:ropeladder_bottom", "ropes:ropeladder_bottom", "vines_to_ropes_upgrade")
swapper("vines:ropeladder_falling", "ropes:ropeladder_falling", "vines_to_ropes_upgrade")
swapper("vines:rope_block", "ropes:5rope_block", "vines_to_ropes_upgrade") -- for the original vines mod

for i=1,9 do
	swapper(string.format("ropes:%irope_block", i), string.format("ropes:steel%irope_block", i), "rope_block_composition_upgrade")
end

print(S("[Ropes] Loaded!"))
