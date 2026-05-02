AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/elephant.mdl"}
ENT.StartHealth = 800
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 1
ENT.BloodColor = "Red"
ENT.PlayerFriendly = true
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 1
ENT.FriendsWithAllPlayerAllies = true
ENT.FollowPlayer = false
ENT.TurningSpeed = 5
ENT.ConstantlyFaceEnemy = false
ENT.MoveOutOfFriendlyPlayersWay = false
ENT.VJ_IsHugeMonster = true
ENT.Immune_Physics = true
ENT.SightDistance = 2500
ENT.CanOpenDoors = false

ENT.FootStepTimeWalk = 1
ENT.FootStepTimeRun = 0.5
ENT.HasWorldShakeOnMove = true
ENT.NextWorldShakeOnRun = 0.95
ENT.NextWorldShakeOnWalk = false
ENT.WorldShakeOnMoveRadius = 300
ENT.WorldShakeOnMoveDuration = 0.05
ENT.SoundTbl_FootStep = {"animalia/elephant/step1.wav","animalia/elephant/step2.wav"}

ENT.MeleeAttackDamage = 200
ENT.MeleeAttackDistance = 150
ENT.MeleeAttackDamageDistance = 240
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.HasMeleeAttackKnockBack = true
ENT.MeleeAttackKnockBack_Up1 = 300
ENT.MeleeAttackKnockBack_Up2 = 300
ENT.SoundTbl_BeforeMeleeAttack = {"animalia/elephant/alert3.wav","animalia/elephant/alert4.wav","animalia/elephant/hurt3.wav","animalia/elephant/hurt4.wav","animalia/elephant/hurt5.wav","animalia/elephant/hurt6.wav","animalia/elephant/hurt7.wav","animalia/elephant/idle9.wav","animalia/elephant/idle11.wav"}
ENT.SoundTbl_MeleeAttack = {"npc/zombie/claw_strike1.wav","npc/zombie/claw_strike2.wav","npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav","npc/zombie/claw_miss2.wav"}
ENT.BeforeMeleeAttackSoundChance = 2

ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {"die"}
ENT.DeathAnimationTime = 4.7
ENT.SoundTbl_Death = {"animalia/elephant/death1.wav","animalia/elephant/death2.wav"}
ENT.SoundTbl_Pain = {"animalia/elephant/hurt3.wav","animalia/elephant/hurt4.wav","animalia/elephant/hurt5.wav","animalia/elephant/hurt6.wav","animalia/elephant/hurt7.wav","animalia/elephant/hurt8.wav","animalia/elephant/hurt9.wav","animalia/elephant/hurt10.wav"}

ENT.SoundTbl_Idle = {"animalia/elephant/idle1.wav","animalia/elephant/idle2.wav","animalia/elephant/idle3.wav","animalia/elephant/idle4.wav","animalia/elephant/idle5.wav","animalia/elephant/idle6.wav","animalia/elephant/idle7.wav","animalia/elephant/idle8.wav","animalia/elephant/idle9.wav","animalia/elephant/idle10.wav","animalia/elephant/idle11.wav","animalia/elephant/idle12.wav","animalia/elephant/idle13.wav","animalia/elephant/idle14.wav","animalia/elephant/idle15.wav"}
ENT.SoundTbl_CombatIdle = {"animalia/elephant/alert3.wav","animalia/elephant/alert4.wav","animalia/elephant/hurt3.wav","animalia/elephant/hurt4.wav","animalia/elephant/hurt5.wav","animalia/elephant/hurt6.wav","animalia/elephant/hurt7.wav","animalia/elephant/idle9.wav","animalia/elephant/idle11.wav"}
ENT.SoundTbl_Alert = {"animalia/elephant/alert1.wav","animalia/elephant/alert2.wav","animalia/elephant/alert3.wav","animalia/elephant/alert4.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"animalia/elephant/alert1.wav","animalia/elephant/alert2.wav","animalia/elephant/alert3.wav","animalia/elephant/alert4.wav"}

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(100, 100, 220), Vector(-100, -100, 0))
self:SetSkin(math.random(0,2))
end

function ENT:MultipleMeleeAttacks()
if math.random(1, 2) == 1 then
self.AnimTbl_MeleeAttack = {"attack1"}
self.TimeUntilMeleeAttackDamage = 1.35
else
self.AnimTbl_MeleeAttack = {"attack2"}
self.TimeUntilMeleeAttackDamage = 1.2
end
end

function ENT:CustomOnThink()
-- Animation code
if not self.NextAnimTime then
    self.NextAnimTime = CurTime() + math.random(20,70)
end
if CurTime() >= self.NextAnimTime && self.Alerted == false then
    self:VJ_ACT_PLAYACTIVITY({"idle_inactive"},true,false,false)
    self.NextAnimTime = CurTime() + math.random(20,70)
end
end