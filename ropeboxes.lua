-- internationalization boilerplate
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

local function rope_box_tiles(count)
	return {
		string.format("ropes_ropebox_front_%i.png^ropes_%i.png", count, count),
		string.format("ropes_ropebox_front_%i.png^ropes_%i.png", count, count),
		"ropes_ropebox_side.png",
		"ropes_ropebox_side.png",
		string.format("ropes_ropebox_front_%i.png^ropes_%i.png", count, count),
		string.format("ropes_ropebox_front_%i.png^ropes_%i.png", count, count),
	}
end

local rope_box_data = {
{
	node={
		{-0.125, -0.125, -0.25, 0.125, 0.125, 0.25}, -- pulley
		{-0.125, -0.25, -0.125, 0.125, 0.25, 0.125}, -- pulley
		{-0.125, -0.1875, -0.1875, 0.125, 0.1875, 0.1875}, -- pulley_core
		{-0.1875, -0.5, -0.125, -0.125, 0.125, 0.125}, -- support
		{0.125, -0.5, -0.125, 0.1875, 0.125, 0.125}, -- support
	},
	--selection = {-0.1875, -0.5, -0.25, 0.1875, 0.25, 0.25}, -- selection
	tiles = rope_box_tiles(1),
},
{	
	node={
		{-0.1875, -0.125, -0.25, 0.1875, 0.125, 0.25}, -- pulley
		{-0.1875, -0.25, -0.125, 0.1875, 0.25, 0.125}, -- pulley
		{-0.1875, -0.1875, -0.1875, 0.1875, 0.1875, 0.1875}, -- pulley_core
		{-0.25, -0.5, -0.125, -0.1875, 0.125, 0.125}, -- support
		{0.1875, -0.5, -0.125, 0.25, 0.125, 0.125}, -- support
	},
	--selection = {-0.1875, -0.5, -0.25, 0.1875, 0.25, 0.25}, -- selection
	tiles = rope_box_tiles(2),
},
{	
	node={
		{-0.25, -0.125, -0.25, 0.25, 0.125, 0.25}, -- pulley
		{-0.25, -0.25, -0.125, 0.25, 0.25, 0.125}, -- pulley
		{-0.25, -0.1875, -0.1875, 0.25, 0.1875, 0.1875}, -- pulley_core
		{-0.3125, -0.5, -0.125, -0.25, 0.125, 0.125}, -- support
		{0.25, -0.5, -0.125, 0.3125, 0.125, 0.125}, -- support
	},
	--selection = {-0.3125, -0.5, -0.25, 0.3125, 0.25, 0.25}, -- selection
	tiles = rope_box_tiles(3),
},
{	
	node={
		{-0.3125, -0.125, -0.25, 0.3125, 0.125, 0.25}, -- pulley
		{-0.3125, -0.25, -0.125, 0.3125, 0.25, 0.125}, -- pulley
		{-0.3125, -0.1875, -0.1875, 0.3125, 0.1875, 0.1875}, -- pulley_core
		{-0.375, -0.5, -0.125, -0.3125, 0.125, 0.125}, -- support
		{0.3125, -0.5, -0.125, 0.375, 0.125, 0.125}, -- support
	},
	--selection = {-0.375, -0.5, -0.25, 0.375, 0.25, 0.25}, -- selection
	tiles = rope_box_tiles(4),
},
{	
	node={
		{-0.375, -0.125, -0.25, 0.375, 0.125, 0.25}, -- pulley
		{-0.375, -0.25, -0.125, 0.375, 0.25, 0.125}, -- pulley
		{-0.375, -0.1875, -0.1875, 0.375, 0.1875, 0.1875}, -- pulley_core
		{-0.4375, -0.5, -0.125, -0.375, 0.125, 0.125}, -- support
		{0.375, -0.5, -0.125, 0.4375, 0.125, 0.125}, -- support
	},
	--selection = {-0.4375, -0.5, -0.25, 0.4375, 0.25, 0.25}, -- selection
	tiles = rope_box_tiles(5),
},
{
	node={
		{-0.1875, -0.1875, -0.3125, 0.1875, 0.1875, 0.3125}, -- pulley
		{-0.1875, -0.3125, -0.1875, 0.1875, 0.3125, 0.1875}, -- pulley
		{-0.1875, -0.25, -0.25, 0.1875, 0.25, 0.25}, -- pulley_core
		{-0.25, -0.5, -0.125, -0.1875, 0.125, 0.125}, -- support
		{0.1875, -0.5, -0.125, 0.25, 0.125, 0.125}, -- support
	},
	--selection = {-0.1875, -0.5, -0.3125, 0.1875, 0.3125, 0.3125}, -- selection
	tiles = rope_box_tiles(2),
},
{	
	node={
		{-0.25, -0.1875, -0.3125, 0.25, 0.1875, 0.3125}, -- pulley
		{-0.25, -0.3125, -0.1875, 0.25, 0.3125, 0.1875}, -- pulley
		{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25}, -- pulley_core
		{-0.3125, -0.5, -0.125, -0.25, 0.125, 0.125}, -- support
		{0.25, -0.5, -0.125, 0.3125, 0.125, 0.125}, -- support
	},
	--selection = {-0.3125, -0.5, -0.3125, 0.3125, 0.3125, 0.3125}, -- selection
	tiles = rope_box_tiles(3),
},
{	
	node={
		{-0.3125, -0.1875, -0.3125, 0.3125, 0.1875, 0.3125}, -- pulley
		{-0.3125, -0.3125, -0.1875, 0.3125, 0.3125, 0.1875}, -- pulley
		{-0.3125, -0.25, -0.25, 0.3125, 0.25, 0.25}, -- pulley_core
		{-0.375, -0.5, -0.125, -0.3125, 0.125, 0.125}, -- support
		{0.3125, -0.5, -0.125, 0.375, 0.125, 0.125}, -- support
	},
	--selection = {-0.375, -0.5, -0.3125, 0.375, 0.3125, 0.3125}, -- selection
	tiles = rope_box_tiles(4),
},
{	
	node={
		{-0.375, -0.1875, -0.3125, 0.375, 0.1875, 0.3125}, -- pulley
		{-0.375, -0.3125, -0.1875, 0.375, 0.3125, 0.1875}, -- pulley
		{-0.375, -0.25, -0.25, 0.375, 0.25, 0.25}, -- pulley_core
		{-0.4375, -0.5, -0.125, -0.375, 0.125, 0.125}, -- support
		{0.375, -0.5, -0.125, 0.4375, 0.125, 0.125}, -- support
	},
	--selection_bottom = {-0.4375, -0.5, -0.3125, 0.4375, 0.3125, 0.3125}, -- selection
	tiles = rope_box_tiles(5),
}
}

local function register_rope_block(multiple)
	local rope_block_def = {
		description = S("Rope @1m", ropes.ropeLength*multiple),
		_doc_items_create_entry = false,
		drawtype="nodebox",
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "wallmounted",
		walkable = false,
		climbable = true,
		tiles = rope_box_data[multiple].tiles,
		node_box = {
			type = "fixed",
			fixed = rope_box_data[multiple].node
		},
		selection_box = {type="regular"},
		collision_box = {type="regular"},
		groups = {flammable=2, choppy=2, oddly_breakable_by_hand=1, rope_block = 1},
	
		after_place_node = function(pos, placer)
			local pos_below = {x=pos.x, y=pos.y-1, z=pos.z}
			local placer_name = placer:get_player_name()
			
			if minetest.is_protected(pos_below, placer_name) and not minetest.check_player_privs(placer, "protection_bypass") then
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
			ropes.destroy_rope(pos_below, {'ropes:rope', 'ropes:rope_bottom'})
		end
	}	
	
	-- If this number is higher than permitted, we still want to register the block (in case
	-- some were already placed in-world) but we want to hide it from creative inventory
	-- and if someone digs it we want to disintegrate it into its component parts to prevent
	-- reuse.
	if multiple > ropes.ropeLengthMaxMultiple then
		rope_block_def.groups.not_in_creative_inventory = 1
		rope_block_def.drop = string.format("ropes:1rope_block %i", multiple)
	end
	
	minetest.register_node(string.format("ropes:%irope_block", multiple), rope_block_def)
	
	if (multiple ~= 1) then
		-- Only register a recipe to craft this if it's within the permitted multiple range
		if multiple <= ropes.ropeLengthMaxMultiple then
			local rec = {}
			for i=1,multiple,1 do
				rec[i] = "ropes:1rope_block"
			end
		
			minetest.register_craft({
				output = string.format("ropes:%irope_block", multiple),
				type = "shapeless",
				recipe = rec
			})
		end
	
		-- Always allow players to disintegrate this into component parts, in case
		-- there were some in inventory and the setting was changed.
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

local rope_def = {
	description = S("Rope"),
	_doc_items_longdesc = ropes.doc.ropebox_longdesc,
    _doc_items_usagehelp = ropes.doc.ropebox_usage,
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	drop = "",
	tiles = { "ropes_3.png", "ropes_3.png", "ropes_3.png", "ropes_3.png", "ropes_5.png", "ropes_5.png" },
	groups = {choppy=2, flammable=2, not_in_creative_inventory=1},
	sounds =  default.node_sound_leaves_defaults(),
	drawtype = "nodebox",
	node_box = {
		type = "connected",
		fixed = {-1/16, -1/2, -1/16, 1/16, 1/2, 1/16},
		connect_top = {-1/16, 1/2, -1/16, 1/16, 3/4, 1/16}
	},
	connects_to = {"group:rope_block"},
	connect_sides = {"top"},
	selection_box = {
		type = "fixed",
		fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
	},
  	after_destruct = function(pos)
		ropes.hanging_after_destruct(pos, "ropes:rope_top", "ropes:rope", "ropes:rope_bottom")
	end,
}

local rope_extension_timer = ropes.make_rope_on_timer("ropes:rope")

local rope_bottom_def = {
	description = S("Rope"),
	_doc_items_create_entry = false,
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	drop = "",
	tiles = { "ropes_3.png", "ropes_3.png", "ropes_3.png", "ropes_3.png", "ropes_5.png", "ropes_5.png" },
	drawtype = "nodebox",
	groups = {choppy=2, flammable=2, not_in_creative_inventory=1},
	sounds =  default.node_sound_leaves_defaults(),
	node_box = {
		type = "connected",
		fixed = {
			{-1/16, -3/8, -1/16, 1/16, 1/2, 1/16},
			{-2/16, -5/16, -2/16, 2/16, -1/16, 2/16},
		},
		connect_top = {-1/16, 1/2, -1/16, 1/16, 3/4, 1/16}
	},
	connects_to = {"group:rope_block"},
	connect_sides = {"top"},
	selection_box = {
		type = "fixed",
		fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
	},
	
	on_construct = function( pos )
		local timer = minetest.get_node_timer( pos )
		timer:start( 1 )
	end,
	
	on_timer = rope_extension_timer,
	
    after_destruct = function(pos)
		ropes.hanging_after_destruct(pos, "ropes:rope_top", "ropes:rope", "ropes:rope_bottom")
	end,
}

--creates rope blocks with length multiples 1-5.
--second parameter sets how many pixels wide the rope texture is
register_rope_block(1)
register_rope_block(2)
register_rope_block(3)
register_rope_block(4)
register_rope_block(5)
register_rope_block(6)
register_rope_block(7)
register_rope_block(8)
register_rope_block(9)

minetest.register_node("ropes:rope", rope_def)
minetest.register_node("ropes:rope_bottom", rope_bottom_def)