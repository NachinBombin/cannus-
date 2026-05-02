/*--------------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

ENT.Base 		= "obj_vj_spawner_base"
ENT.Type 		= "anim"
ENT.PrintName 		= "Lion"
ENT.Category		= "Animals"
ENT.Author 		= "vladvoron"
---------------------------------------------------------------------------------------------------------------------------------------------

ENT.SingleSpawner = true -- If set to true, it will spawn the entities once then remove itself
ENT.EntitiesToSpawn = {
	{SpawnPosition = {vForward=0, vRight=0, vUp=0}, Entities = {"npc_vv_lionm","npc_vv_lionf"}},
}