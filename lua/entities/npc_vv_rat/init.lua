AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/rat.mdl"}
ENT.StartHealth = 3
ENT.Behavior = VJ_BEHAVIOR_PASSIVE
ENT.BloodColor = "Red"
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = true
ENT.FollowPlayer = false
ENT.AnimTbl_Walk = {ACT_RUN}
ENT.BloodDecalDistance = 1
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {"idle"}
ENT.DeathAnimationTime = 0.1
ENT.CanOpenDoors = false
ENT.SightDistance = 600
ENT.CallForHelp = false

ENT.SoundTbl_Idle = {"animalia/rat/i1.wav","animalia/rat/i2.wav","animalia/rat/i3.wav","animalia/rat/s1.wav","animalia/rat/s2.wav","animalia/rat/s3.wav"}
ENT.SoundTbl_Pain = {"animalia/rat/s1.wav","animalia/rat/s2.wav","animalia/rat/s3.wav"}
ENT.SoundTbl_Death = {"animalia/rat/d1.wav","animalia/rat/d2.wav","animalia/rat/d3.wav","animalia/rat/s1.wav","animalia/rat/s2.wav","animalia/rat/s3.wav"}
ENT.SoundTbl_Alert = {"animalia/rat/a1.wav","animalia/rat/s1.wav","animalia/rat/s2.wav","animalia/rat/s3.wav"}

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(4, 4, 4), Vector(-4, -4, 0))
self:SetSkin(math.random(0,1))
end

function ENT:CustomOnThink()   	           
local nearby = ents.FindInSphere(self:GetPos(),600) 
for k,v in pairs(nearby) do 	    
if self:Disposition(v) == 1 || (v:IsPlayer() && GetConVarNumber("ai_ignoreplayers") == 0) then 		
self:AddEntityRelationship(player.GetByID(1), D_FR, 99 )  
end
end
end