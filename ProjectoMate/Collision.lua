--funciones de colisiones

-- para setear una hitbox
function set_mask(_x1,_y1,_x2,_y2)
  local xc = _x1 + _x2
  local yc = _y1 + _y2
  local _r = {_x1,_y1,xc,yc}
  return _r
end

-- deteccion de colision simple
--collision_meet(Mask,suma para la posicion x(0 si es directa), lo mismo que _py pero con y, objeto a revisar)
function collision_meet(_mk,_px,_py,_otherobj)
  if  _mk[1]+_px<= _otherobj.Mask[3] and _mk[3]+_px >= _otherobj.Mask[1] 
  and _mk[2]+_py<= _otherobj.Mask[4] and _mk[4]+_py >= _otherobj.Mask[2] then
    --verifica las posiciones de las hitbox con la del otro objeto
    return true
  end
  return false
end
--padre de los solidos
objSolid = {
  x = 0,
  y = 0,
  x2= 0,
  y2= 0
}
--constructor
function objSolid:new(_O)
  _O = _O or {}
  setmetatable(_O,self)
  self.__index = self
  self.Mask = set_mask(_O.x,_O.y,_O.x2,_O.y2)
  return _O
end