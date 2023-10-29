--PhysClass
objPhys = {
  --subpixels/pixel
  subPix = 6,
  --Coordinates
  x = 0, y = 0,
  --Sub coordinates
  subx = 0, suby = 0,
  --Widht and Height of HitBox / Mask
  boxW = 0, boxH = 0,
  --Center coordinates
  CenterX = 8, CenterY = 8,
  --position of the HitBox/mask Sides
  boxL = 0, boxR = 0, boxT = 0, boxB = 0

}
--Constructor
function objPhys:new(_table,_x,_y,_boxw,_boxh)
  _table = _table or {}
  
  setmetatable(_table, self)
  self.__index = self
  
  --set
  self.x = _x or 0
  self.y = _y or 0
  self.subx = self.x * self.subPix
  self.suby = self.y * self.subPix
  self.boxW = _boxw or 0
  self.boxH = _boxh or 0 
  
  return _table
end 

function objPhys:MaskUpdate()
  self.boxL = self.x - self.CenterX
  self.boxR = self.x - self.CenterX + self.boxW
  self.boxT = self.y - self.CenterY
  self.boxB = self.y - self.CenterY + self.boxH
  _temp = {self.boxL,self.boxR,self.boxT,self.boxB}
  return _temp
end

function objPhys:BoxCollision(_x,_y,_obj)
  if self.boxL+_x < _obj.boxR and self.boxR+_x > _obj.boxL
  and self.boxT+_y < _obj.boxB and self.boxB+_y > _obj.boxT then
    return
  end
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
