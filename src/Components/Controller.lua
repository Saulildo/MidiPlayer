-- Controller
-- 0866
-- February 13, 2025



--local midiPlayer = script:FindFirstAncestor("MidiPlayer")

local BASE = getgenv().MidiPlayerBaseUrl or "https://raw.githubusercontent.com/Saulildo/MidiPlayer/cursor/implement-midi-auto-transpose-and-manual-controls-a58d"
local Signal = loadstring(game:HttpGetAsync(BASE .. "/src/Util/Signal.lua"))()
local Date = loadstring(game:HttpGetAsync(BASE .. "/src/Util/Date.lua"))()
local Thread = loadstring(game:HttpGetAsync(BASE .. "/src/Util/Thread.lua"))()
local Song = getgenv().Song or loadstring(game:HttpGetAsync(BASE .. "/src/Song.lua"))(); getgenv().Song = Song
local FastTween = loadstring(game:HttpGetAsync(BASE .. "/src/FastTween.lua"))()
local Preview = getgenv().Preview or loadstring(game:HttpGetAsync(BASE .. "/src/Components/Preview.lua"))(); getgenv().Preview = Preview

local Controller = {
    CurrentSong = nil;
    FileLoaded = Signal.new();
    _initialized = false;
    Main = nil; -- frame.Main
    UIController = nil; -- frame.Main.Controller
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
    self.CurrentFile = filePath
    self.FileLoaded:Fire(self.CurrentSong)
    self:Update()
    -- Use pcall to safely call Preview:Draw in case Preview isn't initialized yet
    pcall(function()
        Preview:Draw(self.CurrentSong)
    end)
end


function Controller:Update()
    local song = self.CurrentSong
    local main = self.Main or _G.main
    local ui = self.UIController or _G.controller
    if not (main and ui) then return end

    if (song) then
        main.Title.Text = song.Name

        if (song.TimePosition) then
            local date = Date.new(song.TimePosition)
            ui.Time.Text = ("%s:%s"):format(
                tostring(date.Minute),
                ("%02i"):format(tostring(date.Second % 60))
            )
        end

        ui.Scrubber.Progress.Size = UDim2.fromScale(math.min(1, song.TimePosition / song.TimeLength), 1)
        ui.Scrubber.Fill.Size = UDim2.fromScale(1 - ui.Scrubber.Progress.Size.X.Scale, 1)
        ui.Resume.Image = (song.IsPlaying and "rbxassetid://5915789609") or "rbxassetid://5915551861"

    else
        main.Title.Text = "No song selected"
        ui.Time.Text = "0:00"
        ui.Scrubber.Progress.Size = UDim2.fromScale(0, 1)
        ui.Scrubber.Fill.Size = UDim2.fromScale(1, 1)
        ui.Resume.Image = "rbxassetid://5915551861"
    end
end


function Controller:Init(frame)
    if self._initialized then return end
    self._initialized = true

    self.Main = frame.Main
    self.UIController = self.Main.Controller
    _G.main = self.Main
    _G.controller = self.UIController

    self:_startScrubber()

    self:_startPlaybackButton()

    self:_startHidePreviewButton()

    self:_startTransposeControls()

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
    local togglePreview = (self.Main or _G.main).TogglePreview
    togglePreview.Activated:Connect(function()
        getgenv()._hideSongPreview = (not getgenv()._hideSongPreview)
        if (getgenv()._hideSongPreview) then
            FastTween(togglePreview.Fill, { 0.1 }, { Size = UDim2.new() })
        else
            FastTween(togglePreview.Fill, { 0.1 }, { Size = UDim2.new(1, -12, 1, -12) })
        end
    end)
end


function Controller:_startPlaybackButton()
    local playback = (self.UIController or _G.controller).Resume
    playback.Activated:Connect(function()
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

    local ui = self.UIController or _G.controller
    local absSize = ui.Scrubber.AbsoluteSize

    local dragging
    local dragInput

    local function update(input)
        local song = self.CurrentSong
        local absPos = ui.Scrubber.AbsolutePosition
        if (song) then
            song:JumpTo(math.clamp((input.Position.X - absPos.X) / absSize.X, 0, 1) * song.TimeLength)
        end
        self:Update()
    end

    ui.Scrubber.Hitbox.InputBegan:Connect(function(input)
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

    ui.Scrubber.Hitbox.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
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
    
    -- Additional touch handling for Android compatibility
    UserInputService.TouchMoved:Connect(function(touch, gameProcessed)
        if not gameProcessed and dragging and dragInput and touch == dragInput then
            if (self.CurrentSong) then
                self.CurrentSong:Pause()
            end
            update(touch)
        end
    end)

end

function Controller:_startTransposeControls()
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local song = self.CurrentSong
            if not (song and song.IsPlaying) then
                return
            end
            if input.KeyCode == Enum.KeyCode.Right then
                song:SetTranspose(song:GetTranspose() + 1)
                pcall(function()
                    Preview:Draw(song)
                end)
                self:Update()
            elseif input.KeyCode == Enum.KeyCode.Left then
                song:SetTranspose(song:GetTranspose() - 1)
                pcall(function()
                    Preview:Draw(song)
                end)
                self:Update()
            end
        end
    end)
end


return Controller
