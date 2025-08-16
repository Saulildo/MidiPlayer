-- Input
-- 0866
-- February 13, 2025



local Input = {}

local keypress = getfenv(0).keypress
local keyrelease = getfenv(0).keyrelease

local VK_LSHIFT = 0x10

local NOTE_MAP = "1!2@34$5%6^78*9(0qQwWeErtTyYuiIoOpPasSdDfgGhHjJklLzZxcCvVbBnm"
local UPPER_MAP = "!@ $%^ *( QWE TY IOP SD GHJ LZ CVB"
local LOWER_MAP = "1234567890qwertyuiopasdfghjklzxcvbnm"

local MIN_PITCH = 36
local MAX_PITCH = MIN_PITCH + #NOTE_MAP - 1

Input.MinPitch = MIN_PITCH
Input.MaxPitch = MAX_PITCH

local BASE = getgenv().MidiPlayerBaseUrl or 'https://raw.githubusercontent.com/Saulildo/MidiPlayer/cursor/implement-midi-auto-transpose-and-manual-controls-a58d'
local Thread = loadstring(game:HttpGetAsync(BASE .. '/src/Util/Thread.lua'))()
local Maid = loadstring(game:HttpGetAsync(BASE .. '/src/Util/Maid.lua'))()

local inputMaid = Maid.new()


local function GetKey(pitch)
    local idx = (pitch + 1 - 36)
    if (idx > #NOTE_MAP or idx < 1) then
        return
    else
        local key = NOTE_MAP:sub(idx, idx)
        return key, UPPER_MAP:find(key, 1, true)
    end
end


function Input.IsUpper(pitch)
    local key, upperMapIdx = GetKey(pitch)
    if (not key) then return end
    return upperMapIdx
end


function Input.Press(pitch)
    local key, upperMapIdx = GetKey(pitch)
    if (not key) then return end
    if (upperMapIdx) then
        local keyToPress = LOWER_MAP:sub(upperMapIdx, upperMapIdx)
        keypress(VK_LSHIFT)
        keypress(keyToPress:upper():byte())
        keyrelease(VK_LSHIFT)
    else
        keypress(key:upper():byte())
    end
end


function Input.Release(pitch)
    local key, upperMapIdx = GetKey(pitch)
    if (not key) then return end
    if (upperMapIdx) then
        local keyToPress = LOWER_MAP:sub(upperMapIdx, upperMapIdx)
        keyrelease(keyToPress:upper():byte())
    else
        keyrelease(key:upper():byte())
    end
end


function Input.Hold(pitch, duration)
    if (inputMaid[pitch]) then
        inputMaid[pitch] = nil
    end
    Input.Release(pitch)
    Input.Press(pitch)
    inputMaid[pitch] = Thread.Delay(duration, Input.Release, pitch)
end


return Input
