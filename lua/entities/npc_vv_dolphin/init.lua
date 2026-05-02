AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/dolphin.mdl"}
ENT.StartHealth = 130
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 1
ENT.TurningUseAllAxis = true
ENT.TurningSpeed = 6
ENT.MovementType = VJ_MOVETYPE_AQUATIC
ENT.Aquatic_SwimmingSpeed_Calm = 400
ENT.Aquatic_SwimmingSpeed_Alerted = 2000
ENT.Aquatic_AnimTbl_Calm = ACT_WALK
ENT.Aquatic_AnimTbl_Alerted = ACT_RUN
ENT.IdleAlwaysWander = true
ENT.BloodColor = "Red"
ENT.HasBloodDecal = false
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = true
ENT.FollowPlayer = false
ENT.Behavior = VJ_BEHAVIOR_PASSIVE
ENT.AA_MinWanderDist = 1000
ENT.HasImpactSounds = false
ENT.CanOpenDoors = false
ENT.VJ_NPC_Class = {"CLASS_SHARKS","CLASS_BIG_SHARKS"}
ENT.CallForHelp = false

ENT.Prop = 1

ENT.SoundTbl_Idle = {"animalia/dolphin/i1.wav","animalia/dolphin/i2.wav","animalia/dolphin/i3.wav","animalia/dolphin/i4.wav","animalia/dolphin/i5.wav","animalia/dolphin/i6.wav","animalia/dolphin/i7.wav","animalia/dolphin/i8.wav","animalia/dolphin/i9.wav","animalia/dolphin/i10.wav","animalia/dolphin/i11.wav","animalia/dolphin/i12.wav","animalia/dolphin/i13.wav","animalia/dolphin/a1.wav","animalia/dolphin/a2.wav","animalia/dolphin/a3.wav","animalia/dolphin/a4.wav","animalia/dolphin/a5.wav","animalia/dolphin/a6.wav"}
ENT.SoundTbl_Pain = {"animalia/dolphin/d1.wav","animalia/dolphin/d2.wav","animalia/dolphin/d3.wav","animalia/dolphin/d4.wav","animalia/dolphin/d5.wav","animalia/dolphin/d6.wav","animalia/dolphin/d7.wav"}
ENT.SoundTbl_Death = {"animalia/dolphin/d1.wav","animalia/dolphin/d2.wav","animalia/dolphin/d3.wav","animalia/dolphin/d4.wav","animalia/dolphin/d5.wav","animalia/dolphin/d6.wav","animalia/dolphin/d7.wav"}
ENT.SoundTbl_Alert = {"animalia/dolphin/a1.wav","animalia/dolphin/a2.wav","animalia/dolphin/a3.wav","animalia/dolphin/a4.wav","animalia/dolphin/a5.wav","animalia/dolphin/a6.wav","animalia/dolphin/d6.wav","animalia/dolphin/d7.wav","animalia/dolphin/i4.wav","animalia/dolphin/i5.wav","animalia/dolphin/i8.wav","animalia/dolphin/i10.wav"}
ENT.SoundTbl_AllyDeath = {"animalia/dolphin/a1.wav","animalia/dolphin/a2.wav","animalia/dolphin/a3.wav","animalia/dolphin/a4.wav","animalia/dolphin/a5.wav","animalia/dolphin/a6.wav","animalia/dolphin/d6.wav","animalia/dolphin/d7.wav","animalia/dolphin/i4.wav","animalia/dolphin/i5.wav","animalia/dolphin/i8.wav","animalia/dolphin/i10.wav"}

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(30, 30, 30), Vector(-30, -30, -20))
end

function ENT:CustomOnThink()
if self.Prop == 1 && self:WaterLevel() == 0 then
self.Prop = 0
self.AnimTbl_IdleStand = {"ragdoll"}
 self:PhysicsInit( SOLID_BBOX )
 self:SetMoveType( MOVETYPE_VPHYSICS )
 self:SetPos(self:GetPos() + Vector(0,0,0))
 self.HasBloodDecal = true
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass(150)
	end
	local phys_fix = self.Entity:GetPhysicsObject()
	if phys_fix:IsValid() && phys_fix:GetVelocity():Length() < 5 then
		phys_fix:AddVelocity(self:GetUp():GetNormal()*-150)
	end
elseif self.Prop == 0 && self:WaterLevel() > 0 then
self.Prop = 1
self.AnimTbl_IdleStand = {"idle"}
 self:SetMoveType(VJ_MOVETYPE_AQUATIC)
end
end