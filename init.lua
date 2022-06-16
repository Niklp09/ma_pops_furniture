ma_pops_furniture = {}

--GreenDimond's code from waffle mod
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

ma_pops_furniture.intllib = S
dofile(minetest.get_modpath('ma_pops_furniture')..'/intllib.lua')

moditems = {}  -- switcher

moditems.IRON_ITEM = "default:steel_ingot"    -- MTG iron ingot
moditems.COAL_ITEM = "default:coalblock"      -- MTG coal block
moditems.CORAL_SKELETON = "default:coral_skeleton" -- MCL version of green dye
moditems.SILVER_SANDSTONE = "default:silver_sandstone" -- MCL version of green dye
moditems.INVENTORY = "default:silver_sandstone" -- MCL version of green dye
moditems.INFOBOX_CAN = "Trash Can"
moditems.INFOBOX_DUMP = "Dumpster"
moditems.BOXART = ""

-- actual use in the code down somewhere.
material = moditems.IRON_ITEM 
sounds = moditems.WOOD_SOUNDS

_doc_items_longdesc = moditems.STRING_ITEM

local sounds


if default.node_sound_metal_defaults then
    sounds = default.node_sound_metal_defaults()
else
    sounds = default.node_sound_stone_defaults()
end

dofile(minetest.get_modpath('ma_pops_furniture')..'/bathroom.lua')
dofile(minetest.get_modpath('ma_pops_furniture')..'/bedroom.lua')
dofile(minetest.get_modpath('ma_pops_furniture')..'/kitchen.lua')
dofile(minetest.get_modpath('ma_pops_furniture')..'/living_room.lua')
dofile(minetest.get_modpath('ma_pops_furniture')..'/dining_room.lua')
dofile(minetest.get_modpath('ma_pops_furniture')..'/outside.lua')
dofile(minetest.get_modpath('ma_pops_furniture')..'/misc.lua')
dofile(minetest.get_modpath('ma_pops_furniture')..'/oven.lua')
dofile(minetest.get_modpath('ma_pops_furniture')..'/functions.lua')
dofile(minetest.get_modpath('ma_pops_furniture')..'/fridge.lua')
dofile(minetest.get_modpath('ma_pops_furniture')..'/crafts.lua')