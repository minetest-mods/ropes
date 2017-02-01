ropes.doc = {}

if not minetest.get_modpath("doc") then
	return
end

ropes.doc.ropesegment_longdesc = "Rope segments are bundles of fibre twisted into robust cables."
ropes.doc.ropesegment_usage = "This craft item is useful for creating rope ladders, or for spooling on wooden spindles to hang and climb upon."

ropes.doc.ropeladder_longdesc = "A hanging rope ladder that automatically extends downward"
ropes.doc.ropeladder_usage = "After a rope ladder is placed on a vertical wall it will begin extending downward until it reaches its maximum length (" .. tostring(ropes.ropeLadderLength) .. "m). If the rope ladder is removed all of the ladder below the point of removal will disappear. A rope ladder can be severed partway down using an axe or similar tool, and the ladder below the point where it is cut will collapse. No rope is actually lost in the process, though, and if the uppermost section of the ladder is removed and replaced the ladder will re-extend to the same maximum length as before."

ropes.doc.ropebox_longdesc = "Ropes are hung by placing rope boxes, which automatically lower a rope of fixed length below them. They can be climbed and cut."
ropes.doc.ropebox_usage = "Rope boxes have a certain amount of rope contained within them specified in the name of the node. They come in five standard lengths " ..
	string.format("(%dm, %dm, %dm, %dm and %dm)", ropes.ropeLength, ropes.ropeLength*2, ropes.ropeLength*3, ropes.ropeLength*4, ropes.ropeLength*5) ..
	" that can be crafted by combining and splitting up rope boxes in the crafting grid. For example, you can craft a " .. tostring(ropes.ropeLength*2) .. "m rope box by combining two " .. tostring(ropes.ropeLength) .. "m rope boxes, and the two " .. tostring(ropes.ropeLength) .. "m rope boxes can be recovered by splitting it back up in the crafting grid.\n\n" ..
	"When a rope box is placed the rope will immediately begin lowering from it at one meter per second. The rope will only descend when its end is in the vicinity of an active player, suspending its journey when no players are nearby, so a long descent may require a player to climb down the rope as it goes. Take care not to fall off the end! The rope will stop when it encounters and obstruction, but will resume lowering if the obstruction is removed.\n\n" ..
	"A rope can be severed midway using an axe or other similar tools. The section of rope below the cut will collapse and disappear, potentially causing players who were hanging on to it to fall. The remaining rope will not resume descent on its own, but the rope box at the top of the rope \"remembers\" how long the rope was and if it is deconstructed and replaced it will still have the same maximum length of rope as before - no rope is permnanently lost when a rope is severed like this."

doc.add_entry_alias("nodes", "ropes:ropeladder_top", "nodes", "ropes:ropeladder")
doc.add_entry_alias("nodes", "ropes:ropeladder_top", "nodes", "ropes:ropeladder_bottom")
doc.add_entry_alias("nodes", "ropes:ropeladder_top", "nodes", "ropes:ropeladder_falling")

doc.add_entry_alias("nodes", "ropes:rope", "nodes", "ropes:rope_bottom")
doc.add_entry_alias("nodes", "ropes:rope", "nodes", "ropes:rope_top")