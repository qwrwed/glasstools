local tools = {
	{"pick", "Pickaxe"},
	{"axe", "Axe"},
	{"shovel", "Shovel", wield_image = "glasstools_tool_glassshovel.png^[transformR90", wield_image = "glasstools_tool_glassshovel_broken.png^[transformR90"},
	{"sword", "Sword"},
	{"hoe", "Hoe"}
}

for _, row in ipairs(tools) do
	local tooltype = row[1]
	local desc = row[2]
	local wield1 = row[3]
	local wield2 = row[4]
	minetest.register_tool("glasstools:"..tooltype.."_glass", {
		description = "Glass "..desc,
		inventory_image = "glasstools_tool_glass"..tooltype..".png",
		wield1
	})
	
	minetest.register_tool("glasstools:"..tooltype.."_glass_broken", {
		description = "Broken Glass "..desc,
		inventory_image = "glasstools_tool_glass"..tooltype.."_broken.png",
		wield2
	})
	
	minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
		tool = puncher:get_wielded_item():get_name()
		if (tool == "glasstools:"..tooltype.."_glass") and node.name ~= "air" then
			local inv = puncher:get_inventory()
			puncher:set_wielded_item("glasstools:"..tooltype.."_glass_broken")
			minetest.sound_play("default_break_glass", {pos = pointed_thing.above, gain = 1.0, max_hear_distance = 10,})
			minetest.place_node(pointed_thing.above, {name = "glasstools:glass_fragments"})
		end
		if (tool == "glasstools:"..tooltype.."_glass_broken") and node.name ~= "air" then
			local inv = puncher:get_inventory()
			puncher:set_wielded_item("default:stick")
			minetest.sound_play("default_break_glass", {pos = pointed_thing.above, gain = 1.0, max_hear_distance = 10,})
			minetest.place_node(pointed_thing.above, {name = "glasstools:glass_fragments"})
		end
		
	end
	)
	minetest.register_craft({
		output = "glasstools:glass_broken",
		recipe = {
			{"glasstools:"..tooltype.."_glass_broken"},
		
		},
		replacements = {  
			{"glasstools:"..tooltype.."_glass_broken", "default:stick"}, 
		},
	})
end
	
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