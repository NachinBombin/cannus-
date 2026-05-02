AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.Model = {"models/animalia/teh/birdsshit.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.MoveCollideType = nil
ENT.CollisionGroupType = nil
ENT.SolidType = SOLID_VPHYSICS
ENT.DecalTbl_DeathDecals = {"BirdPoop"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitializeBeforePhys()
	self:PhysicsInitSphere(5, "metal_bouncy")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:SetMass(1)
	phys:EnableGravity(true)
	phys:EnableDrag(false)
	phys:SetBuoyancyRatio(0)
	phys:AddAngleVelocity(Vector(0,math.random(300,400),0))
end
