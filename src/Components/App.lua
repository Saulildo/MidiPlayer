-- App
-- 0866
-- February 13, 2025



local App = {}

local CoreGui = game:GetService("CoreGui")

-- local midiPlayer = script:FindFirstAncestor("MidiPlayer")

local FastDraggable = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Saulildo/MidiPlayer/refs/heads/main/src/FastDraggable.lua"))()
local Controller = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Saulildo/MidiPlayer/refs/heads/main/src/Components/Controller.lua"))()
local Sidebar = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Saulildo/MidiPlayer/refs/heads/main/src/Components/Sidebar.lua"))()
local Preview = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Saulildo/MidiPlayer/refs/heads/main/src/Components/Preview.lua"))()

local gui = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Saulildo/MidiPlayer/refs/heads/main/src/Assets/ScreenGui.lua"))()

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
