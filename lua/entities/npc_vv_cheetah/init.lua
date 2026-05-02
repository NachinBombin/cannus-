AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/cheetah.mdl"}
ENT.StartHealth = 70
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 1
ENT.BloodColor = "Red"
ENT.FriendsWithAllPlayerAllies = true
ENT.ConstantlyFaceEnemy = false
ENT.MoveOutOfFriendlyPlayersWay = false
ENT.FollowPlayer = false
ENT.SightDistance = 3000
ENT.CanOpenDoors = false
ENT.AllowMovementJumping = true
ENT.MaxJumpLegalDistance = VJ_Set(120, 120)
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {"takedown","flinch"}
ENT.FlinchChance = 2
ENT.NextFlinchTime = 6

ENT.SoundTbl_FootStep = {"animalia/step/foot1.mp3","animalia/step/foot2.mp3","animalia/step/foot3.mp3","animalia/step/foot4.mp3","animalia/step/foot5.mp3","animalia/step/foot6.mp3","animalia/step/foot7.mp3","animalia/step/foot8.mp3"}
ENT.FootStepTimeWalk = 0.35
ENT.FootStepTimeRun = 0.4
ENT.FootStepSoundLevel = 39

ENT.MeleeAttackDamage = 12
ENT.MeleeAttackDistance = 20
ENT.MeleeAttackDamageDistance = 45
ENT.MeleeAttackAngleRadius = 30
ENT.MeleeAttackDamageAngleRadius = 20
ENT.TimeUntilMeleeAttackDamage = 0.4
ENT.AnimTbl_MeleeAttack = {"attack1","attack2"}
ENT.SoundTbl_BeforeMeleeAttack = {"animalia/cheetah/r1.wav","animalia/cheetah/r2.wav","animalia/cheetah/r3.wav","animalia/cheetah/r4.wav","animalia/cheetah/r5.wav"}
ENT.SoundTbl_MeleeAttack = {"npc/zombie/claw_strike1.wav","npc/zombie/claw_strike2.wav","npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav","npc/zombie/claw_miss2.wav"}
ENT.MeleeAttackSoundLevel = 50
ENT.MeleeAttackMissSoundLevel = 50

ENT.HasLeapAttack = true
ENT.LeapAttackDamageType = DMG_SLASH
ENT.AnimTbl_LeapAttack = {"attack_a"}
ENT.LeapDistance = 220
ENT.LeapAttackDamage = 21
ENT.LeapAttackDamageDistance = 50
ENT.LeapAttackVelocityForward = 200
ENT.LeapAttackVelocityUp = 200
ENT.LeapAttackAngleRadius = 30
ENT.LeapAttackExtraTimers = {0.4, 0.6, 0.8}
ENT.StopLeapAttackAfterFirstHit = true
ENT.SoundTbl_LeapAttackJump = {"animalia/cheetah/r1.wav","animalia/cheetah/r2.wav","animalia/cheetah/r3.wav","animalia/cheetah/r4.wav","animalia/cheetah/r5.wav"}
ENT.SoundTbl_LeapAttackDamage = {"npc/zombie/claw_strike1.wav","npc/zombie/claw_strike2.wav","npc/zombie/claw_strike3.wav"}
ENT.LeapAttackDamageSoundLevel = 55

ENT.HasDeathAnimation = false
ENT.AnimTbl_Death = {"takendown"}
ENT.DeathAnimationTime = 200
ENT.HasDeathRagdoll = true
ENT.SoundTbl_Death = {"animalia/cheetah/p1.wav","animalia/cheetah/p2.wav","animalia/cheetah/p3.wav","animalia/cheetah/p4.wav","animalia/cheetah/p5.wav","animalia/cheetah/p6.wav","animalia/cheetah/p7.wav","animalia/cheetah/p8.wav"}
ENT.SoundTbl_Pain = {"animalia/cheetah/p1.wav","animalia/cheetah/p2.wav","animalia/cheetah/p3.wav","animalia/cheetah/p4.wav","animalia/cheetah/p5.wav","animalia/cheetah/p6.wav","animalia/cheetah/p7.wav","animalia/cheetah/p8.wav","animalia/cheetah/r3.wav","animalia/cheetah/r4.wav","animalia/cheetah/r5.wav"}

ENT.SoundTbl_Idle = {"animalia/cheetah/i1.wav","animalia/cheetah/i2.wav","animalia/cheetah/i3.wav","animalia/cheetah/i4.wav"}
ENT.SoundTbl_CombatIdle = {"animalia/cheetah/r1.wav","animalia/cheetah/r2.wav","animalia/cheetah/r3.wav","animalia/cheetah/r4.wav","animalia/cheetah/r5.wav"}
ENT.SoundTbl_Alert = {"animalia/cheetah/r1.wav","animalia/cheetah/r2.wav","animalia/cheetah/r3.wav","animalia/cheetah/r4.wav","animalia/cheetah/r5.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"animalia/cheetah/r1.wav","animalia/cheetah/r2.wav","animalia/cheetah/r3.wav","animalia/cheetah/r4.wav","animalia/cheetah/r5.wav","animalia/cheetah/a1.wav"}
ENT.IdleSoundLevel = 95

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(17, 17, 30), Vector(-17, -17, 0))
end

function ENT:CustomOnThink()
if self:Health() > 30 then
self.Behavior = VJ_BEHAVIOR_AGRESSIVE
self.SoundTbl_CombatIdle = {"animalia/cheetah/r1.wav","animalia/cheetah/r2.wav","animalia/cheetah/r3.wav","animalia/cheetah/r4.wav","animalia/cheetah/r5.wav"}
elseif self:Health() < 30 then
self.Behavior = VJ_BEHAVIOR_PASSIVE
self.SoundTbl_CombatIdle = {"animalia/cheetah/p1.wav","animalia/cheetah/p2.wav","animalia/cheetah/p3.wav","animalia/cheetah/p4.wav","animalia/cheetah/p5.wav","animalia/cheetah/p6.wav","animalia/cheetah/p7.wav","animalia/cheetah/p8.wav","animalia/cheetah/r3.wav","animalia/cheetah/r4.wav","animalia/cheetah/r5.wav"}
end
-- Animation code
if not self.NextAnimTime then
    self.NextAnimTime = CurTime() + math.random(20,90)
end
if CurTime() >= self.NextAnimTime && self.Alerted == false then
    self:VJ_ACT_PLAYACTIVITY({"idle3"},true,false,false)
    self.NextAnimTime = CurTime() + math.random(20,90)
end
if self.NearestPointToEnemyDistance < 2000 && self.Alerted == true then
self.AnimTbl_Run = {ACT_RUN}
self.AnimTbl_IdleStand = {"idle_crouch"}
self.CombatIdleSoundLevel = 100
self.FootStepSoundLevel = 39
elseif self.NearestPointToEnemyDistance > 2000 && self.Alerted == true then
self.AnimTbl_Run = {ACT_RUN_AGITATED}
self.AnimTbl_IdleStand = {"idle_default"}
self.CombatIdleSoundLevel = 1
self.FootStepSoundLevel = 1
else
self.AnimTbl_Run = {ACT_RUN}
self.AnimTbl_IdleStand = {"idle_default"}
self.CombatIdleSoundLevel = 100
self.FootStepSoundLevel = 39
end
end