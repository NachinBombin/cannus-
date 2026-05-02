AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/fish/great_white.mdl"}
ENT.StartHealth = 260
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 1
ENT.TurningUseAllAxis = true
ENT.TurningSpeed = 3
ENT.MovementType = VJ_MOVETYPE_AQUATIC
ENT.Aquatic_SwimmingSpeed_Calm = 120
ENT.Aquatic_SwimmingSpeed_Alerted = 400
ENT.Aquatic_AnimTbl_Calm = ACT_WALK
ENT.Aquatic_AnimTbl_Alerted = ACT_RUN
ENT.IdleAlwaysWander = true
ENT.BloodColor = "Red"
ENT.HasBloodDecal = false
ENT.AA_MinWanderDist = 1000
ENT.SightDistance = 800
ENT.HasImpactSounds = false
ENT.CanOpenDoors = false
ENT.VJ_NPC_Class = {"CLASS_BIG_SHARKS"}
ENT.VJ_IsHugeMonster = true

ENT.HasMeleeAttack = true
ENT.MeleeAttackDamage = 39
ENT.TimeUntilMeleeAttackDamage = 0.7
ENT.MeleeAttackDistance = 75
ENT.MeleeAttackDamageDistance = 130
ENT.MeleeAttackDamageAngleRadius = 70
ENT.SoundTbl_MeleeAttack = {"animalia/sharkbite1.wav","animalia/sharkbite2.wav","animalia/sharkbite3.wav"}
ENT.MeleeAttackSoundLevel = 50

ENT.Prop = 1

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(50, 50, 30), Vector(-50, -50, -30))
self:SetSkin(math.random(0,3))
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
if self:Health() > 90 then
self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
elseif self:Health() < 90 then
self.Behavior = VJ_BEHAVIOR_PASSIVE
end
end