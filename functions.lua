function ma_pops_furniture.sit(pos, node, clicker)
	local meta = minetest.get_meta(pos)
	local param2 = node.param2
	local sitting = meta:get_string("is_sit")
	local name = clicker:get_player_name()

	if sitting == name then
		meta:set_string("is_sit", "")
		pos.y = pos.y-0.5
		clicker:setpos(pos)
		clicker:set_eye_offset({x=0,y=0,z=0}, {x=0,y=0,z=0})
		clicker:set_physics_override(1, 1, 1)
		default.player_attached[name] = false
		default.player_set_animation(clicker, "stand", 30)
	elseif sitting == "" and not default.player_attached[name] then
		meta:set_string("is_sit", clicker:get_player_name())
		clicker:setpos(pos)
		clicker:set_eye_offset({x=0,y=-7,z=2}, {x=0,y=0,z=0})
		clicker:set_physics_override(0, 0, 0)
		default.player_attached[name] = true
		default.player_set_animation(clicker, "sit", 30)
		if param2 == 0 then
			clicker:set_look_yaw(3.15)
		elseif param2 == 1 then
			clicker:set_look_yaw(7.9)
		elseif param2 == 2 then
			clicker:set_look_yaw(6.28)
		elseif param2 == 3 then
			clicker:set_look_yaw(4.75)
		end
	end
end

function ma_pops_furniture.dig_chair(pos, node, meta, digger)
	local sitting = meta.fields.is_sit or nil

	if sitting and sitting ~= "" then
		local player = minetest.get_player_by_name(sitting)
		pos.y = pos.y-0.5
		player:set_eye_offset({x=0,y=0,z=0}, {x=0,y=0,z=0})
		player:set_physics_override(1, 1, 1)
		default.player_attached[sitting] = false
		default.player_set_animation(player, "stand", 30)
	end
end

ma_pops_furniture.window_operate = function( pos, old_node_state_name, new_node_state_name )
   
   local offsets   = {-1,1,-2,2,-3,3};
   local stop_up   = 0;
   local stop_down = 0;

   for i,v in ipairs(offsets) do

      local node = minetest.env:get_node_or_nil( {x=pos.x, y=(pos.y+v), z=pos.z } );
      if( node and node.name and node.name==old_node_state_name 
        and ( (v > 0 and stop_up   == 0 ) 
           or (v < 0 and stop_down == 0 ))) then

         minetest.env:add_node({x=pos.x, y=(pos.y+v), z=pos.z }, {name = new_node_state_name, param2 = node.param2})

      -- found a diffrent node - no need to search further up
      elseif( v > 0 and stop_up   == 0 ) then
         stop_up   = 1; 

      elseif( v < 0 and stop_down == 0 ) then
         stop_down = 1; 
      end
   end
end
