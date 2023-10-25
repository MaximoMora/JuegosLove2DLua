--Main Love2d
dofile("OtherMath.lua")
dofile("Player.lua")

function love.load()
  love.window.setMode(480, 272)
  love.window.setFullscreen(false)
  timesa = 0
  Jugador = PlayerParent:new({})
  
end

function love.update(dt)
  Jugador:moving(dt)
end

function love.draw()
  Jugador:debUg()
end
