--Objeto del Jugador
PlayerObj = PhysicsObj:new({
    maxspeed = 4, Desmov = 4, movspeed = 10,
    hsp = 0, vsp = 0,
    boxW = 40, boxH = 50,
    centerX = 20,
    centerY = 25,
    dir = "up", --1 derecha,2 arriba,3 izquierda, 4 abajo
    state = 0,
    dashx =  0,
    dashy =  0
    })


function PlayerObj:new(_table)
  _table = {} or PhysicsObj:new(_table)
  setmetatable(_table,self)
  self.__index = self
  return _table
end

function PlayerObj:Poset(_x,_y)
  self.x = _x
  self.y = _y
end

function PlayerObj:Dashing()
  self.state = 1
  if     dir == "up"   then self.dashx =  0 ; self.dashy = -1
  elseif dir == "down" then self.dashx =  0 ; self.dashy =  1
  elseif dir == "left" then self.dashx = -1 ; self.dashy =  0
  elseif dir == "right"then self.dashx =  1 ; self.dashy =  0
  end

  self.hsp = 1999 * self.dashx
  self.vsp = 1888 * self.dashy
end

function PlayerObj:StateControl()
  if self.state == 0 then
    self.maxspeed = 4
  elseif self.state == 1 then
    self.maxspeed = 10000
  end
end

function PlayerObj:moving(_dt)
  --direccion de los teclados
  self:StateControl()
  self.state = 0
  local h1 = 0 ; if love.keyboard.isDown("right")then h1 = 1 self.dir = "right"end
  local h2 = 0 ; if love.keyboard.isDown("left") then h2 = 1 self.dir = "left" end
  local v1 = 0 ; if love.keyboard.isDown("down") then v1 = 1 self.dir = "down" end
  local v2 = 0 ; if love.keyboard.isDown("up")   then v2 = 1 self.dir = "up"   end
  
  local KHP = h1 - h2 --horizontal
  local KVP = v1 - v2 --vertical
  
  --MOVIMIENTO HORIZONTAL
  -- cuando se mueve
  if self.hsp == math.minmax(-self.maxspeed,self.maxspeed, self.hsp) and KHP ~= 0 and self.state == 0 then
    self.hsp = self.hsp + KHP * self.movspeed  * _dt
    self.hsp = math.minmax(-self.maxspeed,self.maxspeed, self.hsp)
  --cuando se deja de mover y empieza a desaleracionarse
  elseif self.hsp ~= math.minmax(-self.Desmov,self.Desmov, self.hsp) and KHP == 0 then
    self.hsp = self.hsp - self.Desmov*math.bool(self.hsp)  * _dt
  else 
  --cuando se acaba su velocidad
    self.hsp = 0
    self.subx = math.floor(self.x*self.subPix+(self.subPix/2)) --redondea el valor para que no sea decimal
  end
  
  --MOVIMIENTO VERTICAL
  
  --lo mismo de arriba pero en vertical
  if self.vsp == math.minmax(-self.maxspeed,self.maxspeed, self.vsp) and KVP ~= 0 and self.state == 0 then
    self.vsp = self.vsp + KVP * self.movspeed * _dt
    self.vsp = math.minmax(-self.maxspeed,self.maxspeed, self.vsp)
  elseif self.vsp ~= math.minmax(-self.Desmov,self.Desmov, self.vsp) then
    self.vsp = self.vsp - self.Desmov*math.bool(self.vsp)  * _dt * 10
  else
    self.vsp = 0 ; self.suby = math.floor(self.y*self.subPix+(self.subPix/2)) 
  end
  
  if love.keyboard.isDown("a") then
    self :Dashing()
  end
  
  --aumento de la velocidad
  self.subx = self.subx + math.floor(self.hsp) ; self.suby = self.suby + math.floor(self.vsp)
  
  --convercion de subpixel a pixel
  self.x = math.floor(self.subx/self.subPix) ; self.y = math.floor(self.suby/self.subPix)
  self :setRectangle(self.boxW,self.boxH)
end

function PlayerObj:Draw()
  
--  anim.curTime = anim.curTime + dt
--   if animation.curTime >= animation.duration then
 --       animation.curTime = animation.curTime - animation.duration
 --   end
 love.graphics.setColor(255,0,0,255)
 love.graphics.rectangle("fill",self.boxL ,self.boxT, self.boxW,self.boxH)
 love.graphics.setColor(255,255,255,255)
 love.graphics.line(self.boxL,self.y,self.boxR,self.y)
 love.graphics.line(self.x,self.boxT,self.x,self.boxB)
 
end

function PlayerObj:debUg()
  
  love.graphics.print("X = "..self.x,0,0) ; love.graphics.print("Y = "..self.y,0,16)
  love.graphics.print("subX = "..self.subx,0,32) ; love.graphics.print("subY = "..self.suby,0,48)
  love.graphics.print("speed = "..self.maxspeed,0,64)
  love.graphics.print("hsp = "..self.hsp,0,80) ;love.graphics.print("vsp = "..self.vsp,0,96)
  love.graphics.print("dir = "..self.dir,0,112)
  love.graphics.print("state = "..self.state,0,128)
  
end
