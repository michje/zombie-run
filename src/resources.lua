local resources = {}

function resources:loadImages()
      
  sprites = {}
  sprites.player = love.graphics.newImage('sprites/player.png')
  sprites.bullet = love.graphics.newImage('sprites/bullet.png')
  sprites.zombie = love.graphics.newImage('sprites/zombie.png')
  sprites.background = love.graphics.newImage('sprites/background.png')  

end

function resources:loadSounds()
  	gunshotSound = love.audio.newSource("sounds/short-gunshot.wav", "static");
    introMusic = love.audio.newSource("sounds/The Plague.mp3", "stream");introMusic:setLooping(true)
    deadMusic = love.audio.newSource("sounds/Zombie Garden.mp3", "stream");deadMusic:setLooping(true)
end

function resources:loadFonts()
  myFont = love.graphics.newFont(40)
  smallFont = love.graphics.newFont('fonts/font.ttf', 16)
  largeFont = love.graphics.newFont('fonts/font.ttf', 32)
  scoreFont = love.graphics.newFont('fonts/font.ttf', 64)
end

return resources