AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/orca.mdl"}
ENT.StartHealth = 600
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 1
ENT.PlayerFriendly = true
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 1
ENT.FriendsWithAllPlayerAllies = false
ENT.TurningUseAllAxis = true
ENT.TurningSpeed = 3
ENT.MovementType = VJ_MOVETYPE_AQUATIC
ENT.Aquatic_SwimmingSpeed_Calm = 150
ENT.Aquatic_SwimmingSpeed_Alerted = 650
ENT.Aquatic_AnimTbl_Calm = ACT_WALK
ENT.Aquatic_AnimTbl_Alerted = ACT_RUN
ENT.IdleAlwaysWander = true
ENT.BloodColor = "Red"
ENT.HasBloodDecal = false
ENT.AA_MinWanderDist = 1000
ENT.SightDistance = 2000
ENT.HasImpactSounds = false
ENT.CanOpenDoors = false
ENT.VJ_IsHugeMonster = true

ENT.HasMeleeAttack = true
ENT.MeleeAttackDamage = 49
ENT.TimeUntilMeleeAttackDamage = 0.8
ENT.MeleeAttackDistance = 60
ENT.MeleeAttackDamageDistance = 100
ENT.MeleeAttackDamageAngleRadius = 70
ENT.SoundTbl_BeforeMeleeAttack = {"animalia/orca/a1.wav","animalia/orca/i6.wav","animalia/orca/p1.wav","animalia/orca/p2.wav","animalia/orca/p3.wav","animalia/orca/p4.wav","animalia/orca/p5.wav","animalia/orca/p6.wav","animalia/orca/p7.wav"}
ENT.SoundTbl_MeleeAttack = {"animalia/sharkbite1.wav","animalia/sharkbite2.wav","animalia/sharkbite3.wav"}
ENT.MeleeAttackSoundLevel = 50
ENT.BeforeMeleeAttackSoundChance = 2

ENT.SoundTbl_Idle = {"animalia/orca/i1.wav","animalia/orca/i2.wav","animalia/orca/i3.wav","animalia/orca/i4.wav","animalia/orca/i5.wav","animalia/orca/i6.wav","animalia/orca/a1.wav","animalia/orca/a2.wav","animalia/orca/p2.wav","animalia/orca/p4.wav","animalia/orca/p6.wav","animalia/orca/p7.wav"}
ENT.SoundTbl_Pain = {"animalia/orca/a1.wav","animalia/orca/i4.wav","animalia/orca/i5.wav","animalia/orca/i6.wav","animalia/orca/p1.wav","animalia/orca/p2.wav","animalia/orca/p3.wav","animalia/orca/p4.wav","animalia/orca/p5.wav","animalia/orca/p6.wav","animalia/orca/p7.wav"}
ENT.SoundTbl_Death = {"animalia/orca/a1.wav","animalia/orca/i6.wav","animalia/orca/p1.wav","animalia/orca/p2.wav","animalia/orca/p3.wav","animalia/orca/p4.wav","animalia/orca/p5.wav","animalia/orca/p7.wav"}
ENT.SoundTbl_Alert = {"animalia/orca/a1.wav","animalia/orca/a2.wav","animalia/orca/a3.wav","animalia/orca/i2.wav","animalia/orca/i4.wav","animalia/orca/i5.wav","animalia/orca/p3.wav","animalia/orca/p4.wav","animalia/orca/p5.wav","animalia/orca/p6.wav","animalia/orca/p7.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"animalia/orca/a1.wav","animalia/orca/a2.wav","animalia/orca/a3.wav","animalia/orca/i2.wav","animalia/orca/i4.wav","animalia/orca/i5.wav","animalia/orca/p3.wav","animalia/orca/p4.wav","animalia/orca/p5.wav","animalia/orca/p6.wav","animalia/orca/p7.wav"}
ENT.SoundTbl_AllyDeath = {"animalia/orca/a1.wav","animalia/orca/a2.wav","animalia/orca/a3.wav","animalia/orca/i2.wav","animalia/orca/i4.wav","animalia/orca/i5.wav","animalia/orca/p3.wav","animalia/orca/p4.wav","animalia/orca/p5.wav","animalia/orca/p6.wav","animalia/orca/p7.wav"}

ENT.Prop = 1
ENT.Hurt = 1

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(40, 40, 30), Vector(-40, -40, -30))
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
if self.Hurt == 1 && self:Health() > 90 then
self.Hurt = 0
self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
self.SoundTbl_CombatIdle = {"animalia/orca/a1.wav","animalia/orca/a2.wav","animalia/orca/a3.wav","animalia/orca/i2.wav","animalia/orca/i4.wav","animalia/orca/i5.wav","animalia/orca/i6.wav","animalia/orca/p2.wav","animalia/orca/p3.wav","animalia/orca/p4.wav","animalia/orca/p5.wav","animalia/orca/p6.wav","animalia/orca/p7.wav"}
elseif self.Hurt == 0 && self:Health() < 90 then
self.Hurt = 1
self.Behavior = VJ_BEHAVIOR_PASSIVE
self.SoundTbl_CombatIdle = {"animalia/orca/a1.wav","animalia/orca/i4.wav","animalia/orca/i5.wav","animalia/orca/i6.wav","animalia/orca/p1.wav","animalia/orca/p2.wav","animalia/orca/p3.wav","animalia/orca/p4.wav","animalia/orca/p5.wav","animalia/orca/p6.wav","animalia/orca/p7.wav"}
end
end