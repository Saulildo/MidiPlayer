-- Main
-- 0866
-- February 13, 2025

local App = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Saulildo/MidiPlayer/refs/heads/main/src/Components/App.lua"))()

if (not isfolder("midi")) then
    makefolder("midi")
end

App:Init()
