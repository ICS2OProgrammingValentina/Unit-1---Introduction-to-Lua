-----------------------------------------------------------------------------------------
-- Title: LivesAndTimers
-- Name: Valentina G Melendez
-- Course: ICS2O
-- This program
-------------------------------------------------------------------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background
display.setDefault("background", 222/255, 140/255, 85/255 )

-- local variables
-----------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
-- variables for timer
local totalSeconds = 10
local secondsLeft = 10

local clockText
local countDownTimer

local lives = 4 
local heart1
local heart2
local heart3
local heart4

local pointsObject
local startingPoints = 0

local questionObject
local correctObject
local incorrectObject

local numericField 

local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local randomOperator

local GameOver
local WrongSound = audio.loadSound("Sounds/wrongSound.mp3")
local WrongSoundChannel
----------------------------------------------------------------------------------------
-- SOUNDS
----------------------------------------------------------------------------------------

local correctSound = audio.loadSound( "Sounds/correctSound.mp3")
local correctSoundChannel

----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS 
----------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)
	randomOperator = math.random(1, 3)
	
	if (randomOperator == 1 ) then 
		correctAnswer = randomNumber1 + randomNumber2
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif ( randomOperator == 2 ) then
			
		correctAnswer = randomNumber1 - randomNumber2
		questionObject.text =  randomNumber1 .. " - " .. randomNumber2 .. " = "

	elseif ( randomOperator == 3 ) then
		correctAnswer = randomNumber1 * randomNumber2
		 questionObject.text = randomNumber1 .. " x " .. randomNumber2 .. " = "
	end
end


local function UpdateLives()
	--
	if (lives == 3 )then
		heart4.isVisible = false
	elseif ( lives == 2 )then
		heart3.isVisible = false
	elseif ( lives == 1 )then
		heart2.isVisible = false
	elseif(lives == 0)then
		heart1.isVisible = false
		GameOver.isVisible = true
		numericField.isVisible = false
		questionObject.isVisible = false
		clockText.isVisible = false
		pointsObject.isVisible = false
	end
end


local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false 
	AskQuestion()
end

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = "Time: ".. secondsLeft

	if (secondsLeft == 0 )then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
		--call the function to reset timer
		UpdateTime()
		-- call the function to update lives
		UpdateLives()
	end
end

-- function that cals the timer
local function StartTimer()
	-- create a countdown timer that loops infinitley
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0 )
end



local function NumericFieldListener ( event )
	-- user begins editing "numericField"
	if ( event.phase == "began" ) then 

		-- clear text field
		event.target.text = ""

	elseif (event.phase == "submitted") then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			correctSoundChannel = audio.play(correctSound)
			startingPoints = startingPoints + 1

		--elseif 
			--lives = lives - 1
			--UpdateLives()
			timer.performWithDelay(1000, HideCorrect)

			-- display the points
			pointsObject.text = "points = " .. startingPoints
		-- if answer is incorrect
		else
			-- if answer is incorrect, correct text will be hidden
			correctObject.isVisible = false
			lives = lives - 1
			UpdateLives()
			secondsLeft = totalSeconds

			-- if answer is wrong, incorrect text will be visible
			incorrectObject.isVisible = true
		
			timer.performWithDelay(1000, HideIncorrect)

			WrongSoundChannel = audio.play(correctSound)
		end
		event.target.text = ""
		
	end 
end


-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------
-- displays a question and sets the colour
-- create numeric field
numericField = native.newTextField( display.contentWidth * 2.3/4, display.contentHeight * 2/4, 150, 90)
numericField.inputType = "display"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- display timer
clockText = display.newText(" Time = " .. secondsLeft, display.contentWidth * 3/4, display.contentHeight * 2/4, Arial, 50)

-- display hearts
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7/8
heart1.y = display.contentHeight * 1/7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6/8
heart2.y = display.contentHeight * 1/7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5/8
heart3.y = display.contentHeight * 1/7

heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 4/8
heart4.y = display.contentHeight * 1/7

--dsiplay points
pointsObject = display.newText(" Points = " .. startingPoints , display.contentWidth * 2/4, display.contentHeight * 1/4, Arial, 50)
pointsObject:setTextColor( 43/255, 42/255, 155/255)

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, Arial, 60 )
questionObject:setTextColor( 43/255, 42/255, 155/255 )

-- create the correct text object and make it visible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, Arial, 50)
correctObject:setTextColor(255/255, 255/255, 255/255)
correctObject.isVisible = false

-- create the correct text object and make it visible
incorrectObject = display.newText( "Incorrect", display.contentWidth/2, display.contentHeight*2/3, Arial, 50)
incorrectObject:setTextColor(0/255, 0/255, 0/255)
incorrectObject.isVisible = false

--display game over
GameOver = display.newImageRect("Images/gameOver.png", 1350, 900)
GameOver.isVisible = false
GameOver.x = 515
GameOver.y = 400
----------------------------------------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------------------------------------------

StartTimer()
-- call the function to ask the question
AskQuestion()
