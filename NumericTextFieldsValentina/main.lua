-----------------------------------------------------------------------------------------
-- Title: NumericTextFields
-- Name: Valentina
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric textfield.
-- terminal.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background
display.setDefault("background", 222/255, 140/255, 85/255 )

-- local variables
-----------------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject

local numericField 

local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local randomOperator

local startingPoints = 0
local points

-- local functions
----------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(10, 20)
	randomNumber2 = math.random(10, 20)
	randomOperator = math.random(1, 3)

	print("***randomNumber1 = " .. randomNumber1)
	print("***randomNumber2 = " .. randomNumber2)
	print("***randomOperator = " .. randomOperator)
	
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

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false 
	AskQuestion()
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
			startingPoints = startingPoints + 1
			timer.performWithDelay(1000, HideCorrect)

			-- display the points
			points.text = "points = " .. startingPoints
		else
			correctObject.isVisible = false
			incorrectObject.isVisible = true
		
			timer.performWithDelay(1000, HideIncorrect)
		end
		event.target.text = ""
		
	end 
end

-- object creation
-----------------------------------------------------------------------------------------
-- display points
points = display.newText(" Points = " .. startingPoints , display.contentWidth * 2/4, display.contentHeight * 1/4, Arial, 50)
points:setTextColor( 43/255, 42/255, 155/255)

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

-- create numeric field
numericField = native.newTextField( display.contentWidth * 2.3/4, display.contentHeight * 2/4, 150, 90)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- function calls
----------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()



