--Objeto del Jugador

PlayerParent = {
  x = 0, --posicion x
  y = 0, --posicion x
  x2 = 16,
  y2 = 32,
  subx = 0, --subposicion x
  suby = 0, --subposicion x
  subpix = 6, --cantidad de subpixeles necesarios para llegar a 1 pixel
  movspeed = 20, --velocidad de movmiento en spx
  maxspeed = 1185, --velocidad maxima
  Desmov = 145, --desaleración
  hsp = 0, --velocidad horizontal
  vsp = 0, --velocidad vertical
  state = 0 --Estados; 0- idle; 1- walk; 2- run;
}

--Constructor
function PlayerParent:new(_O)
  _O = _O or {}
  setmetatable(_O,self)
  self.__index  = self
  return _O
end


--Movimiento del Jugador
function PlayerParent:moving(_dt)
  
  --establecer Mask/Hitbox del personaje
  self.Mask = set_mask(self.x,self.y,self.x2,self.y2)
  
  --direccion de los teclados
  local KHP = 0 --horizontal
  local KVP = 0 --vertical
  local hsp2 = self.hsp * _dt
  local vsp2 = self.vsp * _dt
  
  --if KHP = 0 and KVP = 0
  
  --Horizontal
  if love.keyboard.isDown("right") then
    KHP = 1
  elseif  love.keyboard.isDown("left") then
    KHP = -1
  end
  
  --Vertical
  if love.keyboard.isDown("down") then
    KVP = 1
  elseif love.keyboard.isDown("up") then
    KVP = -1
  end
  
  --MOVIMIENTO HORIZONTAL
  -- cuando se mueve
  if self.hsp == math.minmax(-self.maxspeed,self.maxspeed, self.hsp) and KHP ~= 0 then
    
    self.hsp = self.hsp + KHP * self.movspeed  
    self.hsp = math.minmax(-self.maxspeed,self.maxspeed, self.hsp)
  
  --cuando se deja de mover y empieza a desaleracionarse
  elseif self.hsp ~= math.minmax(-self.Desmov,self.Desmov, self.hsp) and KHP == 0 then
    
    self.hsp = self.hsp - self.Desmov*math.bool(self.hsp)  * _dt
  else 
  --cuando se acaba su velocidad
    self.hsp = 0
    self.subx = math.floor(self.x*self.subpix+(self.subpix/2)) --redondea el valor para que no sea decimal
  end
  
  --MOVIMIENTO VERTICAL
  
  --lo mismo de arriba pero en vertical
  if self.vsp == math.minmax(-self.maxspeed,self.maxspeed, self.vsp) and KVP ~= 0 then
    
    self.vsp = self.vsp + KVP * self.movspeed  --velocidad horizontal
    self.vsp = math.minmax(-self.maxspeed,self.maxspeed, self.vsp)
  
  elseif self.vsp ~= math.minmax(-self.Desmov,self.Desmov, self.vsp) then
    
    self.vsp = self.vsp - self.Desmov*math.bool(self.vsp)  * _dt
  else 
    self.vsp = 0
    self.suby = math.floor(self.y*self.subpix+(self.subpix/2))
  end
  
  --Colisiones
  if collision_meet(self.Mask , math.floor(hsp2/16), 0 , objSolid) then
    --el coso de abajo (subx) es para cuando las velocidades sean muy altas cosa que no creo que vaya a usar
    --ademas la tengo que pulir mucho
    if self.Mask[3] <= objSolid.Mask[1]+self.x2 then
      self.subx = (objSolid.Mask[1]-self.x2-1) * self.subpix
    elseif self.Mask[1] >= objSolid.Mask[3] then
      self.subx = (objSolid.Mask[3]+1) * self.subpix
      
    end
    self.hsp = 0
     --hace que no pueda atravesar la pared
    
  end
  -- lo mismo de arriba pero en horizontal
  if collision_meet(self.Mask,0,math.floor(vsp2*16),objSolid) then
    
    if self.Mask[4] <= objSolid.Mask[2]+self.y2 and self.Mask[3] <= objSolid.Mask[1] then
      self.suby = (objSolid.Mask[2]-self.y2-1) * self.subpix
      self.vsp = 0
    elseif self.Mask[2] >= objSolid.Mask[4] then
      self.suby = (objSolid.Mask[4]+1) * self.subpix
      self.vsp = 0
    end
    
    
    
  end
  
  
  
  --aumento de la velocidad
  self.subx = self.subx + hsp2
  self.suby = self.suby + vsp2
  
  
  --un dash feo
  if love.keyboard.isDown("c") then
    self.hsp = 500 * math.bool(self.hsp)
  end
  
  --convercion de subpixel a pixel
  self.x = math.floor(self.subx/self.subpix)
  self.y = math.floor(self.suby/self.subpix)

end

--Setea el sprite del jugador
function PlayerParent:setSprite(_spritesheet)
  
end

--Dibujado
function PlayerParent:Draw()
  
--  anim.curTime = anim.curTime + dt
--   if animation.curTime >= animation.duration then
 --       animation.curTime = animation.curTime - animation.duration
 --   end
  love.graphics.setColor(255,0,0,255)
  love.graphics.rectangle("fill", self.x,self.y, self.x2,self.y2)
end

--datos Debug
function PlayerParent:debUg()
  love.graphics.setColor(255,255,255,255)
  love.graphics.print("X = "..self.x,0,0)
  love.graphics.print("Y = "..self.y,0,16)
  love.graphics.print("subX = "..self.subx,0,32)
  love.graphics.print("subY = "..self.suby,0,48)
  love.graphics.print("speed = "..self.movspeed,0,64)
  love.graphics.print("hsp = "..self.hsp,0,80)
  love.graphics.print("vsp = "..self.vsp,0,96)
  love.graphics.print("speed = "..self.movspeed,0,112)
end