-- Song
-- 0866
-- February 13, 2025



local Song = {}
Song.__index = Song

local MIDI = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/Saulildo/MidiPlayer/refs/heads/main/src/MIDI.lua'))()
local Input = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/Saulildo/MidiPlayer/refs/heads/main/src/Input.lua'))()

local RunService = game:GetService("RunService")


local function GetTimeLength(score)
    local length = 0
    for i, track in ipairs(score) do
        if (i == 1) then continue end
        length = math.max(length, track[#track][2])
    end
    return length
end


function Song.new(file)

    local score = MIDI.midi2score(readfile(file))

    local fullname = file:match("([^/^\\]+)$")
    local name = fullname:match("^([^%.]+)") or ""

    local self = setmetatable({

        Name = name;
        Path = file;
        TimePosition = 0;
        TimeLength = 0;
        Timebase = score[1];
        IsPlaying = false;

        Transpose = 0;
        LowestPitch = 0;
        HighestPitch = 0;

        _score = score;
        _usPerBeat = 0;
        _lastTimePosition = 0;
        _length = GetTimeLength(score);
        _eventStatus = {};
        _updateConnection = nil;

    }, Song)

    self.TimeLength = (self._length / self.Timebase)

    -- Compute pitch range for auto-transpose decisions
    self.LowestPitch, self.HighestPitch = self:_computePitchRange()

    return self

end


function Song:Update(timePosition, lastTimePosition)
    for _,track in next, self._score, 1 do
        for _,event in ipairs(track) do
            local eventTime = (event[2] / self.Timebase)
            if (timePosition >= eventTime) then
                if (lastTimePosition <= eventTime) then
                    self:_parse(event)
                end
            end
        end
    end
end


function Song:Step(deltaTime)
    self._lastTimePosition = self.TimePosition
    if (self._usPerBeat ~= 0) then
        self.TimePosition += (deltaTime / (self._usPerBeat / 1000000))
    else
        self.TimePosition += deltaTime
    end
end


function Song:JumpTo(timePosition)
    self.TimePosition = timePosition
    self._lastTimePosition = timePosition
end


function Song:Play()
    self._updateConnection = RunService.RenderStepped:Connect(function(dt)
        self:Update(self.TimePosition, self._lastTimePosition)
        self:Step(dt)
        if (self.TimePosition >= self.TimeLength) then
            self:Pause()
        end
    end)
    self:Update(0, 0)
    self.IsPlaying = true
end


function Song:Stop()
    if (self._updateConnection) then
        self._updateConnection:Disconnect()
        self._updateConnection = nil
        self.IsPlaying = false
    end
    self._lastTimePosition = 0
end


function Song:Pause()
    if (self._updateConnection) then
        self._updateConnection:Disconnect()
        self._updateConnection = nil
        self.IsPlaying = false
    end
end


function Song:_parse(event)
    --[[

        Event:
            Event name  [String]
            Start time  [Number]
            ...

        Note:
            Event name  [String]
            Start time  [Number]
            Duration    [Number]
            Channel     [Number]
            Pitch       [Number]
            Velocity    [Number]

    ]]
    local eventName = event[1]

    if (eventName == "set_tempo") then
        self._usPerBeat = event[3]
    elseif (eventName == "song_position") then
        self.TimePosition = (event[3] / self.Timebase)
        print("set timeposition timebase", self.Timebase)
    elseif (eventName == "note") then
        local transposedPitch = event[5] + (self.Transpose or 0)
        Input.Hold(transposedPitch, event[3] / self.Timebase)
    end
end

function Song:_computePitchRange()
    local lowest = math.huge
    local highest = -math.huge
    for i, track in next, self._score, 1 do
        for _, event in ipairs(track) do
            if (event[1] == "note") then
                local p = event[5]
                if p < lowest then lowest = p end
                if p > highest then highest = p end
            end
        end
    end
    if lowest == math.huge then lowest = 0 end
    if highest == -math.huge then highest = 0 end
    return lowest, highest
end

function Song:SetTranspose(value)
    self.Transpose = math.clamp(tonumber(value) or 0, -16, 16)
end

function Song:GetSuggestedTranspose()
    local minPitch, maxPitch = Input.GetRange()
    local low, high = self.LowestPitch, self.HighestPitch
    if low == 0 and high == 0 then
        return 0
    end

    local allowedCenter = (minPitch + maxPitch) / 2
    local songCenter = (low + high) / 2

    local shift = math.floor((allowedCenter - songCenter) + 0.5)

    local minAllowed = minPitch - low
    local maxAllowed = maxPitch - high

    local left = math.max(-16, minAllowed)
    local right = math.min(16, maxAllowed)

    if left <= right then
        if shift < left then shift = left end
        if shift > right then shift = right end
    else
        if math.abs(left) < math.abs(right) then
            shift = math.clamp(left, -16, 16)
        else
            shift = math.clamp(right, -16, 16)
        end
    end

    return math.clamp(shift, -16, 16)
end


function Song.FromTitle(midiTitle)
    return Song.new("midi/" .. midiTitle .. ".mid")
end


Song.Destroy = Song.Stop

return Song
