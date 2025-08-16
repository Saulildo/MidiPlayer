-- App
-- 0866
-- February 13, 2025



local App = {}

local CoreGui = game:GetService("CoreGui")

-- local midiPlayer = script:FindFirstAncestor("MidiPlayer")

local BASE = getgenv().MidiPlayerBaseUrl or "https://raw.githubusercontent.com/Saulildo/MidiPlayer/main"
local FastDraggable = loadstring(game:HttpGetAsync(BASE .. "/src/FastDraggable.lua"))()
local Controller = getgenv().Controller or loadstring(game:HttpGetAsync(BASE .. "/src/Components/Controller.lua"))(); getgenv().Controller = Controller
local Sidebar = loadstring(game:HttpGetAsync(BASE .. "/src/Components/Sidebar.lua"))()
local Preview = loadstring(game:HttpGetAsync(BASE .. "/src/Components/Preview.lua"))()

local gui = loadstring(game:HttpGetAsync(BASE .. "/src/Assets/ScreenGui.lua"))()

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
