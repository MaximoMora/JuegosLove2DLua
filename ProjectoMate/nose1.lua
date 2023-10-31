
function PlayerObj:moving(_dt)
  --direccion de los teclados
  
  local h1 = 0 ; if love.keyboard.isDown("right")then h1 = 1 end
  local h2 = 0 ; if love.keyboard.isDown("left") then h2 = 1 end
  local v1 = 0 ; if love.keyboard.isDown("down") then v1 = 1 end
  local v2 = 0 ; if love.keyboard.isDown("up")   then v2 = 1 end
  
  local KHP = h1 - h2 --horizontal
  local KVP = v1 - v2 --vertical
  
  --MOVIMIENTO HORIZONTAL
  -- cuando se mueve
  if self.hsp == math.minmax(-self.maxspeed,self.maxspeed, self.hsp) and KHP ~= 0 then
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
  if self.vsp == math.minmax(-self.maxspeed,self.maxspeed, self.vsp) and KVP ~= 0 then
    self.vsp = self.vsp + KVP * self.movspeed * _dt
    self.vsp = math.minmax(-self.maxspeed,self.maxspeed, self.vsp)
  elseif self.vsp ~= math.minmax(-self.Desmov,self.Desmov, self.vsp) then
    self.vsp = self.vsp - self.Desmov*math.bool(self.vsp)  * _dt * 10
  else 
    self.vsp = 0 ; self.suby = math.floor(self.y*self.subPix+(self.subPix/2)) 
  end
  
  --aumento de la velocidad
  self.subx = self.subx + math.floor(self.hsp) ; self.suby = self.suby + math.floor(self.vsp)
  
  --convercion de subpixel a pixel
  self.x = math.floor(self.subx/self.subPix) ; self.y = math.floor(self.suby/self.subPix)
  --self :maskSquareUpdate()
end

--Setea el sprite del jugador
function PlayerObj:setSprite(_spritesheet)
  
end

--Dibujado
function PlayerObj:Draw()
  
--  anim.curTime = anim.curTime + dt
--   if animation.curTime >= animation.duration then
 --       animation.curTime = animation.curTime - animation.duration
 --   end
 --love.graphics.setColor(255,0,0,255)
 --love.graphics.rectangle("fill",self.boxL ,self.boxT, self.boxW,self.boxH)
 --love.graphics.setColor(255,255,255,255)
 --love.graphics.line(self.boxL,self.y,self.boxR,self.y)
 --love.graphics.line(self.x,self.boxT,self.x,self.boxB)
 
end

--datos Debug
function PlayerObj:debUg()
  
 -- love.graphics.print("X = "..self.x,0,0) ; love.graphics.print("Y = "..self.y,0,16)
 -- love.graphics.print("subX = "..self.subx,0,32) ; love.graphics.print("subY = "..self.suby,0,48)
 -- love.graphics.print("speed = "..self.movspeed,0,64)
 -- love.graphics.print("hsp = "..self.hsp,0,80) ;love.graphics.print("vsp = "..self.vsp,0,96)
end

function PlayerObj:update(_dt)
  -- self :moving(_dt)
end