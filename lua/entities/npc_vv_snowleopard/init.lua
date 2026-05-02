AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/snowleopard.mdl"}
ENT.StartHealth = 70
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 1
ENT.BloodColor = "Red"
ENT.FriendsWithAllPlayerAllies = true
ENT.ConstantlyFaceEnemy = false
ENT.MoveOutOfFriendlyPlayersWay = false
ENT.FollowPlayer = false
ENT.SightDistance = 1100
ENT.CanOpenDoors = false
ENT.AllowMovementJumping = true
ENT.MaxJumpLegalDistance = VJ_Set(120, 120)

ENT.SoundTbl_FootStep = {"animalia/step/foot1.mp3","animalia/step/foot2.mp3","animalia/step/foot3.mp3","animalia/step/foot4.mp3","animalia/step/foot5.mp3","animalia/step/foot6.mp3","animalia/step/foot7.mp3","animalia/step/foot8.mp3"}
ENT.FootStepTimeWalk = 1.45
ENT.FootStepTimeRun = 0.5
ENT.FootStepSoundLevel = 39

ENT.MeleeAttackDamage = 12
ENT.MeleeAttackDistance = 25
ENT.MeleeAttackDamageDistance = 45
ENT.MeleeAttackAngleRadius = 30
ENT.MeleeAttackDamageAngleRadius = 20
ENT.TimeUntilMeleeAttackDamage = 0.9
ENT.SoundTbl_BeforeMeleeAttack = {"animalia/snowleo/a1.wav","animalia/snowleo/a2.wav","animalia/snowleo/a3.wav","animalia/snowleo/a4.wav","animalia/snowleo/a5.wav","animalia/snowleo/a6.wav","animalia/snowleo/a7.wav","animalia/snowleo/ci1.wav","animalia/snowleo/ci4.wav","animalia/snowleo/ci6.wav","animalia/snowleo/ci7.wav","animalia/snowleo/ci8.wav"}
ENT.SoundTbl_MeleeAttack = {"animalia/sharkbite1.wav","animalia/sharkbite2.wav","animalia/sharkbite3.wav"}
ENT.MeleeAttackSoundLevel = 50
ENT.SoundTbl_MeleeAttackMiss = {"animalia/sharkbite1.wav","animalia/sharkbite2.wav","animalia/sharkbite3.wav"}
ENT.MeleeAttackMissSoundLevel = 50

ENT.HasLeapAttack = true
ENT.LeapAttackDamageType = DMG_SLASH
ENT.AnimTbl_LeapAttack = {"leap"}
ENT.LeapDistance = 220
ENT.LeapAttackDamage = 21
ENT.LeapAttackDamageDistance = 50
ENT.LeapAttackVelocityForward = 100
ENT.LeapAttackVelocityUp = 200
ENT.LeapAttackAngleRadius = 30
ENT.LeapAttackExtraTimers = {0.4, 0.6, 0.8}
ENT.StopLeapAttackAfterFirstHit = true
ENT.SoundTbl_LeapAttackJump = {"animalia/snowleo/a1.wav","animalia/snowleo/a2.wav","animalia/snowleo/a3.wav","animalia/snowleo/a4.wav","animalia/snowleo/a5.wav","animalia/snowleo/a6.wav","animalia/snowleo/a7.wav","animalia/snowleo/ci1.wav","animalia/snowleo/ci3.wav","animalia/snowleo/ci4.wav","animalia/snowleo/ci5.wav","animalia/snowleo/ci6.wav","animalia/snowleo/ci7.wav","animalia/snowleo/ci8.wav","animalia/snowleo/ci9.wav"}
ENT.SoundTbl_LeapAttackDamage = {"npc/zombie/claw_strike1.wav","npc/zombie/claw_strike2.wav","npc/zombie/claw_strike3.wav"}
ENT.LeapAttackDamageSoundLevel = 55

ENT.SoundTbl_Death = {"animalia/snowleo/p1.wav","animalia/snowleo/p2.wav","animalia/snowleo/p3.wav","animalia/snowleo/p4.wav","animalia/snowleo/p5.wav","animalia/snowleo/p6.wav","animalia/snowleo/p7.wav","animalia/snowleo/p8.wav","animalia/snowleo/p9.wav","animalia/snowleo/p10.wav","animalia/snowleo/p11.wav","animalia/snowleo/i2.wav","animalia/snowleo/i3.wav","animalia/snowleo/i4.wav","animalia/snowleo/i5.wav","animalia/snowleo/i6.wav","animalia/snowleo/i8.wav"}
ENT.SoundTbl_Pain = {"animalia/snowleo/p1.wav","animalia/snowleo/p2.wav","animalia/snowleo/p3.wav","animalia/snowleo/p4.wav","animalia/snowleo/p5.wav","animalia/snowleo/p6.wav","animalia/snowleo/p7.wav","animalia/snowleo/p8.wav","animalia/snowleo/p9.wav","animalia/snowleo/p10.wav","animalia/snowleo/p11.wav"}
ENT.SoundTbl_Idle = {"animalia/snowleo/i1.wav","animalia/snowleo/i2.wav","animalia/snowleo/i3.wav","animalia/snowleo/i4.wav","animalia/snowleo/i5.wav","animalia/snowleo/i6.wav","animalia/snowleo/i7.wav","animalia/snowleo/i8.wav"}
ENT.SoundTbl_CombatIdle = {"animalia/snowleo/a1.wav","animalia/snowleo/a2.wav","animalia/snowleo/a3.wav","animalia/snowleo/a4.wav","animalia/snowleo/a5.wav","animalia/snowleo/a6.wav","animalia/snowleo/a7.wav","animalia/snowleo/ci1.wav","animalia/snowleo/ci2.wav","animalia/snowleo/ci3.wav","animalia/snowleo/ci4.wav","animalia/snowleo/ci5.wav","animalia/snowleo/ci6.wav","animalia/snowleo/ci7.wav","animalia/snowleo/ci8.wav","animalia/snowleo/ci9.wav","animalia/snowleo/ci10.wav"}
ENT.SoundTbl_Alert = {"animalia/snowleo/a1.wav","animalia/snowleo/a2.wav","animalia/snowleo/a3.wav","animalia/snowleo/a4.wav","animalia/snowleo/a5.wav","animalia/snowleo/a6.wav","animalia/snowleo/a7.wav","animalia/snowleo/ci1.wav","animalia/snowleo/ci2.wav","animalia/snowleo/ci3.wav","animalia/snowleo/ci4.wav","animalia/snowleo/ci5.wav","animalia/snowleo/ci6.wav","animalia/snowleo/ci7.wav","animalia/snowleo/ci8.wav","animalia/snowleo/ci9.wav","animalia/snowleo/ci10.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"animalia/snowleo/a1.wav","animalia/snowleo/a2.wav","animalia/snowleo/a3.wav","animalia/snowleo/a4.wav","animalia/snowleo/a5.wav","animalia/snowleo/a6.wav","animalia/snowleo/a7.wav","animalia/snowleo/ci1.wav","animalia/snowleo/ci2.wav","animalia/snowleo/ci3.wav","animalia/snowleo/ci4.wav","animalia/snowleo/ci5.wav","animalia/snowleo/ci6.wav","animalia/snowleo/ci7.wav","animalia/snowleo/ci8.wav","animalia/snowleo/ci9.wav","animalia/snowleo/ci10.wav"}
ENT.IdleSoundLevel = 95

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(17, 17, 30), Vector(-17, -17, 0))
end

function ENT:CustomOnThink()
if self:Health() > 30 then
self.Behavior = VJ_BEHAVIOR_AGRESSIVE
self.SoundTbl_CombatIdle = {"animalia/snowleo/a1.wav","animalia/snowleo/a2.wav","animalia/snowleo/a3.wav","animalia/snowleo/a4.wav","animalia/snowleo/a5.wav","animalia/snowleo/a6.wav","animalia/snowleo/a7.wav","animalia/snowleo/ci1.wav","animalia/snowleo/ci2.wav","animalia/snowleo/ci3.wav","animalia/snowleo/ci4.wav","animalia/snowleo/ci5.wav","animalia/snowleo/ci6.wav","animalia/snowleo/ci7.wav","animalia/snowleo/ci8.wav","animalia/snowleo/ci9.wav","animalia/snowleo/ci10.wav"}
elseif self:Health() < 30 then
self.Behavior = VJ_BEHAVIOR_PASSIVE
self.SoundTbl_CombatIdle = {"animalia/snowleo/p1.wav","animalia/snowleo/p2.wav","animalia/snowleo/p3.wav","animalia/snowleo/p4.wav","animalia/snowleo/p5.wav","animalia/snowleo/p6.wav","animalia/snowleo/p7.wav","animalia/snowleo/p8.wav","animalia/snowleo/p9.wav","animalia/snowleo/p10.wav","animalia/snowleo/p11.wav"}
end
-- Animation code
if not self.NextAnimTime then
    self.NextAnimTime = CurTime() + math.random(20,90)
end
if CurTime() >= self.NextAnimTime && self.Alerted == false then
    self:VJ_ACT_PLAYACTIVITY({"idle_inactive"},true,false,false)
    self.NextAnimTime = CurTime() + math.random(20,90)
end
end