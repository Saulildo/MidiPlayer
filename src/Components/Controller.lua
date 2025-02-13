-- Controller
-- 0866
-- November 03, 2020



--local midiPlayer = script:FindFirstAncestor("MidiPlayer")

local Signal = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/cjsomook/MidiPlayer/refs/heads/main/src/Util/Signal.lua"))()
local Date = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/cjsomook/MidiPlayer/refs/heads/main/src/Util/Date.lua"))()
local Thread = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/cjsomook/MidiPlayer/refs/heads/main/src/Util/Thread.lua"))()
local Song = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/cjsomook/MidiPlayer/refs/heads/main/src/Song.lua"))()
local FastTween = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/cjsomook/MidiPlayer/refs/heads/main/src/FastTween.lua"))()
local Preview = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/cjsomook/MidiPlayer/refs/heads/main/src/Components/Preview.lua"))()

local Controller = {
    CurrentSong = nil;
    FileLoaded = Signal.new();
}

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

_G.main = nil
_G.controller = nil


function Controller:Select(filePath)
    if (self.CurrentSong) then
        self.CurrentSong:Destroy()
    end
    self.CurrentSong = Song.new(filePath)
    self.FileLoaded:Fire(self.CurrentSong)
    self:Update()
    Preview:Draw(self.CurrentSong)
end


function Controller:Update()
    local song = self.CurrentSong

    if (song) then
        _G.main.Title.Text = song.Name

        if (song.TimePosition) then
            local date = Date.new(song.TimePosition)
            _G.controller.Time.Text = ("%s:%s"):format(
                tostring(date.Minute),
                ("%02i"):format(tostring(date.Second % 60))
            )
        end

        _G.controller.Scrubber.Progress.Size = UDim2.fromScale(math.min(1, song.TimePosition / song.TimeLength), 1)
        _G.controller.Scrubber.Fill.Size = UDim2.fromScale(1 - _G.controller.Scrubber.Progress.Size.X.Scale, 1)
        _G.controller.Resume.Image = (song.IsPlaying and "rbxassetid://5915789609") or "rbxassetid://5915551861"

    else
        _G.main.Title.Text = "No song selected"
        _G.controller.Time.Text = "0:00"
        _G.controller.Scrubber.Progress.Size = UDim2.fromScale(0, 1)
        _G.controller.Scrubber.Fill.Size = UDim2.fromScale(1, 1)
        _G.controller.Resume.Image = "rbxassetid://5915551861"
    end
end


function Controller:Init(frame)

    _G.main = frame.Main
    _G.controller = _G.main.Controller

    self:_startScrubber()

    self:_startPlaybackButton()

    self:_startHidePreviewButton()

    Thread.DelayRepeat(1/60, function()
        if (self.CurrentSong) then
            Preview:Update(self.CurrentSong.TimePosition * self.CurrentSong.Timebase)
        end
    end)

    RunService.Heartbeat:Connect(function()
        self:Update()
    end)

end


function Controller:_startHidePreviewButton()
    local togglePreview = _G.main.TogglePreview
    togglePreview.MouseButton1Down:Connect(function()
        getgenv()._hideSongPreview = (not getgenv()._hideSongPreview)
        if (getgenv()._hideSongPreview) then
            FastTween(togglePreview.Fill, { 0.1 }, { Size = UDim2.new() })
        else
            FastTween(togglePreview.Fill, { 0.1 }, { Size = UDim2.new(1, -12, 1, -12) })
        end
    end)
end


function Controller:_startPlaybackButton()
    local playback = _G.controller.Resume
    playback.MouseButton1Down:Connect(function()
        if (not self.CurrentSong) then return end
        if (self.CurrentSong.IsPlaying) then
            self.CurrentSong:Pause()
        else
            self.CurrentSong:Play()
        end
        self:Update()
    end)
end


function Controller:_startScrubber()

    -- https://devforum.roblox.com/t/draggable-property-is-hidden-on-gui-objects/107689/5

    local absSize = _G.controller.Scrubber.AbsoluteSize

    local dragging
    local dragInput

    local function update(input)
        local song = self.CurrentSong
        local absPos = _G.controller.Scrubber.AbsolutePosition
        if (song) then
            song:JumpTo(math.clamp((input.Position.X - absPos.X) / absSize.X, 0, 1) * song.TimeLength)
        end
        self:Update()
    end

    _G.controller.Scrubber.Hitbox.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragging = true
            input.Changed:Connect(function()
                if (input.UserInputState == Enum.UserInputState.End) then
                    dragging = false
                end
            end)
            update(input)
        end
    end)

    _G.controller.Scrubber.Hitbox.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if (input == dragInput and dragging) then
            if (self.CurrentSong) then
                self.CurrentSong:Pause()
            end
            update(input)
        end
    end)

end


return Controller
