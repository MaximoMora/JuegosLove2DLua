--Seteo de animaciones
--esto lo vi en un tutorial que me perdi.
function NewAnimation(_image,_w,_h,_duration)
  local anim = {} --crea una tabla llamada anim donde se guardaran los datos
  anim.spriteSheet = _image --la var dentro de anim tomara la imagen
  anim.frames = {} --aqui se guardan los fotogramas
  
  for y = 0, _image:getHeight() - _h, _h do
    for x = 0, _image:getWidth() - _w, _w do
      table.insert(anim.frames, love.graphics.newQuad(x,y,_w,_h, _image:getDimensions()))
    end
  end
  
  anim.duration = _duration or 1
  anim.curTime = 0
  
  return anim
end

sprMate = NewAnimation (love.graphics.newImage("Assets/SprMatesito.png"),32,32,1)


