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

ropes.ropeLengthMaxMultiple = tonumber(minetest.setting_get("ropes_rope_box_max_multiple"))
if not ropes.ropeLengthMaxMultiple then
	ropes.ropeLengthMaxMultiple = 9
end

dofile( minetest.get_modpath( ropes.name ) .. "/doc.lua" )
dofile( minetest.get_modpath( ropes.name ) .. "/functions.lua" )
dofile( minetest.get_modpath( ropes.name ) .. "/crafts.lua" )
dofile( minetest.get_modpath( ropes.name ) .. "/ropeboxes.lua" )
dofile( minetest.get_modpath( ropes.name ) .. "/ladder.lua" )

local upgrade_counter = 1
-- For players who used to use the combined vine/rope mod fork I split this out of
local swapper = function(old_node, new_node)
	minetest.register_lbm({
		name = "ropes:vines_to_ropes_upgrade_" .. tostring(upgrade_counter),
		nodenames = {old_node},
		action = function(pos, node)
			minetest.swap_node(pos, {name=new_node, param2=node.param2})
		end
	})
	upgrade_counter = upgrade_counter + 1
end
for i=1,5 do
	swapper(string.format("vines:%irope_block", i), string.format("ropes:%irope_block", i))
end
swapper("vines:rope", "ropes:rope")
swapper("vines:rope_bottom", "ropes:rope_bottom")
swapper("vines:rope_end", "ropes:rope_bottom")
swapper("vines:rope_top", "ropes:rope_top")
swapper("vines:ropeladder_top", "ropes:ropeladder_top")
swapper("vines:ropeladder", "ropes:ropeladder")
swapper("vines:ropeladder_bottom", "ropes:ropeladder_bottom")
swapper("vines:ropeladder_falling", "ropes:ropeladder_falling")
swapper("vines:rope_block", "ropes:5rope_block") -- for the original vines mod

print(S("[Ropes] Loaded!"))
