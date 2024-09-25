-- Main
-- 0866
-- October 31, 2020

local App = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/zoeyluau/MidiPlayer/refs/heads/main/src/Components/App.lua"))()

if (not isfolder("midi")) then
    makefolder("midi")
end

App:Init()
