AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/cockroach.mdl"}
ENT.StartHealth = 1
ENT.Behavior = VJ_BEHAVIOR_PASSIVE_NATURE
ENT.HasDeathRagdoll = true
ENT.DeathCorpseSetBodyGroup = true 
ENT.DeathCorpseBodyGroup = VJ_Set(0,1)
ENT.CustomBlood_Decal = {"Impact.Antlion"}
ENT.SoundTbl_Death = {"animalia/insectdeath1.wav","animalia/insectdeath2.wav","animalia/insectdeath3.wav"}
ENT.DeathSoundLevel = 30
ENT.HasImpactSounds = false
ENT.TurningSpeed = 20
ENT.CanOpenDoors = false
ENT.DeathCorpseSetBoneAngles = false
ENT.DeathCorpseApplyForce = false

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(1, 1, 1), Vector(-1, -1, 0))
self:SetSkin(0)
end

function ENT:CustomOnTouch(ent)
	if ent:IsPlayer() or ent:IsNPC() then
		self:TakeDamage(self:Health() + 1, ent, ent)
	end
end

function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Finish" then
		self:SetBodygroup(0, 1)
	end
end