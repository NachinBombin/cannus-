AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/crow.mdl"}
ENT.StartHealth = 99999
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 99999
ENT.Behavior = VJ_BEHAVIOR_PASSIVE
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = true
ENT.FollowPlayer = true
ENT.CanOpenDoors = true

ENT.GodMode = true -- Immune to everything
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
ENT.Immune_Bullet = true -- Immune to bullet type damages
ENT.Immune_Blast = true -- Immune to explosive-type damages
ENT.Immune_Dissolve = true -- Immune to dissolving | Example: Combine Ball
ENT.Immune_Electricity = true -- Immune to electrical-type damages | Example: shock or laser
ENT.Immune_Fire = true -- true to fire-type damages
ENT.Immune_Melee = true -- true to melee-type damage | Example: Crowbar, slash damages
ENT.Immune_Physics = true -- Immune to physics impacts, won't take damage from props
ENT.Immune_Sonic = true -- Immune to sonic-type damages

ENT.SoundTbl_Death = {"music/hl2_song7.mp3","music/hl1_song14.mp3","music/hl1_song3.mp3","music/hl1_song5.mp3","music/hl2_song11.mp3","music/hl2_song13.mp3","music/hl2_song17.mp3","music/hl2_song26_trainstation1.mp3","music/radio1.mp3","music/hl2_song7.mp3","music/stingers/hl1_stinger_song16.mp3","music/stingers/hl1_stinger_song27.mp3","music/stingers/hl1_stinger_song7.mp3"}
ENT.SoundTbl_FollowPlayer = {"music/hl2_song7.mp3","music/hl1_song14.mp3","music/hl1_song3.mp3","music/hl1_song5.mp3","music/hl2_song11.mp3","music/hl2_song13.mp3","music/hl2_song17.mp3","music/hl2_song26_trainstation1.mp3","music/radio1.mp3","music/hl2_song7.mp3","music/stingers/hl1_stinger_song16.mp3","music/stingers/hl1_stinger_song27.mp3","music/stingers/hl1_stinger_song7.mp3"} -- Уничтожь всех идиотов пока не стало поздно
ENT.SoundTbl_UnFollowPlayer = {"music/hl2_song7.mp3","music/hl1_song14.mp3","music/hl1_song3.mp3","music/hl1_song5.mp3","music/hl2_song11.mp3","music/hl2_song13.mp3","music/hl2_song17.mp3","music/hl2_song26_trainstation1.mp3","music/radio1.mp3","music/hl2_song7.mp3","music/stingers/hl1_stinger_song16.mp3","music/stingers/hl1_stinger_song27.mp3","music/stingers/hl1_stinger_song7.mp3"}

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(10, 10, 10), Vector(-10, -10, 0))
self:SetSkin(math.random(0,99))
end

function ENT:CreateDeathCorpse(dmginfo,hitgroup)
	local gib = ents.Create( "secretyou" )
	gib:SetPos( self:LocalToWorld(Vector(0,0,0)))
	gib:SetAngles( self:GetAngles() )
	gib:Spawn()
	end