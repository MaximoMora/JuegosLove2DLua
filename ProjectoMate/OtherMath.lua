-- funciones que no estan en math de lua

--MinMax
function math.minmax(_min, _max,_x)
  if _x <= _min then
    return _min
  elseif _x >= _max then
    return _max
  else
    return _x
  end
end

function math.bool(_x)
  if _x > 0 then
    return 1
  elseif _x < 0 then
    return -1
  else
    return 0
  end
end