AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/gazelle.mdl","models/animalia/gazelle_female.mdl"}
ENT.StartHealth = 30
ENT.Behavior = VJ_BEHAVIOR_PASSIVE
ENT.BloodColor = "Red"
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = true
ENT.FollowPlayer = false
ENT.AnimTbl_Walk = {ACT_WALK,ACT_WALK,ACT_WALK,ACT_RUN}
ENT.AllowMovementJumping = true
ENT.MaxJumpLegalDistance = VJ_Set(120, 120)
ENT.CanOpenDoors = false
ENT.SightDistance = 1500
ENT.CallForHelp = false
ENT.SightAngle = 180

ENT.SoundTbl_Idle = {"animalia/impala/i1.wav","animalia/impala/i2.wav","animalia/impala/i3.wav","animalia/impala/i4.wav","animalia/impala/i5.wav","animalia/impala/i6.wav"}
ENT.SoundTbl_Pain = {"animalia/impala/a1.wav","animalia/impala/a2.wav","animalia/impala/a3.wav","animalia/impala/a4.wav","animalia/impala/a5.wav","animalia/impala/a6.wav","animalia/impala/a7.wav","animalia/impala/a8.wav"}
ENT.SoundTbl_Death = {"animalia/impala/a4.wav","animalia/impala/a5.wav","animalia/impala/a6.wav","animalia/impala/a7.wav","animalia/impala/a8.wav"}
ENT.SoundTbl_Alert = {"animalia/impala/a1.wav","animalia/impala/a2.wav","animalia/impala/a3.wav","animalia/impala/a4.wav","animalia/impala/a5.wav","animalia/impala/a6.wav","animalia/impala/a7.wav","animalia/impala/a8.wav"}
ENT.SoundTbl_FootStep = {"animalia/step/hoof1.wav","animalia/step/hoof2.wav","animalia/step/hoof3.wav","animalia/step/hoof4.wav"}
ENT.FootStepTimeWalk = 0.3
ENT.FootStepTimeRun = 0.4
ENT.FootStepSoundLevel = 50

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(15, 15, 40), Vector(-15, -15, 0))
end

function ENT:CustomOnThink()   	           
local nearby = ents.FindInSphere(self:GetPos(),1500) 
for k,v in pairs(nearby) do 	    
if self:Disposition(v) == 1 || (v:IsPlayer() && GetConVarNumber("ai_ignoreplayers") == 0) then 		
self:AddEntityRelationship(player.GetByID(1), D_FR, 99 )  
end
end
end