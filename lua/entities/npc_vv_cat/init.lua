AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/cat.mdl"}
ENT.StartHealth = 20
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 1
ENT.Behavior = VJ_BEHAVIOR_PASSIVE
ENT.BloodColor = "Red"
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = true
ENT.FollowPlayer = true
ENT.AllowMovementJumping = true
ENT.MaxJumpLegalDistance = VJ_Set(100, 100)
ENT.BloodDecalDistance = 1
ENT.CanOpenDoors = false
ENT.IdleSoundChance = 2
ENT.AlertSoundChance = 2
ENT.AnimTbl_IdleStand = {"idle1","idle1","idle1","idle1","idle1","idle1","idle2","idle3","sitting"}

ENT.SoundTbl_Idle = {"animalia/cat/i1.wav","animalia/cat/i2.wav","animalia/cat/i3.wav","animalia/cat/i4.wav"}
ENT.SoundTbl_Alert = {"animalia/cat/p6.wav","animalia/cat/p7.wav"}
ENT.SoundTbl_Pain = {"animalia/cat/p1.wav","animalia/cat/p2.wav","animalia/cat/p3.wav","animalia/cat/p4.wav","animalia/cat/p5.wav","animalia/cat/p6.wav","animalia/cat/p7.wav"}
ENT.SoundTbl_Death = {"animalia/cat/d1.wav","animalia/cat/d2.wav","animalia/cat/d3.wav","animalia/cat/d4.wav","animalia/cat/d5.wav","animalia/cat/d6.wav","animalia/cat/d7.wav"}
ENT.SoundTbl_FollowPlayer = {"animalia/cat/pur1.wav","animalia/cat/pur2.wav","animalia/cat/pur3.wav","animalia/cat/pur4.wav","animalia/cat/pur5.wav","animalia/cat/pur6.wav","animalia/cat/pur7.wav"}
ENT.SoundTbl_UnFollowPlayer = {"animalia/cat/pur1.wav","animalia/cat/pur2.wav","animalia/cat/pur3.wav","animalia/cat/pur4.wav","animalia/cat/pur5.wav","animalia/cat/pur6.wav","animalia/cat/pur7.wav"}

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(10, 10, 14), Vector(-10, -10, 0))
self:SetSkin(math.random(0,2))
end

