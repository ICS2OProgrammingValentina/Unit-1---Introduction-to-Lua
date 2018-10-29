-----------------------------------------------------------------------------------------
-- Title: Physics and Collisions
-- Name: Valentina G
-- Course: ICS2O
-----------------------------------------------------------------------------------------

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()
----------------------------------------------------------------------------------------
--OBJECTS
----------------------------------------------------------------------------------------
-- Ground
local ground = display.newImage("Images/ground.png", display.contentWidth * 2/4, 
display.contentHeight * 4/4)

-- chabnge the width to be the same as the screen
ground.width = display.contentWidth

-- add to physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

----------------------------------------------------------------------------------------

local beam = display.newImage("Images/beam_long.png", 0, 0)

-- set the x and y of the beam
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65

beam.width = display.contentWidth* 5/10
beam.height = display.contentHeight* 1/10

-- rotate the beam
beam:rotate(45)

-- send beam back a layer
beam:toBack()

-- add to physics
physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

-- create background
local bkg = display.newImage("Images/bkg.png", 0, 0)
	
	--set the x and y position
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	bkg.width = display.contentWidth
	bkg.height = display.contentHeight

	-- send back
	bkg:toBack()

----------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------

-- create the first ball
local function firstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.2, bounce=1.0, radius=25})
end

---------------------------------------------------------------------------------------

local function secondBall()
	--create 2 ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball2, {density=2.0, friction=0.5, bounce=0.3, radius=12.5})

	ball2:scale(0.5, 0.5)

end

----------------------------------------------------------------------------------------

local function thirdBall()
	-- create third ball
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)

	-- add tho physics
	physics.addBody(ball3, {density=1.0, friction=0.7, bounce=0.5, radius=50})

	ball3:scale(2, 2)
end

-----------------------------------------------------------------------------------------
--TIMER DELAYS - call each function after the given time
-----------------------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
timer.performWithDelay( 1000, thirdBall)
