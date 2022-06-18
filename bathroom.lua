minetest.register_node("ma_pops_furniture:bath_faucet", {
   description = "Bathroom Faucet",
   tiles = {
		"mp_knob_top.png",
		"mp_knob_bottom.png",
		"mp_knob_right.png",
		"mp_knob_left.png",
		"mp_knob_back.png",
		"mp_knob_front.png"
	},
   drawtype = "nodebox",
   paramtype = "light",
   paramtype2 = "facedir",
   groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
   node_box = {
       type = "fixed",
       fixed = {
			{-0.0625, -0.5, 0.3125, 0.0625, -0.1875, 0.4375},
			{-0.0625, -0.1875, 0.125, 0.0625, -0.125, 0.4375}, 
			{0.125, -0.25, 0.25, 0.25, -0.0625, 0.4375},
			{-0.25, -0.25, 0.25, -0.125, -0.0625, 0.4375},
			{-0.0625, -0.25, 0.125, 0.0625, -0.125, 0.1875},
			{-0.125, -0.1875, 0.3125, 0.125, -0.125, 0.375},
       },
   }
})

minetest.register_node("ma_pops_furniture:toilet_paper_roll_dispenser", {
   description = "Toilet Paper Roll Dispenser",
   tiles = {
		"mp_tp_top.png",
		"mp_tp_bottom.png",
		"mp_tp_right.png",
		"mp_tp_left.png",
		"mp_tp_back.png",
		"mp_tp_front.png"
	},
   drawtype = "nodebox",
   paramtype = "light",
   paramtype2 = "facedir",
   groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
   node_box = {
       type = "fixed",
       fixed = {
          {-0.3125, -0.1875, 0.4375, 0.3125, 0.125, 0.5},
		  {-0.1875, -0.125, 0.25, 0.1875, 0.0625, 0.4375},
		  {-0.25, -0.0625, 0.3125, 0.25, 0, 0.5},
       },
   }
})


minetest.register_node("ma_pops_furniture:br_sink", {
   description = "Sink (Bathroom)",
   tiles = {
		"mp_hw_top.png",
		"mp_hw_bottom.png",
		"mp_hw_right.png",
		"mp_hw_left.png",
		"mp_hw_back.png",
		"mp_hw_front.png"
	},
   drawtype = "nodebox",
   paramtype = "light",
   paramtype2 = "facedir",
   groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
   node_box = {
       type = "fixed",
       fixed = {
         {-0.4375, 0.25, -0.3125, 0.4375, 0.5, 0.5},
		 {-0.125, -0.5, 0.125, 0.125, 0.25, 0.4375},
       },
   }
})

minetest.register_node("ma_pops_furniture:shower_base", {
   description = "Shower Base",
   tiles = {
		"mp_showbas_top.png",
		"mp_showbas_top.png",
		"mp_showbas_sides.png",
		"mp_showbas_sides.png",
		"mp_showbas_sides.png",
		"mp_showbas_sides.png"
	},
   drawtype = "nodebox",
   paramtype = "light",
   paramtype2 = "facedir",
   groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
   node_box = {
       type = "fixed",
       fixed = {
          {-0.4375, -0.5, -0.4375, 0.4375, -0.4375, 0.4375}, 
		  {0.4375, -0.5, -0.5, 0.5, -0.3125, 0.5}, 
		  {-0.5, -0.5, 0.4375, 0.5, -0.3125, 0.5},
		  {-0.5, -0.5, -0.5, -0.4375, -0.3125, 0.5}, 
		  {-0.5, -0.5, -0.5, 0.5, -0.3125, -0.4375}, 
		  {-0.125, -0.5, 0.125, 0.125, -0.375, 0.375},
       }
    },
})

minetest.register_node("ma_pops_furniture:shower_top", {
   description = "Shower Head",
   tiles = {
		"mp_shk_top.png",
		"mp_shk_bottom.png",
		"mp_shk_right.png",
		"mp_shk_left.png",
		"mp_shk_back.png",
		"mp_shk_front.png"
	},
   drawtype = "nodebox",
   paramtype = "light",
   paramtype2 = "facedir",
   groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
   node_box = {
       type = "fixed",
       fixed = {
          {-0.25, -0.5, 0.4375, 0.25, 0.5, 0.5},
		  {-0.125, 0.3125, -0.1875, 0.125, 0.4375, 0.25},
		  {-0.1875, -0.25, 0.375, -0.125, -0.1875, 0.4375},
		  {0.125, -0.25, 0.375, 0.1875, -0.1875, 0.4375},
		  {-0.1875, -0.25, 0.3125, -0.125, -0.0625, 0.375}, 
		  {0.125, -0.25, 0.3125, 0.1875, -0.0625, 0.375}, 
		  {-0.0625, 0.375, 0.25, 0.0625, 0.4375, 0.4375}, 
        },
    }
})

minetest.register_node('ma_pops_furniture:br_tile', {
	description = 'Bathroom Tile',
	drawtype = 'nodebox',
	tiles = {
		"mp_bathroom_tile.png"
	},
	groups = {cracky=2, oddly_breakable_by_hand=5, furniture=1},
	paramtype = 'light',
	sounds = moditems.WOOD_SOUNDS,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	}
})