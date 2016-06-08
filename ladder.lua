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
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),

	after_place_node = function(pos)
		local p = {x=pos.x, y=pos.y-1, z=pos.z}
		local n = minetest.get_node(p)
		local o = minetest.get_node(pos)
		-- param2 holds the facing direction of this node. If it's 0 or 1 the node is "flat" and we don't want the ladder to extend.
		if n.name == "air" and o.param2 > 1 then
			minetest.add_node(p, {name="vines:ropeladder_bottom", param2=o.param2})
			local meta = minetest.get_meta(p)
			meta:set_int("length_remaining", vines.ropeLadderLength)
		end
	end,
	after_destruct = function(pos)
		local p = {x=pos.x, y=pos.y-1, z=pos.z}
		vines.destroy_rope_starting(p, 'vines:ropeladder', 'vines:ropeladder_bottom', 'vines:ropeladder_falling')
	end
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
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("vines:ropeladder_bottom", {
	description = "Rope ladder",
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
	groups = {flammable=2, not_in_creative_inventory=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function( pos )
		local timer = minetest.get_node_timer( pos )
		timer:start( 1 )
	end,
	on_timer = function( pos, elapsed )
		local currentend = minetest.get_node(pos)
		local currentmeta = minetest.get_meta(pos)
		local currentlength = currentmeta:get_int("length_remaining")
		local p = {x=pos.x, y=pos.y-1, z=pos.z}
		local n = minetest.get_node(p)
		local o = minetest.get_node(pos)
		if  n.name == "air" and (currentlength > 1) then
			minetest.add_node(p, {name="vines:ropeladder_bottom", param2=o.param2})
			local newmeta = minetest.get_meta(p)
			newmeta:set_int("length_remaining", currentlength-1)
			minetest.set_node(pos, {name="vines:ropeladder", param2=o.param2})
		else
			local timer = minetest.get_node_timer( pos )
			timer:start( 1 )
		end
	end
})

minetest.register_node("vines:ropeladder_falling", {
	description = "Rope ladder",
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
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function( pos )
		local timer = minetest.get_node_timer( pos )
		timer:start( 1 )
	end,
	on_timer = function( pos, elapsed )
		local p = {x=pos.x, y=pos.y-1, z=pos.z}
		local n = minetest.get_node(p)

		if (n.name ~= "ignore") then
			vines.destroy_rope_starting(p, 'vines:ropeladder', 'vines:ropeladder_bottom', 'vines:ropeladder_falling')
			minetest.set_node(pos, {name="air"})
		else
			local timer = minetest.get_node_timer( pos )
			timer:start( 1 )
		end
	end
})
