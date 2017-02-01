-- Misc

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
	description = "Rope",
	_doc_items_longdesc = ropes.doc.ropesegment_longdesc,
    _doc_items_usagehelp = ropes.doc.ropesegment_usage,
	groups = {vines = 1},
	inventory_image = "ropes_item.png",
})

minetest.register_craft({
	output = "ropes:ropeladder_top",
	recipe =  {
		{'group:vines','default:stick','group:vines'},
		{'group:vines','default:stick','group:vines'},
	}
})

minetest.register_craft({
	output = "ropes:1rope_block",
	recipe =  {
		{'default:wood',},
		{'group:vines',},
		{'group:vines'}
	}
})
