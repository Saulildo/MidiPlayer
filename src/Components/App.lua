-- App
-- 0866
-- November 03, 2020



local App = {}

local CoreGui = game:GetService("CoreGui")

-- local midiPlayer = script:FindFirstAncestor("MidiPlayer")

local FastDraggable = require(loadstring(game:GetHttpAsync("https://raw.githubusercontent.com/zoeyluau/MidiPlayer/refs/heads/main/src/FastDraggable.lua"))())
local Controller = require(loadstring(game:GetHttpAsync("https://raw.githubusercontent.com/zoeyluau/MidiPlayer/refs/heads/main/src/Components/Controller.lua"))())
local Sidebar = require(loadstring(game:GetHttpAsync("https://raw.githubusercontent.com/zoeyluau/MidiPlayer/refs/heads/main/src/Components/Sidebar.lua"))())
local Preview = require(loadstring(game:GetHttpAsync("https://raw.githubusercontent.com/zoeyluau/MidiPlayer/refs/heads/main/src/Components/Preview.lua"))())

local gui = loadstring(game:GetHttpAsync("https://raw.githubusercontent.com/zoeyluau/MidiPlayer/refs/heads/main/src/Assets/ScreenGui.lua"))()

function App:GetGUI()
    return gui
end

function App:Init()

    FastDraggable(gui.Frame, gui.Frame.Handle)
    gui.Parent = CoreGui

    Controller:Init(gui.Frame)
    Sidebar:Init(gui.Frame)
    Preview:Init(gui.Frame)

end


return App
