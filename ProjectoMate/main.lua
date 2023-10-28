--Main Love2d
dofile("OtherMath.lua")
dofile("Collision.lua")
dofile("Player.lua")

function love.load()
  love.window.setTitle("Juego Del Mate")
  love.window.setMode(480, 272)
  --love.window.setMode(240,160)
  love.window.setFullscreen(false)
  timesa = 0
  Jugador = PlayerParent:new({})
  Solido = objSolid:new({x = 180, y = 180, x2 = 64, y2 = 64 })
end

function love.update(dt)
  Jugador:moving(dt)

end

function love.draw()
  --love.graphics.setColor(0,255,0,255)
  Jugador:Draw()
  Jugador:debUg()
  love.graphics.setColor(0,255,0,255)
  love.graphics.rectangle("fill", Solido.Mask[1] ,Solido.Mask[2], Solido.x2, Solido.y2)
end
