-----------------------------------------------------------------------------------------
-- Name: Valentina G Melendez
-- Title: MovingImages
-- Course: ICS2O/3C
-- This program displays an image that moves across the screen
-----------------------------------------------------------------------------------------

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- global varibles
scrollspeed = 4
scrollspeedO = 2

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- character image with width and height
local octopus = display.newImageRect("Images/octopus.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the image to be transparent
octopus.alpha = 1

-- flip the octopus
octopus.xScale = -1

-- set the intitial x and y position of the beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- set the initial x and y position of the octopus
octopus.x =  display.contentWidth * 3/3
octopus.y =  display.contentHeight * 2/3

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollspeed
	-- change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end

-- moveship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the octopus
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	octopus.x = octopus.x - scrollspeedO
	-- change the transparency of the ship every time it moves so that it fades out
	octopus.alpha = octopus.alpha - 0.00000000001
end

-- moveship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)