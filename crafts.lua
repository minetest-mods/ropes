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
	groups = {vines = 1},
	inventory_image = "vines_item.png",
})
