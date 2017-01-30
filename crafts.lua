-- Misc

minetest.register_craft({
	output =  'vines:ropesegment',
	recipe = {
		{'farming:cotton',},
		{'farming:cotton',},
		{'farming:cotton'}
	}
})

minetest.register_craftitem("vines:ropesegment", {
	description = "Rope",
	_doc_items_longdesc = vines.doc.ropesegment_longdesc,
    _doc_items_usagehelp = vines.doc.ropesegment_usage,
	groups = {vines = 1},
	inventory_image = "vines_item.png",
})
