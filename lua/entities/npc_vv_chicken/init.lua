AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/chicken.mdl"}
ENT.StartHealth = 10
ENT.Behavior = VJ_BEHAVIOR_PASSIVE
ENT.BloodColor = "Red"
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = true
ENT.FollowPlayer = false
ENT.AnimTbl_Walk = {ACT_WALK,ACT_WALK,ACT_WALK,ACT_RUN}
ENT.AllowMovementJumping = true
ENT.MaxJumpLegalDistance = VJ_Set(100, 100)
ENT.BloodDecalDistance = 1
ENT.CanOpenDoors = false

ENT.SoundTbl_Idle = {"animalia/chicken/i1.wav","animalia/chicken/i2.wav","animalia/chicken/i3.wav","animalia/chicken/i4.wav","animalia/chicken/i5.wav","animalia/chicken/i6.wav","animalia/chicken/i7.wav","animalia/chicken/i8.wav"}
ENT.SoundTbl_Pain = {"animalia/chicken/d1.wav","animalia/chicken/d2.wav","animalia/chicken/d3.wav","animalia/chicken/d4.wav","animalia/chicken/d5.wav","animalia/chicken/d6.wav","animalia/chicken/d7.wav"}
ENT.SoundTbl_Death = {"animalia/chicken/d1.wav","animalia/chicken/d2.wav","animalia/chicken/d3.wav","animalia/chicken/d4.wav","animalia/chicken/d5.wav","animalia/chicken/d6.wav","animalia/chicken/d7.wav"}
ENT.SoundTbl_Alert = {"animalia/chicken/a1.wav","animalia/chicken/a2.wav","animalia/chicken/a3.wav","animalia/chicken/a4.wav","animalia/chicken/a5.wav","animalia/chicken/a6.wav","animalia/chicken/a7.wav"}

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(10, 10, 15), Vector(-10, -10, 0))
self:SetSkin(math.random(0,3))
end