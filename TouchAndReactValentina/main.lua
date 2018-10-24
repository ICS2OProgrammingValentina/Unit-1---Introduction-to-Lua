-----------------------------------------------------------------------------------------
-- Title: Buttons in Lua
-- Name: Valentina 
-- Course: ICS2O
-- This program changes the clour of the button from blue to red when i click on the button.
-----------------------------------------------------------------------------------------

-- set the background colour
display.setDefault ("background", 100/255, 170/255, 160/255)

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x =  display.contentWidth/2
blueButton.y =  display.contentHeight/2
blueButton.isVisible = true

-- create red button, set its positon and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false 

-- create text object, set its position and make it invisible
local textObject =  display.newText ("Clicked!", 0, 0, nil, 50, arial)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible =  false

-- function: BlueButtonListener
-- input: touch listener
-- output: none
-- description: when blue button is clicked, it will make the text appear with the r5ed button,
-- and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then 
		blueButton.isVisible =  false 
		redButton.isVisible =  true
		textObject.isVisble = true
	end

	if (touch.phase == "ended") then
	    blueButton.isVisible = true
	    redButton.isVisible = false
	    textObject.isVisible = false
    end
end 

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)

-- Sound
local boing = audio.loadSound( "Sound/BoingSoundEffect.mp3")
local boingSoundChannel

boingSoundChannel = audio.play(boing)