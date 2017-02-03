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
