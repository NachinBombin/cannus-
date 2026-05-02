AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/fish/piranha.mdl"}
ENT.StartHealth = 3
ENT.TurningSpeed = 12
ENT.TurningUseAllAxis = true
ENT.MovementType = VJ_MOVETYPE_AQUATIC
ENT.Aquatic_SwimmingSpeed_Calm = 130
ENT.Aquatic_SwimmingSpeed_Alerted = 200
ENT.Aquatic_AnimTbl_Calm = {"swim2","swim"}
ENT.Aquatic_AnimTbl_Alerted = {"swim"}
ENT.IdleAlwaysWander = true
ENT.BloodColor = "Red"
ENT.SightDistance = 100
ENT.EntitiesToNoCollide = {"npc_vv_piranha"}
ENT.HasBloodDecal = false
ENT.BloodDecalDistance = 1
ENT.BloodDecalUseGMod = true
ENT.HasImpactSounds = false
ENT.CanOpenDoors = false

ENT.HasMeleeAttack = true
ENT.MeleeAttackDamage = 1
ENT.TimeUntilMeleeAttackDamage = 0.7
ENT.MeleeAttackDistance = 35
ENT.MeleeAttackDamageDistance = 35
ENT.PushProps = false
ENT.AttackProps = false

ENT.Prop = 1

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(3, 3, 3), Vector(-3, -3, -3))
end

function ENT:CustomOnThink()
if self.Prop == 1 && self:WaterLevel() == 0 then
self.Prop = 0
self.HasMeleeAttack = false
self.AnimTbl_IdleStand = {"idle"}
 self:PhysicsInit( SOLID_BBOX )
 self:SetMoveType( MOVETYPE_VPHYSICS )
 self:SetPos(self:GetPos() + Vector(0,0,0))
 self.HasBloodDecal = true
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass(50)
	end
	local phys_fix = self.Entity:GetPhysicsObject()
	if phys_fix:IsValid() && phys_fix:GetVelocity():Length() < 5 then
		phys_fix:AddVelocity(self:GetUp():GetNormal()*-150)
	end
elseif self.Prop == 0 && self:WaterLevel() > 0 then
self.Prop = 1
self.HasMeleeAttack = true
self.AnimTbl_IdleStand = {"swim2"}
 self:SetMoveType(VJ_MOVETYPE_AQUATIC)
end
end
