local c_air = minetest.get_content_id("air")

ropes.destroy_rope_starting = function(pos, targetnode, bottomnode, topnode )
	local node_name = minetest.get_node(pos).name
	if node_name ~= targetnode and node_name ~= bottomnode then
		return
	end
	local y_top = pos.y
	local y_bottom = y_top
	local true_bottom = true	
	while true do
		minetest.debug("loop", y_bottom)
		node_name = minetest.get_node({x=pos.x, y=y_bottom - 1, z=pos.z}).name
		if node_name == targetnode or node_name == bottomnode then
			y_bottom = y_bottom - 1
		elseif node_name == "ignore" then
			true_bottom = false
			break
		else
			break
		end
	end

	local manip = minetest.get_voxel_manip()
	local pos_bottom = {x=pos.x, y=y_bottom, z=pos.z}
	local pos_top = {x=pos.x, y=y_top, z=pos.z}
	local pos1, pos2 = manip:read_from_map(pos_bottom, pos_top)
	local area = VoxelArea:new({MinEdge=pos1, MaxEdge=pos2})
	local nodes = manip:get_data()

	for i in area:iterp(pos_bottom, pos_top) do
		nodes[i] = c_air
	end
	if not true_bottom then
		nodes[area:indexp(pos_bottom)] = minetest.get_content_id(topnode)
	end

	manip:set_data(nodes)
	manip:write_to_map()
	manip:update_map() -- <— this takes time
	
	if not true_bottom then
		minetest.get_node_timer(pos_bottom):start(1)
	end
end

ropes.hanging_after_destruct = function(pos, top_node, middle_node, bottom_node)
	local node = minetest.get_node(pos)
	if node.name == top_node or node.name == middle_node or node.name == bottom_node then
		return -- this was done by another ladder node changing this one, don't react
	end

	pos.y = pos.y + 1 -- one up
	local node_above = minetest.get_node(pos)
	if node_above.name == middle_node then
		minetest.swap_node(pos, {name=bottom_node, param2=node_above.param2})
	end
	
	pos.y = pos.y - 2 -- one down
	local node_below = minetest.get_node(pos)
	if node_below.name == middle_node then
		ropes.destroy_rope_starting(pos, middle_node, bottom_node, top_node)
		--minetest.swap_node(pos, {name="ropes:ropeladder_falling", param2=node_below.param2})
		--minetest.get_node_timer(pos):start(0)
	elseif node_below.name == bottom_node then
		minetest.swap_node(pos, {name="air"})
	end
end