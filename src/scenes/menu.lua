local game = state:new()

--[[ State ]]--

function game.load(params)
  
  love.graphics.setNewFont(92)
  love.audio.play(introMusic)
  --load
  
end

function game.update(dt)

  --update

end

function game.draw()
  
  local time = love.timer.getTime()
  love.graphics.setFont(largeFont)
  for i = 0, push:getWidth() / sprites.background:getWidth() do
    for j = 0, push:getHeight() / sprites.background:getHeight() do
      love.graphics.draw(sprites.background, i * sprites.background:getWidth(), j * sprites.background:getHeight())
    end
  end

  love.graphics.printf("Press any key to begin!", 0, math.ceil(push:getHeight() / 2), push:getWidth(), "center")

end

function game.unload()
  
  --unload
  
end

--[[ External ]]--

function love.keypressed(key, scancode, isrepeat)
  love.audio.stop(introMusic)
  state:switch("scenes/game", {})
end

--[[ End ]]--

return game