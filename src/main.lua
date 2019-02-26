--//////////////////////////////////--
--//-\\-//-[[- SETTINGS -]]-\\-//-\\--
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--

WWIDTH, WHEIGHT = 1920, 1080 --16/9 aspect ratio
require('mobdebug').start()  -- debugging fix / ZeroBrane Studio
  
STATE_MENU = 1
STATE_INGAME = 2

--//////////////////////////////////--
--//-\\-//-[[- INCLUDES -]]-\\-//-\\--
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--

--Libraries
push = require "lib.push"
screen = require "lib.shack" --Screen effects (shake, rotate, shear, scale)
lem = require "lib.lem" --Events
lue = require "lib.lue" --Hue
state = require "lib.stager" --Scenes and transitions
audio = require "lib.wave" --Audio
trail = require "lib.trail" --Trails
soft = require "lib.soft" --Lerp
ease = require "lib.easy" --Easing
class = require 'lib.class'

--Includes - Custom libraries

resources = require "resources"

--Classes

--///////////////////////////////--
--//-\\-//-[[- SETUP -]]-\\-//-\\--
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--

local os = love.system.getOS()

phoneMode = (os == "iOS" or os == "Android") and true or false --handles mobile platforms
fullscreenMode = phoneMode and true or false --enables fullscreen if on mobile

local windowWidth, windowHeight = love.window.getDesktopDimensions()

if fullscreenMode then
  RWIDTH, RHEIGHT = windowWidth, windowHeight
else
  RWIDTH = windowWidth*.7 RHEIGHT = windowHeight*.7
end

push:setupScreen(WWIDTH, WHEIGHT, RWIDTH, RHEIGHT, {
  fullscreen = fullscreenMode,
  resizable = not phoneMode
})

--///////////////////////////////////--
--//-\\-//-[[- FUNCTIONS -]]-\\-//-\\--
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--

function love.load()
  resources:loadSounds()
  resources:loadImages()
  resources:loadFonts()
  gameState = 1
  screen:setDimensions(push:getDimensions())
  state:switch("scenes/menu", {})
end

function love.update(dt)
  screen:update(dt)
  lue:update(dt)
  soft:update(dt)
  trail:update(dt)
  state:update(dt)
end

function love.draw()
  push:apply("start")
  screen:apply()
  state:draw()
  push:apply("end")
end


function love.keypressed(key, scancode, isrepeat)
  if key == 'escape' then
    -- the function LÖVE2D uses to quit the application
    love.event.quit()
  end 
end



if not phoneMode then
  function love.resize(w, h)
    return push:resize(w, h)
  end
end
