minetest.register_node("ma_pops_furniture:barrel", {
	description = "Barrel",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {
		"mp_barrel.png", --top
		"mp_barrel.png", --bottom
		"mp_barrel.png^[transformR90", --right
		"mp_barrel.png^[transformR90", --left
		"mp_barrel_top.png", --back
		"mp_barrel_top.png" --front
	},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('main', 8*4)
		inv:set_size('storage', 9*3)
		meta:set_string('formspec',
			'size [9,9]'..
			'bgcolor[#080808BB;false]'..
			'list[current_name;storage;0,0.2;9,3;]'..
			'list[current_player;main;0.5,5;8,4;]')
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty('storage') and inv:is_empty('storage1')
	end,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	}
})

minetest.register_node("ma_pops_furniture:blinds", {
   description = "Blinds",
   tiles = {"mp_blinds.png"},
   drawtype = "nodebox",
   paramtype = "light",
   paramtype2 = "facedir",
   groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, furniture = 1},
   sunlight_propagates = true;
   node_box = {
       type = "fixed",
       fixed = {
           {-0.5, 0.5, 0.5, 0.5, 0.4, 0.4},
           {-0.5, 0.3, 0.5, 0.5, 0.2, 0.4},
           {-0.5, 0.1, 0.5, 0.5, 0.0, 0.4},
           {-0.5, -0.1, 0.5, 0.5, -0.2, 0.4},
           {-0.5, -0.3, 0.5, 0.5, -0.4, 0.4},
       },
   }
})

minetest.register_node("ma_pops_furniture:light", {	
	description = "Ceiling Light",
	tiles = {
		"default_coral_skeleton.png",
		"mp_ceiling_light_bottom.png",
		"mp_ceiling_light_side.png",
		"mp_ceiling_light_side.png",
		"mp_ceiling_light_side.png",
		"mp_ceiling_light_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	on_rightclick = function (pos, node, player, itemstack, pointed_thing)
	node.name = "ma_pops_furniture:light_on"
	minetest.set_node(pos, node)
	end,
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, 0.4375, -0.25, 0.25, 0.5, 0.25}, -- NodeBox1
			{-0.125, 0.3125, -0.125, 0.125, 0.4375, 0.125}, -- NodeBox2
			{-0.1875, -0.0625, -0.1875, 0.1875, 0.3125, 0.1875}, -- NodeBox3
		},
	}
})

minetest.register_node("ma_pops_furniture:light_on", {	
	description = "Ceiling Light",
	tiles = {
		"default_coral_skeleton.png",
		"mp_ceiling_light_bottom.png",
		"mp_ceiling_light_side.png",
		"mp_ceiling_light_side.png",
		"mp_ceiling_light_side.png",
		"mp_ceiling_light_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "ma_pops_furniture:light",
	light_source = 14,
	on_rightclick = function (pos, node, player, itemstack, pointed_thing)
	node.name = "ma_pops_furniture:light"
	minetest.set_node(pos, node)
	end,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, not_in_creative_inventory = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, 0.4375, -0.25, 0.25, 0.5, 0.25}, -- NodeBox1
			{-0.125, 0.3125, -0.125, 0.125, 0.4375, 0.125}, -- NodeBox2
			{-0.1875, -0.0625, -0.1875, 0.1875, 0.3125, 0.1875}, -- NodeBox3
		},
	}
})

minetest.register_node("ma_pops_furniture:ceiling_lamp", {
   description = "Ceiling Lamp",
   tiles = {
      "default_stone.png",
      "default_stone.png^mp_light_off.png",
      "default_stone.png",
      "default_stone.png",
      "default_stone.png",
      "default_stone.png"
},
   drawtype = "nodebox",
   paramtype = "light",
   paramtype2 = "facedir",
   on_rightclick = function (pos, node, player, itemstack, pointed_thing)
   node.name = "ma_pops_furniture:ceiling_lamp_on"
   minetest.set_node(pos, node)
   end,
   groups = {choppy = 2, oddly_breakable_by_hand = 2},
   node_box = {
       type = "fixed",
       fixed = {
           {-0.050, 0.5, -0.050, 0.050, -0.2, 0.050},
           {-0.1, -0.0, -0.1, 0.1, -0.2, 0.1},
           {-0.2, -0.1, -0.2, 0.2, -0.2, 0.2},
           {-0.3, -0.2, -0.3, 0.3, -0.5, 0.3},
       },
   }
})

minetest.register_node("ma_pops_furniture:ceiling_lamp_on", {
   description = "Ceiling Lamp On",
   tiles = {
		"default_stone.png",
		"default_stone.png^mp_light_on.png",
		"default_stone.png",
		"default_stone.png",
		"default_stone.png",
		"default_stone.png"
},
   drawtype = "nodebox",
   paramtype = "light",
   paramtype2 = "facedir",
   light_source =  14,
   drop = 'ma_pops_furniture:ceiling_lamp',
   on_rightclick = function (pos, node, player, itemstack, pointed_thing)
   node.name = "ma_pops_furniture:ceiling_lamp"
minetest.set_node(pos, node)
end,
   groups = {choppy = 2, oddly_breakable_by_hand = 2, not_in_creative_inventory = 1},
   node_box = {
       type = "fixed",
       fixed = {
           {-0.050, 0.5, -0.050, 0.050, -0.2, 0.050},
           {-0.1, -0.0, -0.1, 0.1, -0.2, 0.1},
           {-0.2, -0.1, -0.2, 0.2, -0.2, 0.2},
           {-0.3, -0.2, -0.3, 0.3, -0.5, 0.3},
       },
   }
})

minetest.register_node("ma_pops_furniture:fan_on", {
   description = "Fan (on)",
   tiles = {
		"default_coral_skeleton.png",
		"default_coral_skeleton.png",
		"default_coral_skeleton.png",
		"default_coral_skeleton.png",
		{
			name = "mp_fan_on.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.3
			},
		},
},
   drawtype = "nodebox",
   drop = 'ma_pops_furniture:fan_off',
   paramtype2 = "facedir",
   on_rightclick = function (pos, node, player, itemstack, pointed_thing)
node.name = "ma_pops_furniture:fan_off"
minetest.set_node(pos, node)
end,
   groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, not_in_creative_inventory = 1},
   node_box = {
       type = "fixed",
       fixed = {
          {-0.5, 0.5, 0.2, 0.5, -0.5, -0.2},
       },  
   }
})
minetest.register_node("ma_pops_furniture:fan_off", {
   description = "Fan",
   tiles = {
		"default_coral_skeleton.png",
		"default_coral_skeleton.png",
		"default_coral_skeleton.png",
		"default_coral_skeleton.png",
	    "mp_fan_off.png",
		"mp_fan_off.png",
},
   drawtype = "nodebox",
   drop = 'ma_pops_furniture:fan_off',
   paramtype2 = "facedir",
   on_rightclick = function (pos, node, player, itemstack, pointed_thing)
node.name = "ma_pops_furniture:fan_on"
minetest.set_node(pos, node)
end,
   groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
   node_box = {
       type = "fixed",
       fixed = {
          {-0.5, 0.5, 0.2, 0.5, -0.5, -0.2},
       },  
   }
})

minetest.register_node("ma_pops_furniture:ac", {
   description = "AC",
   tiles = {
		"mp_ac_top.png",
		"mp_ac_top.png",
		"mp_ac_top.png",
		"mp_ac_top.png",
		"mp_ac_b.png",
		"mp_ac_f.png",
		},
   drawtype = "nodebox",
   paramtype = "light",
   drop = 'ma_pops_furniture:ac',
   paramtype2 = "facedir",
   groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
   node_box = {
       type = "fixed",
       fixed = {
          {0.5, 0.5, 0.5, -0.5, -0.5, -0.4},
          {0.5, 0.2, -0.5, -0.5, -0.5, -0.4},
       },  
   }
})

local lamp_table = { --name, color, colorize(hex or color name:intensity(1-255))
{'Black', 'black', 'black:225'},
{'Blue', 'blue', 'blue:225'},
{'Brown', 'brown', 'brown:225'},
{'Cyan', 'cyan', 'cyan:200'},
{'Dark Green', 'dark_green', 'green:225'},
{'Dark Grey', 'dark_grey', 'black:200'},
{'Green', 'green', '#32cd32:150'},
{'Grey', 'grey', 'black:100'},
{'Magenta', 'magenta', 'magenta:200'},
{'Orange', 'orange', 'orange:225'},
{'Pink', 'pink', 'pink:225'},
{'Red', 'red', 'red:225'},
{'Violet', 'violet', 'violet:225'},
{'White', 'white', 'white:1'},
{'Yellow', 'yellow', 'yellow:225'},
}

for i in ipairs (lamp_table) do
	local name = lamp_table[i][1]
	local color = lamp_table[i][2]
	local hex = lamp_table[i][3]

minetest.register_node("ma_pops_furniture:lamp_"..color, {
	description= name.. " Lamp",
	tiles= {"mp_lt.png","mp_lb_middle.png^[colorize:"..hex.."^mp_lb.png","mp_ls.png^[colorize:"..hex.."^mp_ls_top.png","mp_ls.png^[colorize:"..hex.."^mp_ls_top.png","mp_ls.png^[colorize:"..hex.."^mp_ls_top.png","mp_ls.png^[colorize:"..hex.."^mp_ls_top.png",},
	drawtype= "nodebox",
	light_source =  14,
	paramtype = "facedir",
	drop= 'ma_pops_furniture:lamp_off_'..color,
	on_rightclick = function (pos, node, player, itemstack, pointed_thing)
		node.name = "ma_pops_furniture:lamp_off_"..color
		minetest.set_node(pos, node)
	end,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, not_in_creative_inventory = 1, furniture = 1},
	node_box= {
		type= "fixed",
		fixed= {
			{-0.25, -0.4375, -0.25, 0.25, -0.0625, 0.25},
			{-0.375, -0.0625, -0.375, 0.375, 0.5, 0.375},
			{-0.1875, -0.4375, -0.1875, 0.1875, -0.5, 0.1875},
		},
	},
	on_punch = function(pos, node, clicker)
	for _, obj in ipairs (minetest.get_connected_players())  do
        local item = obj:get_wielded_item():get_name()
        if item == 'dye:black' then
            node.name = "ma_pops_furniture:lamp_black"
               minetest.set_node(pos, node)
        else
                if item == 'dye:white' then
            node.name = "ma_pops_furniture:lamp_white"
               minetest.set_node(pos, node)
        else
                if item == 'dye:grey' then
            node.name = "ma_pops_furniture:lamp_grey"
               minetest.set_node(pos, node)
        else
        if item == 'dye:dark_grey' then
            node.name = "ma_pops_furniture:lamp_dark_grey"
               minetest.set_node(pos, node)
        else
                if item == 'dye:violet' then
            node.name = "ma_pops_furniture:lamp_violet"
               minetest.set_node(pos, node)
        else
                if item == 'dye:blue' then
            node.name = "ma_pops_furniture:lamp_blue"
               minetest.set_node(pos, node)
        else
                if item == 'dye:cyan' then
            node.name = "ma_pops_furniture:lamp_cyan"
               minetest.set_node(pos, node)
        else
                if item == 'dye:dark_green' then
            node.name = "ma_pops_furniture:lamp_dark_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:green' then
            node.name = "ma_pops_furniture:lamp_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:yellow' then
            node.name = "ma_pops_furniture:lamp_yellow"
               minetest.set_node(pos, node)
        else
                if item == 'dye:orange' then
            node.name = "ma_pops_furniture:lamp_orange"
               minetest.set_node(pos, node)
        else
                if item == 'dye:red' then
            node.name = "ma_pops_furniture:lamp_red"
               minetest.set_node(pos, node)
        else
                if item == 'dye:magenta' then
            node.name = "ma_pops_furniture:lamp_magenta"
               minetest.set_node(pos, node)
        else
                if item == 'dye:pink' then
            node.name = "ma_pops_furniture:lamp_pink"
               minetest.set_node(pos, node)
        else
                if item == 'dye:brown' then
            node.name = "ma_pops_furniture:lamp_brown"
               minetest.set_node(pos, node)
                      end
                     end
                    end
                   end
                  end
                 end
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
		 end
})

minetest.register_node("ma_pops_furniture:lamp_off_"..color, {
	description= name.. " Lamp",
	tiles= {"mp_lt.png","mp_lb_middle.png^[colorize:"..hex.."^mp_lb.png","mp_ls.png^[colorize:"..hex.."^mp_ls_top.png","mp_ls.png^[colorize:"..hex.."^mp_ls_top.png","mp_ls.png^[colorize:"..hex.."^mp_ls_top.png","mp_ls.png^[colorize:"..hex.."^mp_ls_top.png",},
	drawtype= "nodebox",
	paramtype = "facedir",
	on_rightclick = function (pos, node, player, itemstack, pointed_thing)
		node.name = "ma_pops_furniture:lamp_"..color
		minetest.set_node(pos, node)
	end,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, furniture = 1},
	node_box= {
		type= "fixed",
		fixed= {
			{-0.25, -0.4375, -0.25, 0.25, -0.0625, 0.25},
			{-0.375, -0.0625, -0.375, 0.375, 0.5, 0.375},
			{-0.1875, -0.4375, -0.1875, 0.1875, -0.5, 0.1875},
		},
	},
	on_punch = function(pos, node, clicker)
	for _, obj in ipairs (minetest.get_connected_players())  do
        local item = obj:get_wielded_item():get_name()
        if item == 'dye:black' then
            node.name = "ma_pops_furniture:lamp_off_black"
               minetest.set_node(pos, node)
        else
                if item == 'dye:white' then
            node.name = "ma_pops_furniture:lamp_off_white"
               minetest.set_node(pos, node)
        else
                if item == 'dye:grey' then
            node.name = "ma_pops_furniture:lamp_off_grey"
               minetest.set_node(pos, node)
        else
        if item == 'dye:dark_grey' then
            node.name = "ma_pops_furniture:lamp_off_dark_grey"
               minetest.set_node(pos, node)
        else
                if item == 'dye:violet' then
            node.name = "ma_pops_furniture:lamp_off_violet"
               minetest.set_node(pos, node)
        else
                if item == 'dye:blue' then
            node.name = "ma_pops_furniture:lamp_off_blue"
               minetest.set_node(pos, node)
        else
                if item == 'dye:cyan' then
            node.name = "ma_pops_furniture:lamp_off_cyan"
               minetest.set_node(pos, node)
        else
                if item == 'dye:dark_green' then
            node.name = "ma_pops_furniture:lamp_off_dark_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:green' then
            node.name = "ma_pops_furniture:lamp_off_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:yellow' then
            node.name = "ma_pops_furniture:lamp_off_yellow"
               minetest.set_node(pos, node)
        else
                if item == 'dye:orange' then
            node.name = "ma_pops_furniture:lamp_off_orange"
               minetest.set_node(pos, node)
        else
                if item == 'dye:red' then
            node.name = "ma_pops_furniture:lamp_off_red"
               minetest.set_node(pos, node)
        else
                if item == 'dye:magenta' then
            node.name = "ma_pops_furniture:lamp_off_magenta"
               minetest.set_node(pos, node)
        else
                if item == 'dye:pink' then
            node.name = "ma_pops_furniture:lamp_off_pink"
               minetest.set_node(pos, node)
        else
                if item == 'dye:brown' then
            node.name = "ma_pops_furniture:lamp_off_brown"
               minetest.set_node(pos, node)
                      end
                     end
                    end
                   end
                  end
                 end
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
		 end
})
end

local curtain_table = { --name, color, colorize(hex or color name:intensity(1-255))
{'Black', 'black', 'black:225'},
{'Blue', 'blue', 'blue:225'},
{'Brown', 'brown', 'brown:225'},
{'Cyan', 'cyan', 'cyan:200'},
{'Dark Green', 'dark_green', 'green:225'},
{'Dark Grey', 'dark_grey', 'black:200'},
{'Green', 'green', '#32cd32:150'},
{'Grey', 'grey', 'black:100'},
{'Magenta', 'magenta', 'magenta:200'},
{'Orange', 'orange', 'orange:225'},
{'Pink', 'pink', 'pink:225'},
{'Red', 'red', 'red:225'},
{'Violet', 'violet', 'violet:225'},
{'White', 'white', 'white:1'},
{'Yellow', 'yellow', 'yellow:225'},
}

for i in ipairs (curtain_table) do
	local name = curtain_table[i][1]
	local color = curtain_table[i][2]
	local hex = curtain_table[i][3]

minetest.register_node("ma_pops_furniture:curtains_"..color, {
	description= name.. " Curtains",
	tiles= {"default_acacia_tree.png","wool_"..color..".png^mp_curtainb.png","wool_"..color..".png^mp_curtains.png","wool_"..color..".png^mp_curtains.png","wool_"..color..".png^mp_curtains.png","wool_"..color..".png^mp_curtains.png",},
	drawtype= "nodebox",
	paramtype= "light",
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, furniture = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		node.name = "ma_pops_furniture:curtains_closed_"..color 
		minetest.set_node(pos, node)
	end,
	node_box= {
		type= "fixed",
		fixed= {
			{-0.5, -0.3, 0.5, -0.2, 0.5, 0.4},
			{-0.5, -0.5, 0.5, -0.3, -0.3, 0.4},
			{-0.5, 0.5, 0.5, 0.5, 0.2, 0.4},
			{-0.5, 0.5, 0.5, 0.5, 0.440, 0.350},
			{0.5, -0.3, 0.5, 0.2, 0.5, 0.4},
			{0.5, -0.5, 0.5, 0.3, -0.3, 0.4},
		},
	},
	on_punch = function(pos, node, clicker)
	for _, obj in ipairs (minetest.get_connected_players())  do
        local item = obj:get_wielded_item():get_name()
        if item == 'dye:black' then
            node.name = "ma_pops_furniture:curtains_black"
               minetest.set_node(pos, node)
        else
                if item == 'dye:white' then
            node.name = "ma_pops_furniture:curtains_white"
               minetest.set_node(pos, node)
        else
                if item == 'dye:grey' then
            node.name = "ma_pops_furniture:curtains_grey"
               minetest.set_node(pos, node)
        else
        if item == 'dye:dark_grey' then
            node.name = "ma_pops_furniture:curtains_dark_grey"
               minetest.set_node(pos, node)
        else
                if item == 'dye:violet' then
            node.name = "ma_pops_furniture:curtains_violet"
               minetest.set_node(pos, node)
        else
                if item == 'dye:blue' then
            node.name = "ma_pops_furniture:curtains_blue"
               minetest.set_node(pos, node)
        else
                if item == 'dye:cyan' then
            node.name = "ma_pops_furniture:curtains_cyan"
               minetest.set_node(pos, node)
        else
                if item == 'dye:dark_green' then
            node.name = "ma_pops_furniture:curtains_dark_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:green' then
            node.name = "ma_pops_furniture:curtains_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:yellow' then
            node.name = "ma_pops_furniture:curtains_yellow"
               minetest.set_node(pos, node)
        else
                if item == 'dye:orange' then
            node.name = "ma_pops_furniture:curtains_orange"
               minetest.set_node(pos, node)
        else
                if item == 'dye:red' then
            node.name = "ma_pops_furniture:curtains_red"
               minetest.set_node(pos, node)
        else
                if item == 'dye:magenta' then
            node.name = "ma_pops_furniture:curtains_magenta"
               minetest.set_node(pos, node)
        else
                if item == 'dye:pink' then
            node.name = "ma_pops_furniture:curtains_pink"
               minetest.set_node(pos, node)
        else
                if item == 'dye:brown' then
            node.name = "ma_pops_furniture:curtains_brown"
               minetest.set_node(pos, node)
                      end
                     end
                    end
                   end
                  end
                 end
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
		 end
})

minetest.register_node("ma_pops_furniture:curtains_closed_"..color, {
   description = name.." Closed Curtains",
   tiles= {"default_acacia_tree.png","wool_"..color..".png^mp_curtainb.png","wool_"..color..".png^mp_curtains.png","wool_"..color..".png^mp_curtains.png","wool_"..color..".png^mp_curtains.png","wool_"..color..".png^mp_curtains.png",},
   drawtype = "nodebox",
   paramtype = "light",
   paramtype2 = "facedir",
   groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, not_in_creative_inventory = 1, furniture = 1},
   drop = "ma_pops_furniture:curtains_"..color,
   on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		node.name = "ma_pops_furniture:curtains_"..color 
		minetest.set_node(pos, node)
	end,
   node_box = {
       type = "fixed",
       fixed = {
           {-0.5, -0.5, 0.5, 0.5, 0.5, 0.4},
		   {-0.5, 0.5, 0.5, 0.5, 0.440, 0.350},

       },
   },
   on_punch = function(pos, node, clicker)
	for _, obj in ipairs (minetest.get_connected_players())  do
        local item = obj:get_wielded_item():get_name()
        if item == 'dye:black' then
            node.name = "ma_pops_furniture:curtains_closed_black"
               minetest.set_node(pos, node)
        else
                if item == 'dye:white' then
            node.name = "ma_pops_furniture:curtains_closed_white"
               minetest.set_node(pos, node)
        else
                if item == 'dye:grey' then
            node.name = "ma_pops_furniture:curtains_closed_grey"
               minetest.set_node(pos, node)
        else
        if item == 'dye:dark_grey' then
            node.name = "ma_pops_furniture:curtains_closed_dark_grey"
               minetest.set_node(pos, node)
        else
                if item == 'dye:violet' then
            node.name = "ma_pops_furniture:curtains_closed_violet"
               minetest.set_node(pos, node)
        else
                if item == 'dye:blue' then
            node.name = "ma_pops_furniture:curtains_closed_blue"
               minetest.set_node(pos, node)
        else
                if item == 'dye:cyan' then
            node.name = "ma_pops_furniture:curtains_closed_cyan"
               minetest.set_node(pos, node)
        else
                if item == 'dye:dark_green' then
            node.name = "ma_pops_furniture:curtains_closed_dark_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:green' then
            node.name = "ma_pops_furniture:curtains_closed_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:yellow' then
            node.name = "ma_pops_furniture:curtains_closed_yellow"
               minetest.set_node(pos, node)
        else
                if item == 'dye:orange' then
            node.name = "ma_pops_furniture:curtains_closed_orange"
               minetest.set_node(pos, node)
        else
                if item == 'dye:red' then
            node.name = "ma_pops_furniture:curtains_closed_red"
               minetest.set_node(pos, node)
        else
                if item == 'dye:magenta' then
            node.name = "ma_pops_furniture:curtains_closed_magenta"
               minetest.set_node(pos, node)
        else
                if item == 'dye:pink' then
            node.name = "ma_pops_furniture:curtains_closed_pink"
               minetest.set_node(pos, node)
        else
                if item == 'dye:brown' then
            node.name = "ma_pops_furniture:curtains_closed_brown"
               minetest.set_node(pos, node)
                      end
                     end
                    end
                   end
                  end
                 end
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
		 end
})

minetest.register_node("ma_pops_furniture:curtains_2_tall_"..color, {
	description= name.. " Tall Curtains",
	tiles = {"wool_"..color..".png"},
	drawtype= "nodebox",
	paramtype= "light",
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, furniture = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		node.name = "ma_pops_furniture:curtains_2_tall_closed_"..color 
		minetest.set_node(pos, node)
	end,
	node_box= {
		type= "fixed",
		fixed= {
			{-0.5, -0.3, 0.5, -0.2, 0.5, 0.4},
			{-0.5, -0.5, 0.5, -0.3, -0.3, 0.4},
			{-0.5, 0.5, 0.5, 0.5, 0.2, 0.4},
			{0.5, -0.3, 0.5, 0.2, 0.5, 0.4},
			{0.5, -0.5, 0.5, 0.3, -0.3, 0.4},
			{-0.5, -0.5, 0.5, -0.3, -1.2, 0.4},
			{0.5, -0.5, 0.5, 0.3, -1.2, 0.4},
			{-0.5, -1.2, 0.5, -0.4, -1.5, 0.4},
			{0.5, -1.2, 0.5, 0.4, -1.5, 0.4},
		},
	},
	on_punch = function(pos, node, clicker)
	for _, obj in ipairs (minetest.get_connected_players())  do
        local item = obj:get_wielded_item():get_name()
        if item == 'dye:black' then
            node.name = "ma_pops_furniture:curtains_2_tall_black"
               minetest.set_node(pos, node)
        else
                if item == 'dye:white' then
            node.name = "ma_pops_furniture:curtains_2_tall_white"
               minetest.set_node(pos, node)
        else
                if item == 'dye:grey' then
            node.name = "ma_pops_furniture:curtains_2_tall_grey"
               minetest.set_node(pos, node)
        else
        if item == 'dye:dark_grey' then
            node.name = "ma_pops_furniture:curtains_2_tall_dark_grey"
               minetest.set_node(pos, node)
        else
                if item == 'dye:violet' then
            node.name = "ma_pops_furniture:curtains_2_tall_violet"
               minetest.set_node(pos, node)
        else
                if item == 'dye:blue' then
            node.name = "ma_pops_furniture:curtains_2_tall_blue"
               minetest.set_node(pos, node)
        else
                if item == 'dye:cyan' then
            node.name = "ma_pops_furniture:curtains_2_tall_cyan"
               minetest.set_node(pos, node)
        else
                if item == 'dye:dark_green' then
            node.name = "ma_pops_furniture:curtains_2_tall_dark_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:green' then
            node.name = "ma_pops_furniture:curtains_2_tall_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:yellow' then
            node.name = "ma_pops_furniture:curtains_2_tall_yellow"
               minetest.set_node(pos, node)
        else
                if item == 'dye:orange' then
            node.name = "ma_pops_furniture:curtains_2_tall_orange"
               minetest.set_node(pos, node)
        else
                if item == 'dye:red' then
            node.name = "ma_pops_furniture:curtains_2_tall_red"
               minetest.set_node(pos, node)
        else
                if item == 'dye:magenta' then
            node.name = "ma_pops_furniture:curtains_2_tall_magenta"
               minetest.set_node(pos, node)
        else
                if item == 'dye:pink' then
            node.name = "ma_pops_furniture:curtains_2_tall_pink"
               minetest.set_node(pos, node)
        else
                if item == 'dye:brown' then
            node.name = "ma_pops_furniture:curtains_2_tall_brown"
               minetest.set_node(pos, node)
                      end
                     end
                    end
                   end
                  end
                 end
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
		 end
})

minetest.register_node("ma_pops_furniture:curtains_2_tall_closed_"..color, {
	description= name.. " Closed Tall Curtains",
	tiles = {"wool_"..color..".png"},
	drawtype= "nodebox",
	paramtype= "light",
	paramtype2 = "facedir",
	drop = "ma_pops_furniture:curtains_2_tall_"..color,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, not_in_creative_inventory = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		node.name = "ma_pops_furniture:curtains_2_tall_"..color 
		minetest.set_node(pos, node)
	end,
	node_box= {
		type= "fixed",
		fixed= {
			   {0.5, 0.5, 0.5, -0.5, -1.5, 0.4},
		},
	},
	on_punch = function(pos, node, clicker)
	for _, obj in ipairs (minetest.get_connected_players())  do
        local item = obj:get_wielded_item():get_name()
        if item == 'dye:black' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_black"
               minetest.set_node(pos, node)
        else
                if item == 'dye:white' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_white"
               minetest.set_node(pos, node)
        else
                if item == 'dye:grey' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_grey"
               minetest.set_node(pos, node)
        else
        if item == 'dye:dark_grey' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_dark_grey"
               minetest.set_node(pos, node)
        else
                if item == 'dye:violet' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_violet"
               minetest.set_node(pos, node)
        else
                if item == 'dye:blue' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_blue"
               minetest.set_node(pos, node)
        else
                if item == 'dye:cyan' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_cyan"
               minetest.set_node(pos, node)
        else
                if item == 'dye:dark_green' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_dark_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:green' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:yellow' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_yellow"
               minetest.set_node(pos, node)
        else
                if item == 'dye:orange' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_orange"
               minetest.set_node(pos, node)
        else
                if item == 'dye:red' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_red"
               minetest.set_node(pos, node)
        else
                if item == 'dye:magenta' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_magenta"
               minetest.set_node(pos, node)
        else
                if item == 'dye:pink' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_pink"
               minetest.set_node(pos, node)
        else
                if item == 'dye:brown' then
            node.name = "ma_pops_furniture:curtains_2_tall_closed_brown"
               minetest.set_node(pos, node)
                      end
                     end
                    end
                   end
                  end
                 end
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
		 end
})
end

minetest.register_node("ma_pops_furniture:stairs", {
	description= "Stairs",
	tiles = {
		"default_coral_skeleton.png",
		"default_coral_skeleton.png",
		"default_coral_skeleton.png^mp_stairs_side.png",
		"default_coral_skeleton.png^mp_stairs_side.png^[transformFX",
		"default_coral_skeleton.png^mp_stairs_back.png",
		"default_coral_skeleton.png^mp_stairs_front.png"
	},
	drawtype = "mesh",
	mesh= "stairs.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.375, 0, 0.5, 0.5, 0.5}, -- NodeBox18
			{-0.5, -0.125, -0.5, 0.5, 0, 0}, -- NodeBox19
			{-0.0625, -0.375, -0.3125, 0.0625, -0.125, -0.1875}, -- NodeBox20
			{-0.0625, -0.25, 0.1875, 0.0625, 0.375, 0.3125}, -- NodeBox21
			{-0.0625, -0.375, -0.1875, 0.0625, -0.25, 0.3125}, -- NodeBox23
			{-0.0625, -0.25, 0.0625, 0.0625, -0.125, 0.1875}, -- NodeBox24
		}
	}
})

minetest.register_node("ma_pops_furniture:lamp_2_on", {
        description = "lamp2",
        	tiles = {
		"mp_lt.png",
		"mp_lt.png",
		"default_stone.png^mp_ls_top.png",
		"default_stone.png^mp_ls_top.png",
		"default_stone.png^mp_ls_top.png",
		"default_stone.png^mp_ls_top.png"
	},
	groups = {cracky=2, oddly_breakable_by_hand=3, not_in_creative_inventory = 1},
	drop = "test:node_1",
		on_dig = function(pos, node, player)
   minetest.set_node({x = pos.x , y = pos.y - 1, z = pos.z}, {name = "air"}) 
   minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "air"}) 
   end,
	drawtype = "nodebox",
	paramtype = "light",
	light_source =  14,
    drop = 'ma_pops_furniture:lamp_2_off',
	on_rightclick = function (pos, node, player, itemstack, pointed_thing)
   node.name = "ma_pops_furniture:lamp_2_off"
   minetest.set_node(pos, node)
   end,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.0625, -0.375, 0.375, 0.5, 0.375}, -- NodeBox16
			{-0.0625, -0.5, -0.0625, 0.0625, 0.1875, 0.0625}, -- NodeBox17
		}
	}
})

minetest.register_node("ma_pops_furniture:lamp_2_off", {
        description = "lamp2",
        	tiles = {
		"mp_lt.png",
		"mp_lt.png",
		"default_stone.png^mp_ls_top.png",
		"default_stone.png^mp_ls_top.png",
		"default_stone.png^mp_ls_top.png",
		"default_stone.png^mp_ls_top.png"
	},
	groups = {cracky=2, oddly_breakable_by_hand=3, not_in_creative_inventory = 1},
	drop = "test:node_1",
		on_dig = function(pos, node, player)
   minetest.set_node({x = pos.x , y = pos.y - 1, z = pos.z}, {name = "air"}) 
   minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "air"}) 
   end,
	drawtype = "nodebox",
	paramtype = "light",
	on_rightclick = function (pos, node, player, itemstack, pointed_thing)
   node.name = "ma_pops_furniture:lamp_2_on"
   minetest.set_node(pos, node)
   end,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.0625, -0.375, 0.375, 0.5, 0.375}, -- NodeBox16
			{-0.0625, -0.5, -0.0625, 0.0625, 0.1875, 0.0625}, -- NodeBox17
		}
		}
})