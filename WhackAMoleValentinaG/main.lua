-----------------------------------------------------------------------------------------
-- Title: WhackAMole
-- Name: Valentina
-- Course: ICS2O/3C
-- This program displays a mole that when wacked, the user receives a point
-----------------------------------------------------------------------------------------

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- creating background
local background = display.newRect( 0, 0, display.contentWidth, display.contentHeight )

display.setDefault("background" 101/255, 225/255, 101/255 )