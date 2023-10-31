--Main Love2d

dofile("OtherMath.lua")
--dofile("Collision.lua")
dofile("physicalObj.lua")
dofile("Player.lua")

function love.load()
  love.window.setTitle("Juego Del Mate")
  love.window.setMode(480, 272)
  --love.window.setMode(240,160)
  --love.window.setMode(320,240)
  --love.window.setMode(640,480)
  --love.window.setMode(256,192)
  Jugador = PlayerObj:new()
  Jugador:Poset(475,200)
end

function love.update(dt)
  Jugador:moving(dt)
  
end

function love.draw()
  Jugador:Draw()
  Jugador:debUg()
end
