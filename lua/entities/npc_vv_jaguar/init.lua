AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/jaguar.mdl"}
ENT.StartHealth = 150
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
ENT.FootStepTimeWalk = 0.6
ENT.FootStepTimeRun = 0.45
ENT.FootStepSoundLevel = 40

ENT.MeleeAttackDamage = 20
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 55
ENT.MeleeAttackAngleRadius = 30
ENT.MeleeAttackDamageAngleRadius = 20
ENT.SoundTbl_BeforeMeleeAttack = {"animalia/jaguar/r1.wav","animalia/jaguar/r2.wav","animalia/jaguar/r3.wav","animalia/jaguar/r4.wav","animalia/jaguar/r5.wav","animalia/jaguar/r6.wav","animalia/jaguar/r7.wav"}

ENT.HasLeapAttack = true
ENT.LeapAttackDamageType = DMG_SLASH
ENT.AnimTbl_LeapAttack = {"leap"}
ENT.LeapDistance = 235
ENT.LeapAttackDamage = 35
ENT.LeapAttackDamageDistance = 50
ENT.LeapAttackVelocityForward = 100
ENT.LeapAttackVelocityUp = 200
ENT.LeapAttackAngleRadius = 30
ENT.LeapAttackExtraTimers = {0.4, 0.6, 0.8}
ENT.StopLeapAttackAfterFirstHit = true
ENT.SoundTbl_LeapAttackJump = {"animalia/jaguar/r1.wav","animalia/jaguar/r2.wav","animalia/jaguar/r3.wav","animalia/jaguar/r4.wav","animalia/jaguar/r5.wav","animalia/jaguar/r6.wav","animalia/jaguar/r7.wav"}
ENT.SoundTbl_LeapAttackDamage = {"npc/zombie/claw_strike1.wav","npc/zombie/claw_strike2.wav","npc/zombie/claw_strike3.wav"}
ENT.LeapAttackDamageSoundLevel = 60

ENT.SoundTbl_Death = {"animalia/jaguar/p1.wav","animalia/jaguar/p2.wav","animalia/jaguar/p3.wav","animalia/jaguar/p4.wav"}
ENT.SoundTbl_Pain = {"animalia/jaguar/p1.wav","animalia/jaguar/p2.wav","animalia/jaguar/p3.wav","animalia/jaguar/p4.wav"}
ENT.SoundTbl_Idle = {"animalia/jaguar/i1.wav","animalia/jaguar/i2.wav","animalia/jaguar/i3.wav","animalia/jaguar/i4.wav","animalia/jaguar/i5.wav","animalia/jaguar/i6.wav","animalia/jaguar/i7.wav","animalia/jaguar/i8.wav"}
ENT.SoundTbl_CombatIdle = {"animalia/jaguar/c1.wav","animalia/jaguar/c2.wav","animalia/jaguar/c3.wav","animalia/jaguar/c4.wav","animalia/jaguar/c5.wav","animalia/jaguar/c6.wav"}
ENT.SoundTbl_Alert = {"animalia/jaguar/c1.wav","animalia/jaguar/c2.wav","animalia/jaguar/c3.wav","animalia/jaguar/c4.wav","animalia/jaguar/c5.wav","animalia/jaguar/c6.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"animalia/jaguar/c1.wav","animalia/jaguar/c2.wav","animalia/jaguar/c3.wav","animalia/jaguar/c4.wav","animalia/jaguar/c5.wav","animalia/jaguar/c6.wav"}

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(20, 20, 35), Vector(-20, -20, 0))
end

function ENT:CustomOnThink()
if self:Health() > 60 then
self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
self.SoundTbl_CombatIdle = {"animalia/jaguar/c1.wav","animalia/jaguar/c2.wav","animalia/jaguar/c3.wav","animalia/jaguar/c4.wav","animalia/jaguar/c5.wav","animalia/jaguar/c6.wav"}
elseif self:Health() < 60 then
self.Behavior = VJ_BEHAVIOR_PASSIVE
self.SoundTbl_CombatIdle = {"animalia/jaguar/p1.wav","animalia/jaguar/p2.wav","animalia/jaguar/p3.wav","animalia/jaguar/p4.wav"}
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

function ENT:MultipleMeleeAttacks()
if math.random(1, 2) == 1 then
self.AnimTbl_MeleeAttack = {"attack1"}
self.TimeUntilMeleeAttackDamage = 1
self.SoundTbl_MeleeAttack = {"animalia/sharkbite1.wav","animalia/sharkbite2.wav","animalia/sharkbite3.wav"}
self.SoundTbl_MeleeAttackMiss = {"animalia/sharkbite1.wav","animalia/sharkbite2.wav","animalia/sharkbite3.wav"}
self.MeleeAttackSoundLevel = 55
self.MeleeAttackMissSoundLevel = 55
else
self.AnimTbl_MeleeAttack = {"attack2"}
self.TimeUntilMeleeAttackDamage = 0.9
self.SoundTbl_MeleeAttack = {"npc/zombie/claw_strike1.wav","npc/zombie/claw_strike2.wav","npc/zombie/claw_strike3.wav"}
self.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav","npc/zombie/claw_miss2.wav"}
self.MeleeAttackSoundLevel = 60
self.MeleeAttackMissSoundLevel = 65
end
end