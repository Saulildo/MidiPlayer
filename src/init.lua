-- Main
-- 0866
-- February 13, 2025

local BASE = getgenv().MidiPlayerBaseUrl or "https://raw.githubusercontent.com/Saulildo/MidiPlayer/cursor/implement-midi-auto-transpose-and-manual-controls-a58d"
getgenv().MidiPlayerBaseUrl = BASE
local App = loadstring(game:HttpGetAsync(BASE .. "/src/Components/App.lua"))()

if (not isfolder("midi")) then
    makefolder("midi")
end

App:Init()
