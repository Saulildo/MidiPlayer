-- Song
-- 0866
-- February 13, 2025



local Song = {}
Song.__index = Song

local MIDI = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/Saulildo/MidiPlayer/refs/heads/main/src/MIDI.lua'))()
local Input = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/Saulildo/MidiPlayer/refs/heads/main/src/Input.lua'))()

local RunService = game:GetService("RunService")

local AUTO_TRANSPOSE_MIN = -16
local AUTO_TRANSPOSE_MAX = 16

local MIN_PITCH = 36
local NUM_KEYS = 61
local MAX_PITCH = MIN_PITCH + NUM_KEYS - 1

local function GetTimeLength(score)
    local length = 0
    for i, track in ipairs(score) do
        if (i == 1) then continue end
        length = math.max(length, track[#track][2])
    end
    return length
end

local function ComputeAutoTranspose(score)
	-- Determine a transposition within [-16, 16] that fits all notes within Input.MinPitch..Input.MaxPitch
	local minPitch = math.huge
	local maxPitch = -math.huge
	for i, track in ipairs(score) do
		if (i == 1) then continue end
		for _, event in ipairs(track) do
			if event[1] == "note" then
				local pitch = event[5]
				if pitch < minPitch then minPitch = pitch end
				if pitch > maxPitch then maxPitch = pitch end
			end
		end
	end
	if minPitch == math.huge then
		return 0
	end
	local needDown = MIN_PITCH - minPitch
	local needUp = MAX_PITCH - maxPitch
	-- We need transpose t such that: minPitch + t >= Input.MinPitch and maxPitch + t <= Input.MaxPitch
	-- So t in [needDown, needUp]. Choose t in that intersection, clamped to [-16, 16]. Prefer 0 if available, else the closest to 0.
	local lo = math.max(needDown, AUTO_TRANSPOSE_MIN)
	local hi = math.min(needUp, AUTO_TRANSPOSE_MAX)
	if lo > hi then
		-- No perfect fit; choose the shift that minimizes out-of-range overshoot, prefer towards 0
		-- Try candidates at bounds within [-16,16]
		local candidates = {AUTO_TRANSPOSE_MIN, 0, AUTO_TRANSPOSE_MAX, needDown, needUp}
		local bestT, bestCost = 0, math.huge
		for _, t in ipairs(candidates) do
			local ct = math.floor(math.clamp(t, AUTO_TRANSPOSE_MIN, AUTO_TRANSPOSE_MAX))
			local lowOver = math.max(0, (minPitch + ct) - MIN_PITCH)
			local highOver = math.max(0, MAX_PITCH - (maxPitch + ct))
			local under = math.max(0, MIN_PITCH - (minPitch + ct))
			local over = math.max(0, (maxPitch + ct) - MAX_PITCH)
			local cost = under + over + lowOver + highOver + math.abs(ct) * 0.01
			if cost < bestCost then
				bestCost, bestT = cost, ct
			end
		end
		return bestT
	else
		-- 0 is inside range
		if 0 >= lo and 0 <= hi then return 0 end
		-- otherwise take the closest to 0
		if math.abs(lo) < math.abs(hi) then return lo else return hi end
	end
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

        _score = score;
        _transpose = 0;
        _usPerBeat = 0;
        _lastTimePosition = 0;
        _length = GetTimeLength(score);
        _eventStatus = {};
        _updateConnection = nil;

    }, Song)

    self.TimeLength = (self._length / self.Timebase)

    -- Auto-transpose based on score limits
    self._transpose = ComputeAutoTranspose(self._score)

    return self

end

function Song:GetTranspose()
    return self._transpose or 0
end

function Song:SetTranspose(value)
    -- Clamp between -16 and 16
    local clamped = math.clamp(math.floor(value), AUTO_TRANSPOSE_MIN, AUTO_TRANSPOSE_MAX)
    self._transpose = clamped
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
        local pitch = event[5] + (self._transpose or 0)
        Input.Hold(pitch, event[3] / self.Timebase)
    end
end


function Song.FromTitle(midiTitle)
	return Song.new("midi/" .. midiTitle .. ".mid")
end


Song.Destroy = Song.Stop

return Song
