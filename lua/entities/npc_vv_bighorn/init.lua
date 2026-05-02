AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/bighorn.mdl"}
ENT.StartHealth = 85
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 1
ENT.BloodColor = "Red"
ENT.PlayerFriendly = true
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 1
ENT.FriendsWithAllPlayerAllies = true
ENT.FollowPlayer = false
ENT.ConstantlyFaceEnemy = false
ENT.MoveOutOfFriendlyPlayersWay = false
ENT.SightDistance = 2000
ENT.CanOpenDoors = false
ENT.AnimTbl_Walk = {ACT_WALK,ACT_WALK,ACT_WALK,ACT_RUN}
ENT.AllowMovementJumping = true
ENT.MaxJumpLegalDistance = VJ_Set(120, 120)
ENT.SightDistance = 1500
ENT.SightAngle = 180

ENT.SoundTbl_FootStep = {"animalia/step/hoof1.wav","animalia/step/hoof2.wav","animalia/step/hoof3.wav","animalia/step/hoof4.wav"}
ENT.FootStepTimeWalk = 0.65
ENT.FootStepTimeRun = 0.45
ENT.FootStepSoundLevel = 55

ENT.MeleeAttackDamage = 12
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 30
ENT.MeleeAttackDamageAngleRadius = 20
ENT.TimeUntilMeleeAttackDamage = 1.35
ENT.SoundTbl_BeforeMeleeAttack = {"animalia/bighorn/a1.wav","animalia/bighorn/a2.wav","animalia/bighorn/a3.wav","animalia/bighorn/i1.wav","animalia/bighorn/i2.wav","animalia/bighorn/i3.wav","animalia/bighorn/i8.wav"}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav","physics/body/body_medium_impact_hard2.wav","physics/body/body_medium_impact_hard3.wav","physics/body/body_medium_impact_hard4.wav","physics/body/body_medium_impact_hard5.wav","physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav","npc/zombie/claw_miss2.wav"}
ENT.MeleeAttackSoundLevel = 50
ENT.MeleeAttackMissSoundLevel = 65

ENT.SoundTbl_Death = {"animalia/bighorn/p1.wav","animalia/bighorn/p2.wav","animalia/bighorn/i1.wav","animalia/bighorn/i2.wav","animalia/bighorn/i5.wav","animalia/bighorn/i6.wav"}
ENT.SoundTbl_Pain = {"animalia/bighorn/p1.wav","animalia/bighorn/p2.wav","animalia/bighorn/i1.wav","animalia/bighorn/i2.wav","animalia/bighorn/i5.wav","animalia/bighorn/i6.wav"}
ENT.SoundTbl_Idle = {"animalia/bighorn/i1.wav","animalia/bighorn/i2.wav","animalia/bighorn/i3.wav","animalia/bighorn/i5.wav","animalia/bighorn/i6.wav","animalia/bighorn/i7.wav","animalia/bighorn/i8.wav"}
ENT.SoundTbl_Alert = {"animalia/bighorn/a1.wav","animalia/bighorn/a2.wav","animalia/bighorn/a3.wav","animalia/bighorn/i1.wav","animalia/bighorn/i2.wav","animalia/bighorn/i3.wav","animalia/bighorn/i8.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"animalia/bighorn/a1.wav","animalia/bighorn/a2.wav","animalia/bighorn/a3.wav","animalia/bighorn/i1.wav","animalia/bighorn/i2.wav","animalia/bighorn/i3.wav","animalia/bighorn/i8.wav"}
ENT.IdleSoundLevel = 95

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(10, 10, 40), Vector(-10, -10, 0))
if math.random(1, 3) == 1 then
self.Brave = 1
else
self.Brave = 2
end
end

function ENT:CustomOnThink()
	if self:Health() > 60 && self.Brave == 1 then
self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
self.SoundTbl_CombatIdle = {"animalia/bighorn/a1.wav","animalia/bighorn/a2.wav","animalia/bighorn/a3.wav","animalia/bighorn/i1.wav","animalia/bighorn/i2.wav","animalia/bighorn/i3.wav","animalia/bighorn/i8.wav"}
	elseif self:Health() < 60 && self.Brave == 1 then
self.Behavior = VJ_BEHAVIOR_PASSIVE
self.SoundTbl_CombatIdle = {"animalia/bighorn/p1.wav","animalia/bighorn/p2.wav","animalia/bighorn/a2.wav","animalia/bighorn/a3.wav","animalia/bighorn/i1.wav","animalia/bighorn/i2.wav","animalia/bighorn/i3.wav","animalia/bighorn/i5.wav","animalia/bighorn/i6.wav","animalia/bighorn/i8.wav"}
	elseif self.Brave == 2 then
self.Behavior = VJ_BEHAVIOR_PASSIVE
self.SoundTbl_CombatIdle = {"animalia/bighorn/p1.wav","animalia/bighorn/p2.wav","animalia/bighorn/a2.wav","animalia/bighorn/a3.wav","animalia/bighorn/i1.wav","animalia/bighorn/i2.wav","animalia/bighorn/i3.wav","animalia/bighorn/i5.wav","animalia/bighorn/i6.wav","animalia/bighorn/i8.wav"}
end
end