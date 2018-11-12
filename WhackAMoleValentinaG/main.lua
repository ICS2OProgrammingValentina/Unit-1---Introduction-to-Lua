-----------------------------------------------------------------------------------------
-- Title: WhackAMole
-- Name: Valentina
-- Course: ICS2O/3C
-- This program displays a mole that when wacked, the user receives a point
-----------------------------------------------------------------------------------------

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- creating background
display.setDefault("background", 130/255, 120/255, 150/255 )

-- creating mole
local dog = display.newImage("Images/dog.png", 0, 0 )
-- setting postion
dog.x = display.contentCenterX
dog.y = display.contentCenterY
-- scale mole down
dog:scale( 0.4, 0.4)
--make mole invivsible
dog.isVisible = false

-- score
local pointsObject
local startingPoints = 0
--dsiplay points
pointsObject = display.newText(" Points = " .. startingPoints , display.contentWidth * 2/4, display.contentHeight * 3/4, Arial, 70)
pointsObject:setTextColor( 255/255, 255/255, 255/255)

--SOUND

local touchSound = audio.loadSound("")
-------------------------------------------------------------------------------------------
-- FUNCTIONS
-------------------------------------------------------------------------------------------

-- this function makes the mle appear in a random postion on the screen
-- before call the Hide function

function PopUp()

	-- choosing random postion
	dog.x = math.random( 0, display.contentWidth)
	dog.y = math.random( 0, display.contentHeight)

	-- make mole visible
	dog.isVisible = true

	-- call Hide function after 700 miliseconds
	timer.performWithDelay(700, PopUp)
end

-- this function calls the PopUp function after 3 seconds
function PopUpDelay()
	timer.performWithDelay( 100, PopUp )
end

-- this function makes the mole invisible and then calls the PopUpDelay function
function Hide()

	-- change visibility
	dog.isVisible = false
	-- call function
	PopUpDelay()
end

function GameStart()
	PopUpDelay()
end

-- this function increments the score only if the mole is clicked. It displays the
-- new score
function Whacked(event)

	-- if touch phase just started
	if (event.phase == "began") then
		startingPoints = startingPoints + 1
		pointsObject.text = " points = " .. startingPoints


	end

end

-- i addd the event listener to the moles so that if the mole is touched, the Whacked function
-- is called
dog:addEventListener( "touch", Whacked )

-- START GAME
--Whacked()
GameStart()