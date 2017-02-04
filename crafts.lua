-- internationalization boilerplate
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

if minetest.get_modpath("farming") then
	minetest.register_craft({
		output =  'ropes:ropesegment',
		recipe = {
			{'farming:cotton',},
			{'farming:cotton',},
			{'farming:cotton'}
		}
	})
end

minetest.register_craftitem("ropes:ropesegment", {
	description = S("Rope Segment"),
	_doc_items_longdesc = ropes.doc.ropesegment_longdesc,
    _doc_items_usagehelp = ropes.doc.ropesegment_usage,
	groups = {vines = 1},
	inventory_image = "ropes_item.png",
})

minetest.register_craft({
	output = "ropes:ropeladder_top",
	recipe =  {
		{'group:vines','group:stick','group:vines'},
		{'group:vines','group:stick','group:vines'},
	}
})

minetest.register_craft({
	output = "ropes:1rope_block",
	recipe =  {
		{'group:wood',},
		{'group:vines',},
		{'group:vines'}
	}
})

local cotton_burn_time = 1
local wood_burn_time = minetest.get_craft_result({method="fuel", width=1, items={ItemStack("default:wood")}}).time
local rope_burn_time = cotton_burn_time * 3
local rope_box_burn_time = wood_burn_time + rope_burn_time * 2
local stick_burn_time = minetest.get_craft_result({method="fuel", width=1, items={ItemStack("default:stick")}}).time
local ladder_burn_time = rope_burn_time * 2 + stick_burn_time * 2

minetest.register_craft({
	type = "fuel",
	recipe = "ropes:ropesegment",
	burntime = rope_burn_time,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ropes:1rope_block",
	burntime = rope_box_burn_time,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ropes:2rope_block",
	burntime = rope_box_burn_time * 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ropes:3rope_block",
	burntime = rope_box_burn_time * 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ropes:4rope_block",
	burntime = rope_box_burn_time * 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ropes:5rope_block",
	burntime = rope_box_burn_time * 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "ropes:ropeladder_top",
	burntime = ladder_burn_time,
})