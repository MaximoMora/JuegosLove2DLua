--funciones de colisiones
GForms = {}




function GForms:setRectangle(_x,_y,_widht,_heigth,_centerX,_centerY)
  table = {}
  setmetatable(table,self)
  self.__index = self
  self.x = _x
  self.y = _y
  self.boxL = self.x - _centerX
  self.boxR = self.x + _widht - _centerX 
  self.boxT = self.y - _centerY
  self.boxB = self.y + _heigth - _centerY 
  return table
  
end

function GForms:setCircle(_x,_y,_ratio,_centerX,_centerY)
  table = {}
  setmetatable(table,self)
  self.__index = self
  self.ratio = _ratio
  self.x = _x or 0
  self.y = _y or 0
  self.distance = math.sqrt(math.abs(self.x - _centerX)^2 + math.abs(self.y - _centerY)^2)
  return table
end

function GForms:newTriangle(_x1,_x2,_x3,_y1,y2,y3)
  
end