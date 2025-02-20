-- themes.lua
local soundservice = game:GetService("SoundService")
local runservice = game:GetService("RunService")
local workspace = game:GetService("Workspace")

local audioPairs = {
    ["rbxassetid://0"] = "rbxassetid://0",
    ["rbxassetid://133642201056982"] = getcustomasset("fearC.mp3", true)
}

local audioPairs2 = {
    ["rbxassetid://0"] = "rbxassetid://0",
    ["rbxassetid://133642201056982"] = getcustomasset("komodo.mp3", true)
}

local audioPairs3 = {
    ["rbxassetid://0"] = "rbxassetid://0",
    ["rbxassetid://139957641994343"] = getcustomasset("bubonicLAYER1-2.mp3", true),
    ["rbxassetid://107607873139123"] = getcustomasset("bubonicLAYER1-2.mp3", true),
    ["rbxassetid://105551772469406"] = getcustomasset("bubonicLAYER3.mp3", true),
    ["rbxassetid://97690757653206"] = getcustomasset("bubonicLAYER4.mp3", true)
}

local activeSounds = {}
local activeSounds2 = {}
local activeSounds3 = {}

local audioReplacerActive = false
local audioReplacerActive2 = false
local audioReplacerActive3 = false

local function replaceSound(sound, audioPairs, activeSounds)
    if sound:IsA("Sound") and audioPairs[sound.SoundId] then
        local newSoundId = audioPairs[sound.SoundId]
        local newSoundName = "NewSound_" .. sound.SoundId
        sound.Volume = 0
        if not activeSounds[newSoundName] then
            local newSound = Instance.new("Sound")
            newSound.SoundId = newSoundId
            newSound.Parent = soundservice
            newSound.Name = newSoundName
            newSound:Play()
            activeSounds[newSoundName] = newSound
            local function cleanup()
                if activeSounds[newSoundName] then
                    activeSounds[newSoundName]:Stop()
                    activeSounds[newSoundName]:Destroy()
                    activeSounds[newSoundName] = nil
                end
            end
            sound.Stopped:Connect(cleanup)
            sound.AncestryChanged:Connect(
                function()
                    if not sound.Parent then
                        cleanup()
                    end
                end
            )
        end
        sound.Changed:Connect(
            function(property)
                if property == "Volume" then
                    sound.Volume = 0
                end
            end
        )
    end
end

local function checkAudioPlaying()
    if audioReplacerActive then
        for _, sound in pairs(workspace:GetDescendants()) do
            replaceSound(sound, audioPairs, activeSounds)
        end
    end
    if audioReplacerActive2 then
        for _, sound in pairs(workspace:GetDescendants()) do
            replaceSound(sound, audioPairs2, activeSounds2)
        end
    end
    if audioReplacerActive3 then
        for _, sound in pairs(workspace:GetDescendants()) do
            replaceSound(sound, audioPairs3, activeSounds3)
        end
    end
end

workspace.DescendantAdded:Connect(
    function(sound)
        checkAudioPlaying()
    end
)

runservice.Heartbeat:Connect(checkAudioPlaying)

-- Explicitly return the functions
return {
    ToggleAudioReplacer1 = function()
        audioReplacerActive = not audioReplacerActive
    end,
    ToggleAudioReplacer2 = function()
        audioReplacerActive2 = not audioReplacerActive2
    end,
    ToggleAudioReplacer3 = function()
        audioReplacerActive3 = not audioReplacerActive3
    end,
    audioReplacerActive = audioReplacerActive,
    audioReplacerActive2 = audioReplacerActive2,
    audioReplacerActive3 = audioReplacerActive3
}
