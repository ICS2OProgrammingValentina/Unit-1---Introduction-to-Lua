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
local mole = display.newImage("Images/mole.png", 0, 0 )
-- setting postion
mole.x = display.contentCenterX
mole.y = display.contentCenterY
-- scale mole down
mole:scale( 0.3, 0.3)
--make mole invivsible
mole.isVisible = false

-- score
local pointsObject
local startingPoints = 0
--dsiplay points
pointsObject = display.newText(" Points = " .. startingPoints , display.contentWidth * 2/4, display.contentHeight * 1/4, Arial, 50)
pointsObject:setTextColor( 255/255, 255/255, 255/255)
-------------------------------------------------------------------------------------------
-- FUNCTIONS
-------------------------------------------------------------------------------------------

-- this function makes the mle appear in a random postion on the screen
-- before call the Hide function

function PopUp()

	-- choosing random postion
	mole.x = math.random( 0, display.contentWidth)
	mole.y = math.random( 0, display.contentHeight)

	-- make mole visible
	mole.isVisible = true

	-- call Hide function after 500 miliseconds
	timer.performWithDelay(500, PopUp)
end

-- this function calls the PopUp function after 3 seconds
function PopUpDelay()
	timer.performWithDelay( 300, PopUp )
end

-- this function makes the mole invisible and then calls the PopUpDelay function
function Hide()

	-- change visibility
	mole.isVisible = false
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

		--dsiplay points
		pointsObject = " Points = " .. startingPoints , display.contentWidth * 2/4, display.contentHeight * 1/4, Arial, 50
		pointsObject:setTextColor( 43/255, 42/255, 155/255 )
	end

end

-- i addd the event listener to the moles so that if the mole is touched, the Whacked function
-- is called
mole:addEventListener( "touch", Whacked )

-- START GAME
--Whacked()
GameStart()








