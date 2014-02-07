minetest.register_tool("glasstools:pick_glass", {
	description = "Glass Pickaxe",
	inventory_image = "glasstools_tool_glasspick.png",
})

minetest.register_tool("glasstools:pick_glass_broken", {
	description = "Broken Glass Pickaxe",
	inventory_image = "glasstools_tool_glasspick_broken.png",
})

minetest.register_tool("glasstools:shovel_glass", {
	description = "Glass Shovel",
	inventory_image = "glasstools_tool_glassshovel.png",
	wield_image = "glasstools_tool_glassshovel.png^[transformR90",
})

minetest.register_tool("glasstools:shovel_glass_broken", {
	description = "Broken Glass Shovel",
	inventory_image = "glasstools_tool_glassshovel_broken.png",
	wield_image = "glasstools_tool_glassshovel_broken.png^[transformR90",
})

minetest.register_tool("glasstools:axe_glass", {
	description = "Glass Axe",
	inventory_image = "glasstools_tool_glassaxe.png",
})

minetest.register_tool("glasstools:axe_glass_broken", {
	description = "Broken Glass Axe",
	inventory_image = "glasstools_tool_glassaxe_broken.png",
})

minetest.register_tool("glasstools:sword_glass", {
	description = "Glass Sword",
	inventory_image = "glasstools_tool_glasssword.png",
})

minetest.register_tool("glasstools:sword_glass_broken", {
	description = "Broken Glass Sword",
	inventory_image = "glasstools_tool_glasssword_broken.png",
})

minetest.register_tool("glasstools:hoe_glass", {
	description = "Glass Hoe",
	inventory_image = "glasstools_tool_glasshoe.png",
})

minetest.register_tool("glasstools:hoe_glass_broken", {
	description = "Broken Glass Hoe",
	inventory_image = "glasstools_tool_glasshoe_broken.png",
})

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	tool = puncher:get_wielded_item():get_name()
	if (tool == "glasstools:pick_glass") and node.name ~= "air" then
		local inv = puncher:get_inventory()
		inv:remove_item("main", tool)
		puncher:set_wielded_item("glasstools:pick_glass_broken")
		minetest.sound_play("default_break_glass", {pos = pointed_thing.above, gain = 1.0, max_hear_distance = 10,})
		minetest.place_node(pointed_thing.above, {name = "glasstools:glass_fragments"})
	end
end
)

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	tool = puncher:get_wielded_item():get_name()
	if (tool == "glasstools:axe_glass") and node.name ~= "air" then
		local inv = puncher:get_inventory()
		inv:remove_item("main", tool)
		puncher:set_wielded_item("glasstools:axe_glass_broken")
		minetest.sound_play("default_break_glass", {pos = pointed_thing.above, gain = 1.0, max_hear_distance = 10,})
		minetest.place_node(pointed_thing.above, {name = "glasstools:glass_fragments"})
	end
end
)

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	tool = puncher:get_wielded_item():get_name()
	if (tool == "glasstools:shovel_glass") and node.name ~= "air" then
		local inv = puncher:get_inventory()
		inv:remove_item("main", tool)
		puncher:set_wielded_item("glasstools:shovel_glass_broken")
		minetest.sound_play("default_break_glass", {pos = pointed_thing.above, gain = 1.0, max_hear_distance = 10,})
		minetest.place_node(pointed_thing.above, {name = "glasstools:glass_fragments"})
	end
end
)

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	tool = puncher:get_wielded_item():get_name()
	if (tool == "glasstools:sword_glass") and node.name ~= "air" then
		local inv = puncher:get_inventory()
		inv:remove_item("main", tool)
		puncher:set_wielded_item("glasstools:sword_glass_broken")
		minetest.sound_play("default_break_glass", {pos = pointed_thing.above, gain = 1.0, max_hear_distance = 10,})
		minetest.place_node(pointed_thing.above, {name = "glasstools:glass_fragments"})
	end
end
)

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	tool = puncher:get_wielded_item():get_name()
	if (tool == "glasstools:hoe_glass") and node.name ~= "air" then
		local inv = puncher:get_inventory()
		inv:remove_item("main", tool)
		puncher:set_wielded_item("glasstools:hoe_glass_broken")
		minetest.sound_play("default_break_glass", {pos = pointed_thing.above, gain = 1.0, max_hear_distance = 10,})
		minetest.place_node(pointed_thing.above, {name = "glasstools:glass_fragments"})
	end
end
)
	
minetest.register_node("glasstools:glass_fragments", {
	description = "Block of Glass Fragments",
	walkable = false,
	drawtype = "plantlike",
	paramtype = "light",
	tiles = {"vessels_glass_fragments.png"},
	inventory_image = "vessels_glass_fragments.png",
	sunlight_propagates = true,
	selection_box = {
	type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, 3/16, 6/16},
	},
	groups = {falling_node=1,snappy=3,oddly_breakable_by_hand=3},
	drop = 'vessels:glass_fragments',
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "glasstools:sword_glass",
	recipe = {
		{"default:glass"},
		{"default:glass"},
		{"group:stick"},
	}
})

minetest.register_craft({
	output = "glasstools:pick_glass",
	recipe = {
		{"default:glass", "default:glass", "default:glass"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "glasstools:axe_glass",
	recipe = {
		{"default:glass", "default:glass"},
		{"default:glass", "group:stick"},
		{"", "group:stick"},
	}
})

minetest.register_craft({
	output = "glasstools:shovel_glass",
	recipe = {
		{"default:glass"},
		{"group:stick"},
		{"group:stick"},
	}
})

minetest.register_craft({
	output = "glasstools:hoe_glass",
	recipe = {
		{"default:glass","default:glass"},
		{"","group:stick"},
		{"","group:stick"},
	}
})

minetest.register_craftitem("glasstools:glass_broken", {
	description = "Broken Glass",
	inventory_image = "glasstools_glass_broken.png",
})

minetest.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "glasstools:glass_broken",
})

minetest.register_craft({
	output = "glasstools:glass_broken",
	recipe = {
		{"glasstools:pick_glass_broken"},
		
	},
	replacements = {  
		{"glasstools:pick_glass_broken", "default:stick"}, 
	},
})

minetest.register_craft({
	output = "glasstools:glass_broken",
	recipe = {
		{"glasstools:axe_glass_broken"},
		
	},
	replacements = {  
		{"glasstools:axe_glass_broken", "default:stick"}, 
	},
})

minetest.register_craft({
	output = "glasstools:glass_broken",
	recipe = {
		{"glasstools:shovel_glass_broken"},
		
	},
	replacements = {  
		{"glasstools:shovel_glass_broken", "default:stick"}, 
	},
})

minetest.register_craft({
	output = "glasstools:glass_broken",
	recipe = {
		{"glasstools:sword_glass_broken"},
		
	},
	replacements = {  
		{"glasstools:sword_glass_broken", "default:stick"}, 
	},
})

minetest.register_craft({
	output = "glasstools:glass_broken",
	recipe = {
		{"glasstools:hoe_glass_broken"},
		
	},
	replacements = {  
		{"glasstools:hoe_glass_broken", "default:stick"}, 
	},
})