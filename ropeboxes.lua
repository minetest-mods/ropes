-- internationalization boilerplate
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

local function register_rope_block(multiple, pixels)
	minetest.register_node(string.format("ropes:%irope_block", multiple), {
	description = string.format(S("Rope %im"), ropes.ropeLength*multiple),
	_doc_items_create_entry = false,
	drawtype="nodebox",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "wallmounted",
	tiles = {
		string.format("default_wood.png^ropes_%irope.png", multiple),
		string.format("default_wood.png^ropes_%irope.png", multiple),
		"default_wood.png^ropes_side.png",
		"default_wood.png^ropes_side.png",
		string.format("default_wood.png^(ropes_%irope.png^[mask:ropes_mask.png)", multiple),
		string.format("default_wood.png^(ropes_%irope.png^[mask:ropes_mask.png)", multiple),
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.1875, -0.3125, 0.375, 0.375, 0.3125}, -- Spool
			{-0.5, -0.5, -0.1875, -0.375, 0.25, 0.1875}, -- Support_arm
			{0.375, -0.5, -0.1875, 0.5, 0.25, 0.1875}, -- Support_arm
			{-0.375, -0.5, -0.1875, 0.375, -0.375, 0.1875}, -- Base
			{-0.0625*(pixels/2), -0.1875, -0.5, 0.0625*(pixels/2), 0.375, 0.5}, -- Longitudinal_rope
			{-0.0625*(pixels/2), -0.3125, -0.375, 0.0625*(pixels/2), 0.5, 0.375}, -- Vertical_rope
		},
	},
	selection_box = {type="regular"},
	collision_box = {type="regular"},
	groups = {flammable=2, choppy=2, oddly_breakable_by_hand=1},
	
	after_place_node = function(pos, placer)
		local pos_below = {x=pos.x, y=pos.y-1, z=pos.z}
		local placer_name = placer:get_player_name()
		
		if minetest.is_protected(pos_below, placer_name) then
			return
		end
		
		local node_below = minetest.get_node(pos_below)
		if node_below.name == "air" then
		minetest.add_node(pos_below, {name="ropes:rope_bottom"})
		local meta = minetest.get_meta(pos_below)
		meta:set_int("length_remaining", ropes.ropeLength*multiple)
		meta:set_string("placer", placer:get_player_name())
		end
	end,
	after_destruct = function(pos)
		local pos_below = {x=pos.x, y=pos.y-1, z=pos.z}
		ropes.destroy_rope_starting(pos_below, 'ropes:rope', 'ropes:rope_bottom', 'ropes:rope_top')
	end
	})
	
	if (multiple ~= 1) then
		local rec = {}
		for i=1,multiple,1 do
			rec[i] = "ropes:1rope_block"
		end
		
		minetest.register_craft({
			output = string.format("ropes:%irope_block", multiple),
			type = "shapeless",
			recipe = rec
		})
	
		minetest.register_craft({
			output = string.format("ropes:1rope_block %i", multiple),
			recipe =  {
				{string.format('ropes:%irope_block', multiple)}
			}
		})
	end
	
	if minetest.get_modpath("doc") then
		doc.add_entry_alias("nodes", "ropes:rope", "nodes", string.format("ropes:%irope_block", multiple))
	end
end

--creates rope blocks with length multiples 1-5.
--second parameter sets how many pixels wide the rope texture is
register_rope_block(1, 4)
register_rope_block(2, 8)
register_rope_block(3, 10)
register_rope_block(4, 10)
register_rope_block(5, 12)

minetest.register_node("ropes:rope", {
	description = S("Rope"),
	_doc_items_longdesc = ropes.doc.ropebox_longdesc,
    _doc_items_usagehelp = ropes.doc.ropebox_usage,
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	drop = "",
	tiles = { "ropes_rope.png" },
	drawtype = "plantlike",
	groups = {choppy=2, flammable=2, not_in_creative_inventory=1},
	sounds =  default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
  	after_destruct = function(pos)
		ropes.hanging_after_destruct(pos, "ropes:rope_top", "ropes:rope", "ropes:rope_bottom")
	end,
})

minetest.register_node("ropes:rope_bottom", {
	description = S("Rope"),
	_doc_items_create_entry = false,
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	drop = "",
	tiles = { "ropes_rope_bottom.png" },
	drawtype = "plantlike",
	groups = {choppy=2, flammable=2, not_in_creative_inventory=1},
	sounds =  default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	
	on_construct = function( pos )
		local timer = minetest.get_node_timer( pos )
		timer:start( 1 )
	end,
	
	on_timer = function( pos, elapsed )
		local currentend = minetest.get_node(pos)
		local currentmeta = minetest.get_meta(pos)
		local currentlength = currentmeta:get_int("length_remaining")
		local placer_name = currentmeta:get_string("placer")
		local pos_below = {x=pos.x, y=pos.y-1, z=pos.z}
		local node_below = minetest.get_node(pos_below)
		if  node_below.name == "air" and (currentlength > 1) and not minetest.is_protected(pos_below, placer_name) then
			minetest.add_node(pos_below, {name="ropes:rope_bottom"})
			local newmeta = minetest.get_meta(pos_below)
			newmeta:set_int("length_remaining", currentlength-1)
			newmeta:set_string("placer", placer_name)
			minetest.set_node(pos, {name="ropes:rope"})
		else
			local timer = minetest.get_node_timer( pos )
			timer:start( 1 )
		end
	end,
	
    after_destruct = function(pos)
		ropes.hanging_after_destruct(pos, "ropes:rope_top", "ropes:rope", "ropes:rope_bottom")
	end,
})

minetest.register_node("ropes:rope_top", {
	description = S("Rope"),
	_doc_items_create_entry = false,
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	drop = "",
	tiles = { "ropes_rope_top.png" },
	drawtype = "plantlike",
	groups = {not_in_creative_inventory=1},
	sounds =  default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	
	on_construct = function( pos )
		local timer = minetest.get_node_timer( pos )
		timer:start( 1 )
	end,
	
	on_timer = function( pos, elapsed )
		local p = {x=pos.x, y=pos.y-1, z=pos.z}
		local n = minetest.get_node(p)
	
		if (n.name ~= "ignore") then
			ropes.destroy_rope_starting(p, 'ropes:rope', 'ropes:rope_bottom', 'ropes:rope_top')
			minetest.swap_node(pos, {name="air"})
		else
			local timer = minetest.get_node_timer( pos )
			timer:start( 1 )
		end
	end,
})
