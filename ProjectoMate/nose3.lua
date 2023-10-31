objPhys = {
  --subpixels/pixel
  subPix = 6
}
--Constructor
function objPhys:new(_x,_y,_type,_widht_or_ratio,_heigth,_centerX,_centerY)
  _table = GForms:setRectangle(_x,_y,_widht_or_ratio,_heigth,_centerX,_centerY)
  setmetatable(_table, self)
  self.__index = self
  --set
  --Sub coordinates
  self.x = _x or 0
  self.y = _y or 0
  self.subx = self.x * self.subPix
  self.suby = self.y * self.subPix
  self.boxL = self.x - _centerX
  self.boxR = self.x + _widht - _centerX 
  self.boxT = self.y - _centerY
  self.boxB = self.y + _heigth - _centerY 
  
  return _table
end 


function objPhys:squareCollision(_obj)
  return self.boxL+_x < _obj.boxR and self.boxR+_x > _obj.boxL
  and self.boxT+_y < _obj.boxB and self.boxB+_y > _obj.boxT
end

function objPhys:PlayerCollisionSolid()
  if self.boxL < _obj.boxR then
    self.x = _obj.boxR - (self.CenterX + self.boxW)
    self.subx = self.x * self.subpix
  end
  if self.boxR+_x < _obj.boxL then
    self.x = _obj.boxR - (self.CenterX + self.boxW)
    self.subx = self.x * self.subpix
  end
  
end

--objeto = objPhys:new({},0,0,16,16)
--print(table.concat(objeto:setMask(),"||"))
objPhys = {
  --subpixels/pixel
  subPix = 6
}
--Constructor
function objPhys:new(_x,_y,_type,_widht_or_ratio,_heigth,_centerX,_centerY)
  _table = GForms:setRectangle(_x,_y,_widht_or_ratio,_heigth,_centerX,_centerY)
  setmetatable(_table, self)
  self.__index = self
  --set
  --Sub coordinates
  self.x = _x or 0
  self.y = _y or 0
  self.subx = self.x * self.subPix
  self.suby = self.y * self.subPix
  self.boxL = self.x - _centerX
  self.boxR = self.x + _widht - _centerX 
  self.boxT = self.y - _centerY
  self.boxB = self.y + _heigth - _centerY 
  
  return _table
end 


function objPhys:squareCollision(_obj)
  return self.boxL+_x < _obj.boxR and self.boxR+_x > _obj.boxL
  and self.boxT+_y < _obj.boxB and self.boxB+_y > _obj.boxT
end

function objPhys:PlayerCollisionSolid()
  if self.boxL < _obj.boxR then
    self.x = _obj.boxR - (self.CenterX + self.boxW)
    self.subx = self.x * self.subpix
  end
  if self.boxR+_x < _obj.boxL then
    self.x = _obj.boxR - (self.CenterX + self.boxW)
    self.subx = self.x * self.subpix
  end
  
end

--objeto = objPhys:new({},0,0,16,16)
--print(table.concat(objeto:setMask(),"||"))
