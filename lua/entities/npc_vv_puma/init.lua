AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/puma.mdl"}
ENT.StartHealth = 140
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 1
ENT.BloodColor = "Red"
ENT.FriendsWithAllPlayerAllies = true
ENT.ConstantlyFaceEnemy = false
ENT.MoveOutOfFriendlyPlayersWay = false
ENT.FollowPlayer = false
ENT.SightDistance = 2000
ENT.CanOpenDoors = false
ENT.AllowMovementJumping = true
ENT.MaxJumpLegalDistance = VJ_Set(120, 120)

ENT.SoundTbl_FootStep = {"animalia/step/foot1.mp3","animalia/step/foot2.mp3","animalia/step/foot3.mp3","animalia/step/foot4.mp3","animalia/step/foot5.mp3","animalia/step/foot6.mp3","animalia/step/foot7.mp3","animalia/step/foot8.mp3"}
ENT.FootStepTimeWalk = 0.65
ENT.FootStepTimeRun = 0.4
ENT.FootStepSoundLevel = 40

ENT.MeleeAttackDamage = 18
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 55
ENT.MeleeAttackAngleRadius = 30
ENT.MeleeAttackDamageAngleRadius = 20
ENT.TimeUntilMeleeAttackDamage = 1.2
ENT.SoundTbl_BeforeMeleeAttack = {"animalia/puma/r1.wav","animalia/puma/r2.wav","animalia/puma/r3.wav","animalia/puma/r4.wav","animalia/puma/r5.wav","animalia/puma/r6.wav","animalia/puma/r7.wav","animalia/puma/r8.wav","animalia/puma/r9.wav"}
ENT.SoundTbl_MeleeAttack = {"npc/zombie/claw_strike1.wav","npc/zombie/claw_strike2.wav","npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav","npc/zombie/claw_miss2.wav"}
ENT.MeleeAttackSoundLevel = 60
ENT.MeleeAttackMissSoundLevel = 65

ENT.HasLeapAttack = true
ENT.LeapAttackDamageType = DMG_SLASH
ENT.AnimTbl_LeapAttack = {"leap"}
ENT.LeapDistance = 235
ENT.LeapAttackDamage = 30
ENT.LeapAttackDamageDistance = 50
ENT.LeapAttackVelocityForward = 100
ENT.LeapAttackVelocityUp = 200
ENT.LeapAttackAngleRadius = 30
ENT.LeapAttackExtraTimers = {0.4, 0.6, 0.8}
ENT.StopLeapAttackAfterFirstHit = true
ENT.SoundTbl_LeapAttackJump = {"animalia/puma/r1.wav","animalia/puma/r2.wav","animalia/puma/r3.wav","animalia/puma/r4.wav","animalia/puma/r5.wav","animalia/puma/r7.wav","animalia/puma/r9.wav"}
ENT.SoundTbl_LeapAttackDamage = {"npc/zombie/claw_strike1.wav","npc/zombie/claw_strike2.wav","npc/zombie/claw_strike3.wav"}
ENT.LeapAttackDamageSoundLevel = 60

ENT.SoundTbl_Death = {"animalia/puma/d1.wav","animalia/puma/d2.wav","animalia/puma/d3.wav","animalia/puma/d4.wav","animalia/puma/d5.wav"}
ENT.SoundTbl_Pain = {"animalia/puma/p1.wav","animalia/puma/p2.wav","animalia/puma/p3.wav","animalia/puma/p4.wav","animalia/puma/p5.wav","animalia/puma/p6.wav","animalia/puma/p7.wav","animalia/puma/r4.wav","animalia/puma/r9.wav"}
ENT.SoundTbl_Idle = {"animalia/puma/i1.wav","animalia/puma/i2.wav","animalia/puma/i3.wav","animalia/puma/i4.wav","animalia/puma/i5.wav","animalia/puma/i6.wav","animalia/puma/i7.wav","animalia/puma/i8.wav","animalia/puma/i9.wav","animalia/puma/i10.wav"}
ENT.SoundTbl_CombatIdle = {"animalia/puma/h1.wav","animalia/puma/h2.wav","animalia/puma/h3.wav","animalia/puma/h4.wav","animalia/puma/ci1.wav","animalia/puma/ci2.wav","animalia/puma/ci3.wav"}
ENT.SoundTbl_Alert = {"animalia/puma/h1.wav","animalia/puma/h2.wav","animalia/puma/h3.wav","animalia/puma/h4.wav","animalia/puma/ci1.wav","animalia/puma/ci2.wav","animalia/puma/ci3.wav","animalia/puma/r1.wav","animalia/puma/r2.wav","animalia/puma/r3.wav","animalia/puma/r5.wav","animalia/puma/r6.wav","animalia/puma/r8.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"animalia/puma/h1.wav","animalia/puma/h2.wav","animalia/puma/h3.wav","animalia/puma/h4.wav","animalia/puma/ci1.wav","animalia/puma/ci2.wav","animalia/puma/ci3.wav","animalia/puma/r1.wav","animalia/puma/r2.wav","animalia/puma/r3.wav","animalia/puma/r5.wav","animalia/puma/r6.wav","animalia/puma/r8.wav"}
ENT.IdleSoundLevel = 95

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(20, 20, 35), Vector(-20, -20, 0))
end

function ENT:CustomOnThink()
if self:Health() > 60 then
self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
self.SoundTbl_CombatIdle = {"animalia/puma/h1.wav","animalia/puma/h2.wav","animalia/puma/h3.wav","animalia/puma/h4.wav","animalia/puma/ci1.wav","animalia/puma/ci2.wav","animalia/puma/ci3.wav"}
elseif self:Health() < 60 then
self.Behavior = VJ_BEHAVIOR_PASSIVE
self.SoundTbl_CombatIdle = {"animalia/puma/p1.wav","animalia/puma/p2.wav","animalia/puma/p3.wav","animalia/puma/p4.wav","animalia/puma/p5.wav","animalia/puma/p6.wav","animalia/puma/p7.wav","animalia/puma/r4.wav","animalia/puma/r9.wav"}
end
-- Animation code
if not self.NextAnimTime then
    self.NextAnimTime = CurTime() + math.random(20,90)
end
if CurTime() >= self.NextAnimTime && self.Alerted == false then
    self:VJ_ACT_PLAYACTIVITY({"idle2"},true,false,false)
    self.NextAnimTime = CurTime() + math.random(20,90)
end
end