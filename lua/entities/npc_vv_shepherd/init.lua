AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/dog1.mdl"}
ENT.StartHealth = 70
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 1
ENT.BloodColor = "Red"
ENT.PlayerFriendly = true
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 1
ENT.FriendsWithAllPlayerAllies = true
ENT.SightDistance = 2500
ENT.AnimTbl_IdleStand = {ACT_IDLE}
ENT.AnimTbl_Run = {ACT_RUN_AGITATED}
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_FLINCH_HEAD,ACT_FLINCH_LEFTARM,ACT_FLINCH_RIGHTARM}
ENT.FlinchChance = 1
ENT.NextFlinchTime = 3
ENT.CanOpenDoors = false

ENT.MeleeAttackDamage = 12
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 50
ENT.MeleeAttackAngleRadius = 30
ENT.MeleeAttackDamageAngleRadius = 20

ENT.CombatIdleSoundChance = 1
ENT.IdleSoundChance = 1
ENT.SoundTbl_Idle = {"animalia/shepherd/idle1.wav","animalia/shepherd/idle2.wav","animalia/shepherd/idle3.wav","animalia/shepherd/idle4.wav","animalia/shepherd/idle5.wav","animalia/shepherd/other1.wav","animalia/shepherd/other2.wav","animalia/shepherd/other3.wav","animalia/shepherd/other4.wav","animalia/shepherd/other5.wav","animalia/shepherd/sad7.wav"}
ENT.SoundTbl_CombatIdle = {"animalia/shepherd/angry1.wav","animalia/shepherd/angry2.wav","animalia/shepherd/angry3.wav","animalia/shepherd/angry4.wav","animalia/shepherd/angry5.wav","animalia/shepherd/angry6.wav","animalia/shepherd/miss2.wav","animalia/shepherd/miss3.wav","animalia/shepherd/miss4.wav"}
ENT.SoundTbl_Alert = {"animalia/shepherd/angry1.wav","animalia/shepherd/angry2.wav","animalia/shepherd/angry3.wav","animalia/shepherd/miss2.wav","animalia/shepherd/miss3.wav","animalia/shepherd/miss4.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"animalia/shepherd/angry1.wav","animalia/shepherd/angry2.wav","animalia/shepherd/angry3.wav","animalia/shepherd/miss2.wav","animalia/shepherd/miss3.wav","animalia/shepherd/miss4.wav"}
ENT.SoundTbl_FollowPlayer = {"animalia/shepherd/other1.wav","animalia/shepherd/other2.wav","animalia/shepherd/other3.wav","animalia/shepherd/other4.wav","animalia/shepherd/other5.wav"}
ENT.SoundTbl_UnFollowPlayer = {"animalia/shepherd/other1.wav","animalia/shepherd/other2.wav","animalia/shepherd/other3.wav","animalia/shepherd/other4.wav","animalia/shepherd/other5.wav","animalia/shepherd/sad1.wav","animalia/shepherd/sad2.wav","animalia/shepherd/sad3.wav","animalia/shepherd/sad4.wav","animalia/shepherd/sad5.wav","animalia/shepherd/sad6.wav","animalia/shepherd/sad7.wav"}
ENT.SoundTbl_Pain = {"animalia/shepherd/pain1.wav","animalia/shepherd/pain2.wav","animalia/shepherd/pain3.wav","animalia/shepherd/pain4.wav","animalia/shepherd/pain5.wav","animalia/shepherd/pain6.wav","animalia/shepherd/pain7.wav","animalia/shepherd/pain8.wav","animalia/shepherd/pain9.wav"}
ENT.SoundTbl_Death = {"animalia/shepherd/pain1.wav","animalia/shepherd/pain2.wav","animalia/shepherd/pain3.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"animalia/shepherd/attack1.wav","animalia/shepherd/attack2.wav","animalia/shepherd/attack3.wav","animalia/shepherd/attack4.wav","animalia/shepherd/attack5.wav","animalia/shepherd/attack6.wav","animalia/shepherd/attack7.wav","animalia/shepherd/attack8.wav","animalia/shepherd/attack9.wav","animalia/shepherd/attack10.wav"}
ENT.SoundTbl_MeleeAttack = {"animalia/shepherd/bite1.wav","animalia/shepherd/bite2.wav","animalia/shepherd/bite3.wav","animalia/shepherd/bite4.wav","animalia/shepherd/bite5.wav","animalia/shepherd/bite6.wav"} 
ENT.SoundTbl_MeleeAttackMiss = {"animalia/shepherd/miss1.wav","animalia/shepherd/miss2.wav","animalia/shepherd/miss3.wav","animalia/shepherd/miss4.wav","animalia/shepherd/angry3.wav"}
ENT.SoundTbl_FootStep = {"animalia/step/foot1.mp3","animalia/step/foot2.mp3","animalia/step/foot3.mp3","animalia/step/foot4.mp3","animalia/step/foot5.mp3","animalia/step/foot6.mp3","animalia/step/foot7.mp3","animalia/step/foot8.mp3"}
ENT.FootStepTimeWalk = 0.6
ENT.FootStepTimeRun = 0.3
ENT.FootStepSoundLevel = 40

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(20, 20, 40), Vector(-20, -20, 0))
self:SetBodygroup(1,math.random(2,2))
self:SetSkin(math.random(0,10))
end

function ENT:CustomOnThink()
if self:Health() > 30 then
self.AnimTbl_Walk = {ACT_WALK}
self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
self.SoundTbl_CombatIdle = {"animalia/shepherd/angry1.wav","animalia/shepherd/angry2.wav","animalia/shepherd/angry3.wav","animalia/shepherd/angry4.wav","animalia/shepherd/angry5.wav","animalia/shepherd/angry6.wav","animalia/shepherd/miss2.wav","animalia/shepherd/miss3.wav","animalia/shepherd/miss4.wav"}
elseif self:Health() < 30 then
self.AnimTbl_Walk = {ACT_WALK_HURT}
self.Behavior = VJ_BEHAVIOR_PASSIVE
self.SoundTbl_CombatIdle = {"animalia/shepherd/pain1.wav","animalia/shepherd/pain2.wav","animalia/shepherd/pain3.wav","animalia/shepherd/pain4.wav","animalia/shepherd/pain5.wav","animalia/shepherd/pain6.wav","animalia/shepherd/pain7.wav","animalia/shepherd/pain8.wav","animalia/shepherd/pain9.wav"}
end
-- Animation code
if not self.NextAnimTime then
    self.NextAnimTime = CurTime() + math.random(10,50)
end
if CurTime() >= self.NextAnimTime && self.Alerted == false then
    self:VJ_ACT_PLAYACTIVITY({"scratch","specialidle_aroo","specialidle_sniff","specialidle_toungehang","mtspecialidle_lookleft","mtspecialidle_lookright","specialidle_sit"},true,false,false)
    self.NextAnimTime = CurTime() + math.random(10,50)
end
end

function ENT:CustomOnAlert()
	if self.VJ_IsBeingControlled == true then return end
	if math.random(1,2) == 1 then
		self.SoundTbl_Alert = {"animalia/shepherd/attack1.wav","animalia/shepherd/attack2.wav","animalia/shepherd/attack3.wav","animalia/shepherd/attack4.wav","animalia/shepherd/attack5.wav","animalia/shepherd/attack6.wav","animalia/shepherd/attack7.wav","animalia/shepherd/attack8.wav","animalia/shepherd/attack9.wav","animalia/shepherd/attack10.wav"}
		self:VJ_ACT_PLAYACTIVITY("specialidle_barksingle",true,false,true)
	else
		self.SoundTbl_Alert = {"animalia/shepherd/angry1.wav","animalia/shepherd/angry2.wav","animalia/shepherd/angry3.wav","animalia/shepherd/miss2.wav","animalia/shepherd/miss3.wav","animalia/shepherd/miss4.wav"}
	end
end