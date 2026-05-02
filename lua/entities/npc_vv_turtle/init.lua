AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/turtle.mdl"}
ENT.StartHealth = 150
ENT.Behavior = VJ_BEHAVIOR_PASSIVE_NATURE
ENT.BloodColor = "Red"
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = true
ENT.FollowPlayer = false
ENT.CanOpenDoors = false
ENT.SightDistance = 100
ENT.CallForHelp = false
ENT.Aquatic_SwimmingSpeed_Calm = 50
ENT.Aquatic_SwimmingSpeed_Alerted = 100
ENT.Aquatic_AnimTbl_Calm = {"swim"}
ENT.Aquatic_AnimTbl_Alerted = {"swim"}
ENT.TurningSpeed = 2

ENT.SoundTbl_Pain = {"animalia/turtle/p1.wav","animalia/turtle/p2.wav"}
ENT.SoundTbl_Death = {"animalia/turtle/p1.wav","animalia/turtle/p2.wav"}
ENT.SoundTbl_FootStep = {"animalia/turtle/f1.wav","animalia/turtle/f2.wav"}
ENT.IdleSoundChance = 2
ENT.PainSoundChance = 2
ENT.FootStepTimeWalk = 1.5
ENT.FootStepTimeRun = 1.5
ENT.FootStepSoundLevel = 60
ENT.PainSoundLevel = 300
ENT.DeathSoundLevel = 300
ENT.HasImpactSounds = false

function ENT:CustomOnInitialize()
       self:SetSkin(math.random(0,4))
	if self:WaterLevel() > 0 then 
	self.MovementType = VJ_MOVETYPE_AQUATIC
	self.AnimTbl_IdleStand = {"swimidle"}
	self.SoundTbl_Idle = {}
	self.TurningUseAllAxis = true
        self.IdleAlwaysWander = true
        self:SetCollisionBounds(Vector(7, 7, 7), Vector(-7, -7, -7))
	else
	self.MovementType = VJ_MOVETYPE_GROUND
	self.AnimTbl_IdleStand = {ACT_IDLE}
	self.SoundTbl_Idle = {"animalia/turtle/i1.wav","animalia/turtle/i2.wav"}
	self.TurningUseAllAxis = false
        self.IdleAlwaysWander = false
        self:SetCollisionBounds(Vector(20, 20, 15), Vector(-20, -20, 0))
end
end

function ENT:CustomOnThink()
-- Animation code
if not self.NextAnimTime then
    self.NextAnimTime = CurTime() + math.random(20,40)
end
if CurTime() >= self.NextAnimTime && self:WaterLevel() == 0 then
    self:VJ_ACT_PLAYACTIVITY({ACT_IDLE},true,false,false)
    self.NextAnimTime = CurTime() + math.random(20,40)
end
end