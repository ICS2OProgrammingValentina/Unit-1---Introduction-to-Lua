-----------------------------------------------------------------------------------------
--Title: TouchDrag
--Name: Valentina
--Course: ICS2O
--This program displays images that react to a persons finger
-----------------------------------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local pinkGirl = display.newImageRect("images/pinkGirl.png", 150, 150)
local pinkGirlWidth =  pinkGirl.width 
local pinkGirlHeight =  pinkGirl.height 

local blueGirl =  display.newImageRect("images/blueGirl.png", 150, 150)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height 

-- my booolean variables to keep track of wich object i touched first
local alreadyTouchedPinkGirl = false
local alreadyTouchedBlueGirl = false

-- set the initial x and y position of myImage
pinkGirl.x = 400
pinkGirl.y = 500

blueGirl.x = 300
blueGirl.y = 200

--Function: BlueGirlListener
--Input: touch listener
--Output: none
--Decription: when blue girl is touched, move her
local function BlueGirlListener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedPinkGirl == false) then
			alreadyTouchedBlueGirl = true
		end
    end

    if  ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
    	blueGirl.x = touch.x
    	blueGirl.y = touch.y
    end

    if (touch.phase == "ended") then
    alreadyTouchedBlueGirl = false
    alreadyTouchedPinkGirl = false
    end
end

-- add the respective listeners to each object
blueGirl:addEventListener("touch", BlueGirlListener)


--Function: PinkGirlListener
--Input: touch listener
--Output: none
--Decription: when pink girl is touched, move her
local function PinkGirlListener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) then
			alreadyTouchedPinkGirl = true
		end
    end

    if  ( (touch.phase == "moved") and (alreadyTouchedPinkGirl == true) ) then
    	pinkGirl.x = touch.x
    	pinkGirl.y = touch.y
    end

    if (touch.phase == "ended") then
    alreadyTouchedpinkGirl = false
    alreadyTouchedBlueGirl = false
    end
end

-- add the respective listeners to each object
pinkGirl:addEventListener("touch", PinkGirlListener)

