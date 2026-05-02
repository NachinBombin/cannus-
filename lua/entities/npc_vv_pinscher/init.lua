AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/npc_dog.mdl"}
ENT.StartHealth = 50
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 1
ENT.BloodColor = "Red"
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = true
ENT.FollowPlayer = true
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 1
ENT.CanOpenDoors = false
ENT.CanFlinch = 1
ENT.FlinchChance = 1
ENT.NextFlinchTime = 3
ENT.AnimTbl_Flinch = {ACT_FLINCH}

ENT.HasMeleeAttack = true
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDistance = 15
ENT.MeleeAttackDamageDistance = 40
ENT.MeleeAttackAngleRadius = 40
ENT.MeleeAttackDamageAngleRadius = 40
ENT.NextMeleeAttackTime = 0.38
ENT.TimeUntilMeleeAttackDamage = 0.45

ENT.SoundTbl_Idle = {"animalia/pinscher/i1.wav","animalia/pinscher/i2.wav","animalia/pinscher/i3.wav","animalia/pinscher/i4.wav","animalia/pinscher/i5.wav","animalia/pinscher/i6.wav"}
ENT.SoundTbl_CombatIdle = {"animalia/pinscher/ci1.wav","animalia/pinscher/ci2.wav","animalia/pinscher/ci3.wav","animalia/pinscher/ci4.wav","animalia/pinscher/ci5.wav","animalia/pinscher/ci6.wav","animalia/pinscher/ci7.wav","animalia/pinscher/ci8.wav"}
ENT.SoundTbl_Alert = {"animalia/pinscher/ci1.wav","animalia/pinscher/ci2.wav","animalia/pinscher/ci3.wav","animalia/pinscher/ci4.wav","animalia/pinscher/ci5.wav","animalia/pinscher/ci6.wav","animalia/pinscher/ci7.wav","animalia/pinscher/ci8.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"animalia/pinscher/ci1.wav","animalia/pinscher/ci2.wav","animalia/pinscher/ci3.wav","animalia/pinscher/ci4.wav","animalia/pinscher/ci5.wav","animalia/pinscher/ci6.wav","animalia/pinscher/ci7.wav","animalia/pinscher/ci8.wav"}
ENT.SoundTbl_FollowPlayer = {"animalia/pinscher/i1.wav","animalia/pinscher/i2.wav","animalia/pinscher/i3.wav","animalia/pinscher/i4.wav","animalia/pinscher/i5.wav","animalia/pinscher/i6.wav"}
ENT.SoundTbl_UnFollowPlayer = {"animalia/pinscher/s1.wav","animalia/pinscher/s2.wav","animalia/pinscher/s3.wav","animalia/pinscher/s4.wav","animalia/pinscher/s5.wav","animalia/pinscher/s6.wav","animalia/pinscher/s7.wav"}
ENT.SoundTbl_Pain = {"animalia/shepherd/pain1.wav","animalia/shepherd/pain2.wav","animalia/shepherd/pain3.wav","animalia/shepherd/pain6.wav","animalia/shepherd/pain7.wav","animalia/shepherd/pain8.wav","animalia/shepherd/pain9.wav"}
ENT.SoundTbl_Death = {"animalia/shepherd/pain1.wav","animalia/shepherd/pain2.wav","animalia/shepherd/pain3.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"animalia/pinscher/a1.wav","animalia/pinscher/a2.wav","animalia/pinscher/a3.wav","animalia/pinscher/a4.wav","animalia/pinscher/a5.wav","animalia/pinscher/a6.wav","animalia/pinscher/a7.wav","animalia/pinscher/a8.wav","animalia/pinscher/a9.wav","animalia/pinscher/a10.wav"}
ENT.SoundTbl_MeleeAttack = {"animalia/pinscher/bite1.wav","animalia/pinscher/bite2.wav","animalia/pinscher/bite3.wav","animalia/pinscher/bite4.wav","animalia/pinscher/bite5.wav","animalia/pinscher/bite6.wav"} 
ENT.SoundTbl_MeleeAttackMiss = {"animalia/pinscher/ci1.wav","animalia/pinscher/ci2.wav","animalia/pinscher/ci3.wav","animalia/pinscher/ci4.wav","animalia/pinscher/ci5.wav","animalia/pinscher/ci6.wav","animalia/pinscher/ci7.wav","animalia/pinscher/ci8.wav"}
ENT.SoundTbl_FootStep = {"animalia/step/foot1.mp3","animalia/step/foot2.mp3","animalia/step/foot3.mp3","animalia/step/foot4.mp3","animalia/step/foot5.mp3","animalia/step/foot6.mp3","animalia/step/foot7.mp3","animalia/step/foot8.mp3"}
ENT.FootStepTimeWalk = 0.55
ENT.FootStepTimeRun = 0.35
ENT.FootStepSoundLevel = 37

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(11, 11, 33), Vector(-11, -11, 0))
end

function ENT:CustomOnThink()
if self:Health() > 20 then
self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
self.SoundTbl_CombatIdle = {"animalia/pinscher/ci1.wav","animalia/pinscher/ci2.wav","animalia/pinscher/ci3.wav","animalia/pinscher/ci4.wav"}
elseif self:Health() < 20 then
self.Behavior = VJ_BEHAVIOR_PASSIVE
self.SoundTbl_CombatIdle = {"animalia/shepherd/pain1.wav","animalia/shepherd/pain2.wav","animalia/shepherd/pain3.wav","animalia/shepherd/pain6.wav","animalia/shepherd/pain7.wav","animalia/shepherd/pain8.wav","animalia/shepherd/pain9.wav"}
end
-- Animation code
if not self.NextAnimTime then
    self.NextAnimTime = CurTime() + math.random(20,70)
end
if CurTime() >= self.NextAnimTime && self.Alerted == false then
    self:VJ_ACT_PLAYACTIVITY({"idle2","idle3"},true,false,false)
    self.NextAnimTime = CurTime() + math.random(20,70)
end
end

function ENT:CustomOnAlert()
	if self.VJ_IsBeingControlled == true then return end
	if math.random(1,2) == 1 then
		self.SoundTbl_Alert = {"animalia/pinscher/a1.wav","animalia/pinscher/a2.wav","animalia/pinscher/a3.wav","animalia/pinscher/a4.wav","animalia/pinscher/a5.wav","animalia/pinscher/a6.wav","animalia/pinscher/a7.wav","animalia/pinscher/a8.wav","animalia/pinscher/a9.wav","animalia/pinscher/a10.wav"}
		self:VJ_ACT_PLAYACTIVITY("bark",true,false,true)
	else
		self.SoundTbl_Alert = {"animalia/pinscher/ci1.wav","animalia/pinscher/ci2.wav","animalia/pinscher/ci3.wav","animalia/pinscher/ci4.wav","animalia/pinscher/ci5.wav","animalia/pinscher/ci6.wav","animalia/pinscher/ci7.wav","animalia/pinscher/ci8.wav"}
	end
end