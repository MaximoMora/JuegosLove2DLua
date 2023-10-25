--Objeto del Jugador

PlayerParent = {
  x = 0,
  y = 0,
  subx = 0,
  suby = 0,
  subpix = 4,
  movspeed = 20,
  maxspeed = 175,
  Desmov = 15,
  hsp = 0,
  vsp = 0,
  color = {255,0,0}, --color rgb
  state = 0 --Estados; 0- idle; 1- walk; 2- run;
}

--Constructor
function PlayerParent:new(_O)
  _O = _O or {}
  setmetatable(_O,self)
  self.__index  = self
  return _O
end
--
function PlayerParent:moving(_dt)
  local KHP = 0 
  local KVP = 0 
  
  --if KHP = 0 and KVP = 0
  
  
  if love.keyboard.isDown("right") then
    KHP = 1
  elseif  love.keyboard.isDown("left") then
    KHP = -1
  else
    KHP = 0
  end
  
  if love.keyboard.isDown("down") then
    KVP = 1
  elseif love.keyboard.isDown("up") then
    KVP = -1
  else
    KVP = 0 
  end
  
  ---if love.keyboard.isDown("c") then
    
  --  if self.movspeed == math.minmax(1,10, self.movspeed) then
  --    self.movspeed = self.movspeed + (3/4) * _dt
  --    self.movspeed = math.minmax(1,10, self.movspeed)
  --  end
  
  --else
  --  self.movspeed = 1
  --end
  
  
  --MOVIMIENTO HORIZONTAL
  if self.hsp == math.minmax(-self.maxspeed,self.maxspeed, self.hsp) and KHP ~= 0 then
    
    self.hsp = self.hsp + KHP * self.movspeed  --velocidad horizontal
    self.hsp = math.minmax(-self.maxspeed,self.maxspeed, self.hsp)
  
  elseif self.hsp ~= math.minmax(-self.Desmov,self.Desmov, self.hsp) and KHP == 0 then
    
    self.hsp = self.hsp - self.Desmov*math.bool(self.hsp) 
  else 
    self.hsp = 0
    self.subx = math.floor(self.x*self.subpix)
  end
  
  --MOVIMIENTO VERTICAL
  if self.vsp == math.minmax(-self.maxspeed,self.maxspeed, self.vsp) and KVP ~= 0 then
    
    self.vsp = self.vsp + KVP * self.movspeed  --velocidad horizontal
    self.vsp = math.minmax(-self.maxspeed,self.maxspeed, self.vsp)
  
  elseif self.vsp ~= math.minmax(-self.Desmov,self.Desmov, self.vsp) and KVP == 0 then
    
    self.vsp = self.vsp - self.Desmov*math.bool(self.vsp) 
  else 
    self.vsp = 0
    self.suby = math.floor(self.y*self.subpix)
  end
  
  self.subx = self.subx + self.hsp * _dt
  self.suby = self.suby + self.vsp * _dt
  
  if love.keyboard.isDown("c") then
    self.hsp = 500 * math.bool(self.hsp)
  end
  
  
  self.x = math.floor(self.subx/self.subpix)
  self.y = math.floor(self.suby/self.subpix)

end

function PlayerParent:setSprite(_spritesheet)
  
end
function PlayerParent:Draw()
  
end
function PlayerParent:debUg()
  love.graphics.print("X = "..self.x,0,0)
  love.graphics.print("Y = "..self.y,0,16)
  love.graphics.print("subX = "..self.subx,0,32)
  love.graphics.print("subY = "..self.suby,0,48)
  love.graphics.print("speed = "..self.movspeed,0,64)
  love.graphics.print("hsp = "..self.hsp,0,80)
  love.graphics.print("vsp = "..self.vsp,0,96)
  love.graphics.print("speed = "..self.movspeed,0,112)
  love.graphics.setColor(PlayerParent.color)
  love.graphics.rectangle("fill", self.x,self.y, 32,32)

end