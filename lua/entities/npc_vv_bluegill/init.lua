AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/fish/riverfish.mdl"}
ENT.StartHealth = 3
ENT.TurningUseAllAxis = true
ENT.TurningSpeed = 12
ENT.MovementType = VJ_MOVETYPE_AQUATIC
ENT.Aquatic_SwimmingSpeed_Calm = 40
ENT.Aquatic_SwimmingSpeed_Alerted = 900
ENT.Aquatic_AnimTbl_Calm = {"idle"}
ENT.Aquatic_AnimTbl_Alerted = {"idle"}
ENT.IdleAlwaysWander = true
ENT.BloodColor = "Red"
ENT.EntitiesToNoCollide = {"npc_vv_bluegill"}
ENT.HasBloodDecal = false
ENT.BloodDecalDistance = 1
ENT.BloodDecalUseGMod = true
ENT.Behavior = VJ_BEHAVIOR_PASSIVE_NATURE
ENT.HasImpactSounds = false
ENT.CanOpenDoors = false
ENT.SightDistance = 600
ENT.CallForHelp = false

ENT.Prop = 1

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(3, 3, 3), Vector(-3, -3, -3))
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
		phys:SetMass(50)
	end
	local phys_fix = self.Entity:GetPhysicsObject()
	if phys_fix:IsValid() && phys_fix:GetVelocity():Length() < 5 then
		phys_fix:AddVelocity(self:GetUp():GetNormal()*-200)
	end
elseif self.Prop == 0 && self:WaterLevel() > 0 then
self.Prop = 1
self.AnimTbl_IdleStand = {"idle"}
self:SetMoveType(VJ_MOVETYPE_AQUATIC)
end
local nearby = ents.FindInSphere(self:GetPos(),600) 
for k,v in pairs(nearby) do 	    
if self:Disposition(v) == 1 || (v:IsPlayer() && GetConVarNumber("ai_ignoreplayers") == 0) then 		
self:AddEntityRelationship(player.GetByID(1), D_FR, 99 )  
end
end
end