--PhysClass
objPhys = {
  --coordinates
  x = 0,
  y = 0,
  --Widht and Height of HitBox / Mask
  boxW = 0,
  boxH = 0,
  --Center coordinates
  CenterX = 8,
  CenterY = 8,
  --position of the HitBox/mask Sides
  boxL = 0 ,
  boxR = 0 ,
  boxT = 0 ,
  boxB = 0 ,
}
--Constructor
function objPhys:new(_table,_x,_y,_boxw,_boxh)
  _table = _table or {}
  setmetatable(_table, self)
  self.__index = self
  self.x = _x
  self.y = _y
  self.boxW = _boxw
  self.boxH = _boxh
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
    return true
  end
  return false
end

objeto = objPhys:new({},0,0,16,16)
print(table.concat(objeto:setMask(),"||"))
