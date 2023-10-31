--Physics
PhysicsObj = {
  x = 0,
  y = 0,
  subPix = 6,
  subx = 0,
  suby = 0,
  centerX = 0,
  centerY = 0
  }

--constructor
function PhysicsObj:new(_table)
  _table = _table or {}
  setmetatable(_table,self)
  self.__index = self
  return _table
end
--distancia
function PhysicsObj:DistanceObject()
  return math.sqrt((math.abs(self.x - self.centerX))^2 + (math.abs(self.y - self.centerY))^2)
end
--setar colision rectangulo
function PhysicsObj:setRectangle(_width,_height)
  self.boxL = self.x - self.centerX
  self.boxR = self.x + _width - self.centerX 
  self.boxT = self.y - self.centerY
  self.boxB = self.y + _height - self.centerY 
end
--setear circulozzzzzzz
function PhysicsObj:setCircle()
 
end
--colision rectangular
function PhysicsObj:CollisionBox(_obj)
  return self.boxL <= _obj.boxR and self.boxR >= _obj.boxL and self.boxT <= _obj.boxB and self.boxB >= _obj.boxT
end



  