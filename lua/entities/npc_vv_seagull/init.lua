AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = {"models/animalia/seagull.mdl"}
ENT.StartHealth = 5
ENT.HullType = HULL_TINY
ENT.MovementType = VJ_MOVETYPE_GROUND
ENT.Aerial_FlyingSpeed_Calm = 230
ENT.AA_GroundLimit = 400
ENT.AA_MinWanderDist = 3000
ENT.AnimTbl_Walk = {ACT_WALK,ACT_WALK,ACT_WALK,ACT_RUN}
ENT.Aerial_AnimTbl_Calm = {ACT_FLY}
ENT.Aerial_AnimTbl_Alerted = {ACT_FLY}
ENT.Behavior = VJ_BEHAVIOR_PASSIVE_NATURE
ENT.BloodColor = "Red"
ENT.BloodDecalDistance = 1
ENT.CanOpenDoors = false

ENT.SoundTbl_Idle = {"animalia/seagull/i1.wav","animalia/seagull/i2.wav","animalia/seagull/i3.wav","animalia/seagull/i4.wav","animalia/seagull/i5.wav","animalia/seagull/i6.wav","animalia/seagull/i7.wav","animalia/seagull/i8.wav","animalia/seagull/i9.wav","animalia/seagull/p1.wav","animalia/seagull/p2.wav","animalia/seagull/p3.wav","animalia/seagull/p4.wav","animalia/seagull/p5.wav","animalia/seagull/p6.wav","animalia/seagull/p7.wav"}
ENT.SoundTbl_Pain = {"animalia/seagull/p1.wav","animalia/seagull/p2.wav","animalia/seagull/p3.wav","animalia/seagull/p4.wav","animalia/seagull/p5.wav","animalia/seagull/p6.wav","animalia/seagull/p7.wav"}
ENT.SoundTbl_Death = {"animalia/seagull/p1.wav","animalia/seagull/p2.wav","animalia/seagull/p3.wav","animalia/seagull/p4.wav","animalia/seagull/p5.wav","animalia/seagull/p6.wav","animalia/seagull/p7.wav"}
ENT.SoundTbl_Alert = {"animalia/seagull/p1.wav","animalia/seagull/p2.wav","animalia/seagull/p3.wav","animalia/seagull/p4.wav","animalia/seagull/p5.wav","animalia/seagull/p6.wav","animalia/seagull/p7.wav"}

-- Custom
ENT.Bird_Mode = 0 -- 0 = Ground, 1 = Air
ENT.Bird_LandingType = 0 -- 0 = None, 1 = Normal
ENT.Bird_LandingPos = nil
ENT.Bird_FlyAnimation = ACT_FLY
ENT.Bird_ModeChangeT = 0

function ENT:CustomOnInitialize()
self:SetCollisionBounds(Vector(7, 7, 10), Vector(-7, -7, 0))
end

function ENT:ChangeMode(mode)
	if self.Dead then return end
	if self:Health() <= 0 then return end
	if CurTime() < self.Bird_ModeChangeT then return end
	local lastMode = self.Bird_Mode
	if mode == 0 then -- Ground
		self.Bird_LandingType = 0
		self.Bird_LandingPos = nil
		self.AnimTbl_IdleStand = {ACT_IDLE}
self.BreathSoundLevel = 1
		self:VJ_ACT_PLAYACTIVITY("land",true,false,false)
		timer.Simple(self:DecideAnimationLength("land", false),function()
			if IsValid(self) then
				self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
				self.IdleAlwaysWander = false
				self.ConstantlyFaceEnemy = false
				self.NoChaseAfterCertainRange = false
				self.HasMeleeAttack = false
				self.HasRangeAttack = false
				self:SetMaxYawSpeed(15)
				self.TurningSpeed = 9
self.BreathSoundLevel = 1
			end
		end)
	elseif mode == 1 then -- Air
		self.Bird_LandingType = 0
		self.Bird_LandingPos = nil
		self.AnimTbl_IdleStand = {ACT_FLY}
		self:VJ_ACT_PLAYACTIVITY(lastMode == 2 && ACT_IDLE or ACT_IDLE,true,false,false)
		timer.Simple(self:DecideAnimationLength(lastMode == 2 && ACT_IDLE or ACT_IDLE, false),function()
			if IsValid(self) then
				self:DoChangeMovementType(VJ_MOVETYPE_AERIAL)
				self.IdleAlwaysWander = true
				self.ConstantlyFaceEnemy = false
				self.NoChaseAfterCertainRange = true
				self:SetMaxYawSpeed(12)
				self.TurningSpeed = 12
self.SoundTbl_Breath = {"animalia/flap1.wav","animalia/flap2.wav","animalia/flap3.wav"}
self.BreathSoundLevel = 55
			end
		end)
	end
	self.Bird_Mode = mode
	self.Bird_ModeChangeT = CurTime() + (IsValid(self.VJ_TheController) && 4 or math.Rand(15,35))
end

function ENT:HandleModeChanging(mode,pos,cont)
	if mode == 1 && CurTime() > self.Bird_ModeChangeT && (IsValid(cont) && cont:KeyDown(IN_JUMP) or true) then
		if self.Bird_LandingType == 0 && self.Bird_LandingPos == nil then
			if !self.Bird_LandingPos then
				local ceiling = math.random(1,10) == 1
				local pos = self:GetLandingPos(ceiling)
				if pos then
					self.Bird_LandingPos = pos
					self.Bird_LandingType = ceiling && 2 or 1
				end
			end
		else
			local landType = self.Bird_LandingType
			self:AA_MoveTo(self.Bird_LandingPos,true,"Calm",{FaceDest=true,FaceDestTarget=false,IgnoreGround=true})
			local tr = util.TraceLine({start = pos,endpos = pos +Vector(0,0,(landType == 1 && -35 or 75)),filter = self})
			if tr.Hit /*&& tr.HitPos:Distance(pos) <= 35*/ then
				if landType == 2 then
					self:SetPos(tr.HitPos +tr.HitNormal *35)
				end
				self:ChangeMode(landType == 1 && 0 or 2)
			end
		end
	elseif mode != 1 && CurTime() > self.Bird_ModeChangeT && (!IsValid(cont) && math.random(1,30) == 1 or IsValid(cont) && cont:KeyDown(IN_JUMP)) then
		self:ChangeMode(1)
	end
end

function ENT:CustomOnThink()
	local cont = self.VJ_TheController
	local ene = self:GetEnemy()
	local pos = self:GetPos()
	local waypoint = pos + self:GetVelocity():Angle():Forward()*50
	local mode = self.Bird_Mode -- 0 = Ground, 1 = Air
	if mode == 1 then
		self.Bird_FlyAnimation = pos.z <= waypoint.z && ACT_FLY or ACT_FLY
	end
	if IsValid(ene) then
		self.Aerial_AnimTbl_Calm = self.LatestEnemyDistance <= self.RangeDistance && ACT_FLY or self.Bird_FlyAnimation
		if IsValid(cont) then
			self:HandleModeChanging(mode, pos, cont)
		elseif mode != 1 && !IsValid(cont) then
			self:ChangeMode(1)
		end
	else
		self.Aerial_AnimTbl_Calm = self.Bird_FlyAnimation
		self:HandleModeChanging(mode, pos, cont)
	end
-- Pooping code
if not self.NextSpawnTime then
    self.NextSpawnTime = CurTime() + math.random(50,200)
end
if CurTime() >= self.NextSpawnTime then
    local object = ents.Create("obj_vv_birdshit")
    object:SetPos(self:LocalToWorld(Vector(0, 0, -11)))
    object:SetAngles(self:GetAngles())
    object:Spawn()
    self.NextSpawnTime = CurTime() + math.random(50,200)
end
end

function ENT:GetLandingPos(ceiling)
	local ang = self:GetAngles() +AngleRand()
	local filt = {self,self.VJ_TheController}
	if ceiling then
		ang.p = -70
		local tr1 = util.TraceLine({start = self:GetPos(),endpos = self:GetPos() +ang:Forward() *32000,filter = filt})
		return tr1.MatType && tr1.MatType != 88 && tr1.HitPos +tr1.Normal *5
	end
	ang.p = 35
	local pos = self:GetPos() +(self:GetVelocity() *ang:Forward() *0.1) *ang:Forward()

	local tr1 = util.TraceLine({start = pos,endpos = pos +ang:Forward() *32000,filter = filt})
	local tr1Pos = tr1.HitPos -tr1.Normal *100
	local tr2 = util.TraceLine({start = tr1Pos,endpos = tr1Pos +Vector(0,0,-120),filter = filt})

	return tr2.HitWorld && tr2.MatType && tr2.MatType != 88 && tr2.HitPos
end

function ENT:AA_StopMoving()
	if IsValid(self.VJ_TheController) && self.Bird_LandingPos != nil then return end
	if self:GetVelocity():Length() > 0 then
		self.AA_CurrentMoveMaxSpeed = 0
		self.AA_CurrentMoveTime = 0
		self.AA_CurrentMoveType = 0
		self.AA_CurrentMovePos = nil
		self.AA_CurrentMovePosDir = nil
		self.AA_CurrentMoveDist = -1
		self:SetLocalVelocity(Vector(0,0,0))
	end
end