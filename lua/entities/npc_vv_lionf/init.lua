AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/lionf.mdl"}
ENT.StartHealth = 210
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
ENT.VJ_NPC_Class = {"CLASS_LIONS"}

ENT.SoundTbl_FootStep = {"animalia/step/foot1.mp3","animalia/step/foot2.mp3","animalia/step/foot3.mp3","animalia/step/foot4.mp3","animalia/step/foot5.mp3","animalia/step/foot6.mp3","animalia/step/foot7.mp3","animalia/step/foot8.mp3"}
ENT.FootStepTimeWalk = 0.95
ENT.FootStepTimeRun = 0.55
ENT.FootStepSoundLevel = 45

ENT.MeleeAttackDamage = 30
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 50
ENT.MeleeAttackAngleRadius = 30
ENT.MeleeAttackDamageAngleRadius = 20
ENT.AnimTbl_MeleeAttack = {"attack1"}
ENT.TimeUntilMeleeAttackDamage = 0.8
ENT.SoundTbl_BeforeMeleeAttack = {"animalia/lion/r1.wav","animalia/lion/r2.wav","animalia/lion/r3.wav","animalia/lion/r4.wav","animalia/lion/r5.wav","animalia/lion/r6.wav","animalia/lion/r7.wav"}
ENT.SoundTbl_MeleeAttack = {"npc/zombie/claw_strike1.wav","npc/zombie/claw_strike2.wav","npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav","npc/zombie/claw_miss2.wav"}
ENT.MeleeAttackSoundLevel = 60
ENT.MeleeAttackMissSoundLevel = 65

ENT.HasLeapAttack = true
ENT.LeapAttackDamageType = DMG_SLASH
ENT.AnimTbl_LeapAttack = {"leap"}
ENT.LeapDistance = 235
ENT.LeapAttackDamage = 40
ENT.LeapAttackDamageDistance = 50
ENT.LeapAttackVelocityForward = 100
ENT.LeapAttackVelocityUp = 200
ENT.LeapAttackAngleRadius = 30
ENT.LeapAttackExtraTimers = {0.4, 0.5, 0.6, 0.7, 0.8}
ENT.StopLeapAttackAfterFirstHit = true
ENT.SoundTbl_LeapAttackJump = {"animalia/lion/r1.wav","animalia/lion/r2.wav","animalia/lion/r3.wav","animalia/lion/r4.wav","animalia/lion/r5.wav","animalia/lion/r6.wav","animalia/lion/r7.wav"}
ENT.SoundTbl_LeapAttackDamage = {"npc/zombie/claw_strike1.wav","npc/zombie/claw_strike2.wav","npc/zombie/claw_strike3.wav"}
ENT.LeapAttackDamageSoundLevel = 60

ENT.SoundTbl_Death = {"animalia/lion/d1.wav","animalia/lion/fp1.wav","animalia/lion/fp2.wav","animalia/lion/fp3.wav","animalia/lion/fp4.wav","animalia/lion/fp5.wav","animalia/lion/fp6.wav","animalia/lion/fp7.wav"}
ENT.SoundTbl_Pain = {"animalia/lion/p1.wav","animalia/lion/p2.wav","animalia/lion/p3.wav","animalia/lion/p4.wav","animalia/lion/p5.wav","animalia/lion/fp1.wav","animalia/lion/fp2.wav","animalia/lion/fp3.wav","animalia/lion/fp4.wav","animalia/lion/fp5.wav","animalia/lion/fp6.wav","animalia/lion/fp7.wav"}
ENT.SoundTbl_Idle = {"animalia/lion/i1.wav","animalia/lion/i2.wav","animalia/lion/i3.wav","animalia/lion/i4.wav","animalia/lion/i5.wav","animalia/lion/i6.wav","animalia/lion/i7.wav","animalia/lion/i8.wav"}
ENT.SoundTbl_CombatIdle = {"animalia/lion/c1.wav","animalia/lion/c2.wav","animalia/lion/c3.wav","animalia/lion/c4.wav","animalia/lion/c5.wav","animalia/lion/c6.wav","animalia/lion/c7.wav","animalia/lion/r1.wav","animalia/lion/r2.wav","animalia/lion/r3.wav","animalia/lion/r4.wav","animalia/lion/r5.wav","animalia/lion/r6.wav","animalia/lion/r7.wav","animalia/lion/p1.wav","animalia/lion/p2.wav","animalia/lion/p3.wav","animalia/lion/p4.wav","animalia/lion/p5.wav"}
ENT.SoundTbl_Alert = {"animalia/lion/c1.wav","animalia/lion/c2.wav","animalia/lion/c3.wav","animalia/lion/c4.wav","animalia/lion/c5.wav","animalia/lion/c6.wav","animalia/lion/c7.wav","animalia/lion/r1.wav","animalia/lion/r2.wav","animalia/lion/r3.wav","animalia/lion/r4.wav","animalia/lion/r5.wav","animalia/lion/r6.wav","animalia/lion/r7.wav","animalia/lion/p1.wav","animalia/lion/p2.wav","animalia/lion/p3.wav","animalia/lion/p4.wav","animalia/lion/p5.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"animalia/lion/c1.wav","animalia/lion/c2.wav","animalia/lion/c3.wav","animalia/lion/c4.wav","animalia/lion/c5.wav","animalia/lion/c6.wav","animalia/lion/c7.wav","animalia/lion/r1.wav","animalia/lion/r2.wav","animalia/lion/r3.wav","animalia/lion/r4.wav","animalia/lion/r5.wav","animalia/lion/r6.wav","animalia/lion/r7.wav","animalia/lion/p1.wav","animalia/lion/p2.wav","animalia/lion/p3.wav","animalia/lion/p4.wav","animalia/lion/p5.wav"}

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(20, 20, 40), Vector(-20, -20, 0))
end

function ENT:CustomOnThink()
if self:Health() > 60 then
self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
self.SoundTbl_CombatIdle = {"animalia/lion/c1.wav","animalia/lion/c2.wav","animalia/lion/c3.wav","animalia/lion/c4.wav","animalia/lion/c5.wav","animalia/lion/c6.wav","animalia/lion/c7.wav","animalia/lion/r1.wav","animalia/lion/r2.wav","animalia/lion/r3.wav","animalia/lion/r4.wav","animalia/lion/r5.wav","animalia/lion/r6.wav","animalia/lion/r7.wav","animalia/lion/p1.wav","animalia/lion/p2.wav","animalia/lion/p3.wav","animalia/lion/p4.wav","animalia/lion/p5.wav"}
elseif self:Health() < 60 then
self.Behavior = VJ_BEHAVIOR_PASSIVE
self.SoundTbl_CombatIdle = {"animalia/lion/p1.wav","animalia/lion/p2.wav","animalia/lion/p3.wav","animalia/lion/p4.wav","animalia/lion/p5.wav","animalia/lion/fp1.wav","animalia/lion/fp2.wav","animalia/lion/fp3.wav","animalia/lion/fp4.wav","animalia/lion/fp5.wav","animalia/lion/fp6.wav","animalia/lion/fp7.wav"}
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