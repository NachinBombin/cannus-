AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/rhino.mdl"}
ENT.StartHealth = 400
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 1
ENT.BloodColor = "Red"
ENT.PlayerFriendly = true
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 1
ENT.FriendsWithAllPlayerAllies = true
ENT.ConstantlyFaceEnemy = false
ENT.MoveOutOfFriendlyPlayersWay = false
ENT.FollowPlayer = false
ENT.SightDistance = 2000
ENT.CanOpenDoors = false
ENT.VJ_IsHugeMonster = true

ENT.FootStepTimeWalk = 0.6
ENT.FootStepTimeRun = 0.2
ENT.SoundTbl_FootStep = {"animalia/elephant/step1.wav","animalia/elephant/step2.wav"}
ENT.FootStepSoundLevel = 50

ENT.MeleeAttackDamage = 30
ENT.MeleeAttackDistance = 80
ENT.MeleeAttackDamageDistance = 130
ENT.MeleeAttackAngleRadius = 30
ENT.MeleeAttackDamageAngleRadius = 20
ENT.HasMeleeAttackKnockBack = true
ENT.MeleeAttackKnockBack_Up1 = 20
ENT.MeleeAttackKnockBack_Up2 = 20
ENT.TimeUntilMeleeAttackDamage = 0.7
ENT.SoundTbl_BeforeMeleeAttack = {"animalia/rhino/a1.wav","animalia/rhino/a2.wav","animalia/rhino/a3.wav","animalia/rhino/a4.wav"}
ENT.SoundTbl_MeleeAttack = {"npc/zombie/claw_strike1.wav","npc/zombie/claw_strike2.wav","npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav","npc/zombie/claw_miss2.wav"}
ENT.MeleeAttackSoundLevel = 65

ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {"die"}
ENT.DeathAnimationTime = 2.7
ENT.SoundTbl_Death = {"animalia/rhino/d1.wav","animalia/rhino/d2.wav","animalia/rhino/d3.wav"}
ENT.SoundTbl_Pain = {"animalia/rhino/p1.wav","animalia/rhino/p2.wav","animalia/rhino/p3.wav","animalia/rhino/p4.wav","animalia/rhino/p5.wav"}
ENT.SoundTbl_Idle = {"animalia/rhino/i1.wav","animalia/rhino/i2.wav","animalia/rhino/i3.wav","animalia/rhino/i4.wav","animalia/rhino/i5.wav"}
ENT.SoundTbl_CombatIdle = {"animalia/rhino/ai1.wav","animalia/rhino/ai2.wav","animalia/rhino/a5.wav","animalia/rhino/a6.wav"}
ENT.SoundTbl_Alert = {"animalia/rhino/a1.wav","animalia/rhino/a2.wav","animalia/rhino/a3.wav","animalia/rhino/a4.wav","animalia/rhino/a5.wav","animalia/rhino/a6.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"animalia/rhino/a1.wav","animalia/rhino/a2.wav","animalia/rhino/a3.wav","animalia/rhino/a4.wav","animalia/rhino/a5.wav","animalia/rhino/a6.wav"}

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(50, 50, 100), Vector(-50, -50, 0))
self:SetSkin(math.random(0,1))
if math.random(1, 2) == 1 then
self.DeathAnimationTime = 1.6
else
self.DeathAnimationTime = 2.7
end
end

function ENT:CustomOnThink()
if self:Health() > 60 then
self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
self.SoundTbl_CombatIdle = {"animalia/rhino/ai1.wav","animalia/rhino/ai2.wav","animalia/rhino/a5.wav","animalia/rhino/a6.wav"}
elseif self:Health() < 60 then
self.Behavior = VJ_BEHAVIOR_PASSIVE
self.SoundTbl_CombatIdle = {"animalia/rhino/p1.wav","animalia/rhino/p2.wav","animalia/rhino/p3.wav","animalia/rhino/p4.wav","animalia/rhino/p5.wav"}
end
end