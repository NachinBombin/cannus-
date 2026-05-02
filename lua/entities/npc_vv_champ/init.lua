AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/champ.mdl"}
ENT.StartHealth = 25
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 1
ENT.BloodColor = "Red"
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = true
ENT.FollowPlayer = true
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 1
ENT.AllowMovementJumping = true
ENT.MaxJumpLegalDistance = VJ_Set(100, 100)
ENT.BloodDecalDistance = 1
ENT.CanOpenDoors = false
ENT.CanFlinch = 1
ENT.AnimTbl_IdleStand = {"idle","idle","idle","idle","idle_smell","idle_look","idle","idle_smell","idle_look","idle","idle_smell","idle_look","sitting","lying"}
ENT.AnimTbl_Flinch = {ACT_FLINCH}
ENT.FlinchChance = 1
ENT.NextFlinchTime = 3

ENT.AnimTbl_MeleeAttack = {"jump_attack"}
ENT.HasMeleeAttack = true
ENT.MeleeAttackDamage = 7
ENT.MeleeAttackDistance = 15
ENT.MeleeAttackDamageDistance = 30
ENT.MeleeAttackAngleRadius = 30
ENT.MeleeAttackDamageAngleRadius = 20
ENT.NextMeleeAttackTime = 0.35

ENT.CombatIdleSoundChance = 1
ENT.IdleSoundChance = 1
ENT.SoundTbl_Idle = {"animalia/pitbull/i1.wav","animalia/pitbull/i2.wav","animalia/pitbull/i3.wav","animalia/pitbull/i4.wav","animalia/pitbull/i5.wav"}
ENT.SoundTbl_CombatIdle = {"animalia/pitbull/ci1.wav","animalia/pitbull/ci2.wav","animalia/pitbull/ci3.wav","animalia/pitbull/ci4.wav","animalia/pitbull/ci5.wav"}
ENT.SoundTbl_Alert = {"animalia/pitbull/ci1.wav","animalia/pitbull/ci2.wav","animalia/pitbull/ci3.wav","animalia/pitbull/ci4.wav","animalia/pitbull/ci5.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"animalia/pitbull/ci1.wav","animalia/pitbull/ci2.wav","animalia/pitbull/ci3.wav","animalia/pitbull/ci4.wav","animalia/pitbull/ci5.wav"}
ENT.SoundTbl_FollowPlayer = {"animalia/pitbull/h1.wav","animalia/pitbull/h2.wav","animalia/pitbull/h3.wav","animalia/pitbull/i1.wav","animalia/pitbull/i2.wav","animalia/pitbull/i3.wav","animalia/pitbull/i4.wav","animalia/pitbull/i5.wav"}
ENT.SoundTbl_UnFollowPlayer = {"animalia/shepherd/sad6.wav","animalia/pitbull/sad1.wav","animalia/pitbull/sad2.wav","animalia/pitbull/sad3.wav","animalia/pitbull/sad4.wav"}
ENT.SoundTbl_Pain = {"animalia/shepherd/pain1.wav","animalia/shepherd/pain2.wav","animalia/shepherd/pain3.wav","animalia/shepherd/pain6.wav","animalia/shepherd/pain7.wav","animalia/shepherd/pain8.wav","animalia/shepherd/pain9.wav"}
ENT.SoundTbl_Death = {"animalia/shepherd/pain1.wav","animalia/shepherd/pain2.wav","animalia/shepherd/pain3.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"animalia/pitbull/a1.wav","animalia/pitbull/a2.wav","animalia/pitbull/a3.wav","animalia/pitbull/a4.wav","animalia/pitbull/a5.wav","animalia/pitbull/a6.wav","animalia/pitbull/a7.wav","animalia/pitbull/a8.wav"}
ENT.SoundTbl_MeleeAttack = {"animalia/pitbull/bite1.wav","animalia/pitbull/bite2.wav","animalia/pitbull/bite3.wav"} 
ENT.SoundTbl_MeleeAttackMiss = {"animalia/pitbull/ci1.wav","animalia/pitbull/ci2.wav","animalia/pitbull/ci3.wav"}
ENT.SoundTbl_FootStep = {"animalia/step/foot1.mp3","animalia/step/foot2.mp3","animalia/step/foot3.mp3","animalia/step/foot4.mp3","animalia/step/foot5.mp3","animalia/step/foot6.mp3","animalia/step/foot7.mp3","animalia/step/foot8.mp3"}
ENT.FootStepTimeWalk = 0.3
ENT.FootStepTimeRun = 0.38
ENT.FootStepSoundLevel = 35

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(11, 11, 20), Vector(-11, -11, 0))
self:SetSkin(math.random(0,2))
end

function ENT:CustomOnThink()
if self:Health() > 15 then
self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
self.SoundTbl_CombatIdle = {"animalia/pitbull/ci1.wav","animalia/pitbull/ci2.wav","animalia/pitbull/ci3.wav","animalia/pitbull/ci4.wav","animalia/pitbull/ci5.wav"}
elseif self:Health() < 15 then
self.Behavior = VJ_BEHAVIOR_PASSIVE
self.SoundTbl_CombatIdle = {"animalia/shepherd/pain1.wav","animalia/shepherd/pain2.wav","animalia/shepherd/pain3.wav","animalia/shepherd/pain6.wav","animalia/shepherd/pain7.wav","animalia/shepherd/pain8.wav","animalia/shepherd/pain9.wav"}
end
end

function ENT:CustomOnAlert()
	if self.VJ_IsBeingControlled == true then return end
	if math.random(1,2) == 1 then
		self.SoundTbl_Alert = {"animalia/pitbull/a1.wav","animalia/pitbull/a2.wav","animalia/pitbull/a3.wav","animalia/pitbull/a4.wav","animalia/pitbull/a5.wav","animalia/pitbull/a6.wav","animalia/pitbull/a7.wav","animalia/pitbull/a8.wav"}
		self:VJ_ACT_PLAYACTIVITY("idle_bark_1",true,false,true)
	else
		self.SoundTbl_Alert = {"animalia/pitbull/ci1.wav","animalia/pitbull/ci2.wav","animalia/pitbull/ci3.wav","animalia/pitbull/ci4.wav","animalia/pitbull/ci5.wav"}
	end
end