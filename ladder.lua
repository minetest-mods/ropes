minetest.register_node("vines:ropeladder_top", {
	description = "Rope ladder",
	drawtype = "signlike",
	tiles = {"default_ladder_wood.png^vines_ropeladder_top.png"},
	is_ground_content = false,
	inventory_image = "default_ladder_wood.png^vines_ropeladder_top.png",
	wield_image = "default_ladder_wood.png^vines_ropeladder_top.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>

	},
	groups = { choppy=2, oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),

	after_place_node = function(pos)
		local pos_below = {x=pos.x, y=pos.y-1, z=pos.z}
		local node_below = minetest.get_node(pos_below)
		local this_node = minetest.get_node(pos)
		-- param2 holds the facing direction of this node. If it's 0 or 1 the node is "flat" and we don't want the ladder to extend.
		if node_below.name == "air" and this_node.param2 > 1 then
			minetest.add_node(pos_below, {name="vines:ropeladder_bottom", param2=this_node.param2})
			local meta = minetest.get_meta(pos_below)
			meta:set_int("length_remaining", vines.ropeLadderLength)
		end
	end,
	after_destruct = function(pos)
		local pos_below = {x=pos.x, y=pos.y-1, z=pos.z}
		vines.destroy_rope_starting(pos_below, "vines:ropeladder", "vines:ropeladder_bottom", "vines:ropeladder_falling")
	end,
})

minetest.register_craft({
	output = "vines:ropeladder_top",
	recipe =  {
		{'group:vines','default:stick','group:vines'},
		{'group:vines','default:stick','group:vines'},
	}
})

minetest.register_node("vines:ropeladder", {
	description = "Rope ladder",
	drop = "",
	drawtype = "signlike",
	tiles = {"default_ladder_wood.png^vines_ropeladder.png"},
	is_ground_content = false,
	inventory_image = "default_ladder_wood.png^vines_ropeladder.png",
	wield_image = "default_ladder_wood.png^vines_ropeladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {choppy=2, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	
	after_destruct = function(pos)
		vines.hanging_after_destruct(pos, "vines:ropeladder_falling", "vines:ropeladder", "vines:ropeladder_bottom")
	end,
})

minetest.register_node("vines:ropeladder_bottom", {
	description = "Rope ladder",
	drop = "",
	drawtype = "signlike",
	tiles = {"default_ladder_wood.png^vines_ropeladder_bottom.png"},
	is_ground_content = false,
	inventory_image = "default_ladder_wood.png^vines_ropeladder_bottom.png",
	wield_image = "default_ladder_wood.png^vines_ropeladder_bottom.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>

	},
	groups = {choppy=2, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	on_construct = function( pos )
		local timer = minetest.get_node_timer( pos )
		timer:start( 1 )
	end,
	on_timer = function( pos, elapsed )
		local currentend = minetest.get_node(pos)
		local currentmeta = minetest.get_meta(pos)
		local currentlength = currentmeta:get_int("length_remaining")
		local newpos = {x=pos.x, y=pos.y-1, z=pos.z}
		local newnode = minetest.get_node(newpos)
		local oldnode = minetest.get_node(pos)
		if currentlength > 1 then
			if  newnode.name == "air" then
				minetest.add_node(newpos, {name="vines:ropeladder_bottom", param2=oldnode.param2})
				local newmeta = minetest.get_meta(newpos)
				newmeta:set_int("length_remaining", currentlength-1)
				minetest.set_node(pos, {name="vines:ropeladder", param2=oldnode.param2})
			else
				local timer = minetest.get_node_timer( pos )
				timer:start( 1 )
			end
		end
	end,
	
	after_destruct = function(pos)
		vines.hanging_after_destruct(pos, "vines:ropeladder_falling", "vines:ropeladder", "vines:ropeladder_bottom")
	end,
})

minetest.register_node("vines:ropeladder_falling", {
	description = "Rope ladder",
	drop = "",
	drawtype = "signlike",
	tiles = {"default_ladder_wood.png^vines_ropeladder.png"},
	is_ground_content = false,
	inventory_image = "default_ladder_wood.png^vines_ropeladder.png",
	wield_image = "default_ladder_wood.png^vines_ropeladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>

	},
	groups = {flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	on_construct = function( pos )
		local timer = minetest.get_node_timer( pos )
		timer:start( 1 )
	end,
	on_timer = function( pos, elapsed )
		local pos_below = {x=pos.x, y=pos.y-1, z=pos.z}
		local node_below = minetest.get_node(pos_below)

		if (node_below.name ~= "ignore") then
			vines.destroy_rope_starting(pos_below, 'vines:ropeladder', 'vines:ropeladder_bottom', 'vines:ropeladder_falling')
			minetest.swap_node(pos, {name="air"})
		else
			local timer = minetest.get_node_timer( pos )
			timer:start( 1 )
		end
	end
})
