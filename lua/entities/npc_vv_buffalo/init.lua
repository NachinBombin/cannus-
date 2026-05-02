AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/african_buffalo.mdl","models/animalia/african_buffalo_female.mdl"}
ENT.StartHealth = 200
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
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {"bitten_02","hurt"}
ENT.FlinchChance = 1
ENT.NextFlinchTime = 3
ENT.HasMeleeAttack = true

ENT.FootStepTimeRun = 0.4
ENT.SoundTbl_FootStep = {"animalia/step/hoof1.wav","animalia/step/hoof2.wav","animalia/step/hoof3.wav","animalia/step/hoof4.wav"}
ENT.FootStepSoundLevel = 65

ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav","physics/body/body_medium_impact_hard2.wav","physics/body/body_medium_impact_hard3.wav","physics/body/body_medium_impact_hard4.wav","physics/body/body_medium_impact_hard5.wav","physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"animalia/buffalo/i4.wav","animalia/buffalo/i5.wav","animalia/buffalo/i6.wav","animalia/buffalo/i7.wav","animalia/buffalo/i8.wav","animalia/buffalo/i9.wav","animalia/buffalo/i10.wav","animalia/buffalo/i11.wav","animalia/buffalo/i12.wav","animalia/buffalo/i13.wav"}
ENT.MeleeAttackSoundLevel = 55

ENT.SoundTbl_Death = {"animalia/buffalo/d1.wav","animalia/buffalo/d2.wav","animalia/buffalo/d3.wav","animalia/buffalo/d4.wav","animalia/buffalo/p3.wav","animalia/buffalo/p4.wav","animalia/buffalo/p5.wav","animalia/buffalo/p6.wav"}
ENT.SoundTbl_Pain = {"animalia/buffalo/p1.wav","animalia/buffalo/p2.wav","animalia/buffalo/p3.wav","animalia/buffalo/p4.wav","animalia/buffalo/p5.wav","animalia/buffalo/p6.wav"}

ENT.SoundTbl_Idle = {"animalia/buffalo/i1.wav","animalia/buffalo/i2.wav","animalia/buffalo/i3.wav","animalia/buffalo/i4.wav","animalia/buffalo/i5.wav","animalia/buffalo/i6.wav","animalia/buffalo/i7.wav","animalia/buffalo/i8.wav","animalia/buffalo/i9.wav","animalia/buffalo/i10.wav","animalia/buffalo/i11.wav","animalia/buffalo/i12.wav","animalia/buffalo/i13.wav"}
ENT.SoundTbl_CombatIdle = {"animalia/buffalo/i1.wav","animalia/buffalo/i2.wav","animalia/buffalo/i3.wav","animalia/buffalo/i4.wav","animalia/buffalo/i5.wav","animalia/buffalo/i6.wav","animalia/buffalo/i7.wav","animalia/buffalo/i8.wav","animalia/buffalo/i9.wav","animalia/buffalo/i10.wav","animalia/buffalo/i11.wav","animalia/buffalo/i12.wav","animalia/buffalo/i13.wav"}
ENT.SoundTbl_Alert = {"animalia/buffalo/a1.wav","animalia/buffalo/a2.wav","animalia/buffalo/a3.wav","animalia/buffalo/a4.wav","animalia/buffalo/i3.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"animalia/buffalo/a1.wav","animalia/buffalo/a2.wav","animalia/buffalo/a3.wav","animalia/buffalo/a4.wav","animalia/buffalo/i3.wav"}

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(25, 25, 60), Vector(-25, -25, 0))
end

function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	local eneData = self.EnemyData
	if eneData.DistanceNearest > 50 && eneData.DistanceNearest < 70 && !self.PropInteraction_Found then
self.AnimTbl_MeleeAttack = {"attack_a"}
self.MeleeAttackDamage = 24
self.MeleeAttackDistance = 70
self.MeleeAttackDamageDistance = 70
self.MeleeAttackAngleRadius = 50
self.MeleeAttackDamageAngleRadius = 50
self.HasMeleeAttackKnockBack = true
self.MeleeAttackKnockBack_Up1 = 50
self.MeleeAttackKnockBack_Up2 = 50
self.TimeUntilMeleeAttackDamage = 0.6
	elseif math.random(1, 2) == 1 then
self.AnimTbl_MeleeAttack = {"push"}
self.MeleeAttackDamage = 17
self.MeleeAttackDistance = 35
self.MeleeAttackDamageDistance = 70
self.MeleeAttackAngleRadius = 50
self.MeleeAttackDamageAngleRadius = 50
self.HasMeleeAttackKnockBack = false
self.TimeUntilMeleeAttackDamage = 0.3
        else
self.AnimTbl_MeleeAttack = {"joust_attack"}
self.MeleeAttackDamage = 17
self.MeleeAttackDistance = 35
self.MeleeAttackDamageDistance = 70
self.MeleeAttackAngleRadius = 50
self.MeleeAttackDamageAngleRadius = 50
self.HasMeleeAttackKnockBack = false
self.TimeUntilMeleeAttackDamage = 0.25
	end
end

function ENT:CustomOnThink()
if self:Health() > 60 then
self.AnimTbl_Walk = {ACT_WALK}
self.FootStepTimeWalk = 0.34
self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
self.SoundTbl_CombatIdle = {"animalia/buffalo/i1.wav","animalia/buffalo/i2.wav","animalia/buffalo/i3.wav","animalia/buffalo/i4.wav","animalia/buffalo/i5.wav","animalia/buffalo/i6.wav","animalia/buffalo/i7.wav","animalia/buffalo/i8.wav","animalia/buffalo/i9.wav","animalia/buffalo/i10.wav","animalia/buffalo/i11.wav","animalia/buffalo/i12.wav","animalia/buffalo/i13.wav"}
elseif self:Health() < 60 then
self.AnimTbl_Walk = {ACT_WALK_HURT}
self.FootStepTimeWalk = 1
self.Behavior = VJ_BEHAVIOR_PASSIVE
self.SoundTbl_CombatIdle = {"animalia/buffalo/p1.wav","animalia/buffalo/p2.wav","animalia/buffalo/p3.wav","animalia/buffalo/p4.wav","animalia/buffalo/p5.wav","animalia/buffalo/p6.wav"}
end
end