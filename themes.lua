local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()
local PrefabsId = `rbxassetid://{ReGui.PrefabsId}`

-- Externally import the Prefabs asset
ReGui:Init({
	Prefabs = game:GetService("InsertService"):LoadLocalAsset(PrefabsId)
})

local Window = ReGui:Window({
	Title = "audio replacer ui",
	Size = UDim2.fromOffset(400, 300)
})

local audioPairs = {
    ["rbxassetid://1234"] = "rbxassetid://138714209577616",
    ["rbxassetid://133642201056982"] = getcustomasset("fearC.mp3", true)
}

local audioPairs2 = {
    ["rbxassetid://12345"] = "rbxassetid://138714209577616",
    ["rbxassetid://133642201056982"] = getcustomasset("komodo.mp3", true)
}

local audioPairs3 = {
    ["rbxassetid://12345"] = "rbxassetid://138714209577616",
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

local function replaceSound(sound)
    if audioReplacerActive and sound:IsA("Sound") and audioPairs[sound.SoundId] then
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
            sound.AncestryChanged:Connect(function()
                if not sound.Parent then
                    cleanup()
                end
            end)
        end

        sound.Changed:Connect(function(property)
            if property == "Volume" then
                sound.Volume = 0
            end
        end)
    end
end

local function checkAudioPlaying()
    if audioReplacerActive then
        for _, sound in pairs(workspace:GetDescendants()) do
            replaceSound(sound)
        end
    end
end

workspace.DescendantAdded:Connect(function(sound)
    if audioReplacerActive then
        replaceSound(sound)
    end
end)

runservice.Heartbeat:Connect(checkAudioPlaying)

-- Function for second audio replacer
local function replaceSound2(sound)
    if audioReplacerActive2 and sound:IsA("Sound") and audioPairs2[sound.SoundId] then
        local newSoundId = audioPairs2[sound.SoundId]
        local newSoundName = "NewSound_" .. sound.SoundId
        sound.Volume = 0

        if not activeSounds2[newSoundName] then
            local newSound = Instance.new("Sound")
            newSound.SoundId = newSoundId
            newSound.Parent = soundservice
            newSound.Name = newSoundName
            newSound:Play()

            activeSounds2[newSoundName] = newSound

            local function cleanup()
                if activeSounds2[newSoundName] then
                    activeSounds2[newSoundName]:Stop()
                    activeSounds2[newSoundName]:Destroy()
                    activeSounds2[newSoundName] = nil
                end
            end

            sound.Stopped:Connect(cleanup)
            sound.AncestryChanged:Connect(function()
                if not sound.Parent then
                    cleanup()
                end
            end)
        end

        sound.Changed:Connect(function(property)
            if property == "Volume" then
                sound.Volume = 0
            end
        end)
    end
end

local function checkAudioPlaying2()
    if audioReplacerActive2 then
        for _, sound in pairs(workspace:GetDescendants()) do
            replaceSound2(sound)
        end
    end
end

workspace.DescendantAdded:Connect(function(sound)
    if audioReplacerActive2 then
        replaceSound2(sound)
    end
end)

runservice.Heartbeat:Connect(checkAudioPlaying2)

-- Function for third audio replacer
local function replaceSound3(sound)
    if audioReplacerActive3 and sound:IsA("Sound") and audioPairs3[sound.SoundId] then
        local newSoundId = audioPairs3[sound.SoundId]
        local newSoundName = "NewSound_" .. sound.SoundId
        sound.Volume = 0

        if not activeSounds3[newSoundName] then
            local newSound = Instance.new("Sound")
            newSound.SoundId = newSoundId
            newSound.Parent = soundservice
            newSound.Name = newSoundName
            newSound:Play()

            activeSounds3[newSoundName] = newSound

            local function cleanup()
                if activeSounds3[newSoundName] then
                    activeSounds3[newSoundName]:Stop()
                    activeSounds3[newSoundName]:Destroy()
                    activeSounds3[newSoundName] = nil
                end
            end

            sound.Stopped:Connect(cleanup)
            sound.AncestryChanged:Connect(function()
                if not sound.Parent then
                    cleanup()
                end
            end)
        end

        sound.Changed:Connect(function(property)
            if property == "Volume" then
                sound.Volume = 0
            end
        end)
    end
end

local function checkAudioPlaying3()
    if audioReplacerActive3 then
        for _, sound in pairs(workspace:GetDescendants()) do
            replaceSound3(sound)
        end
    end
end

workspace.DescendantAdded:Connect(function(sound)
    if audioReplacerActive3 then
        replaceSound3(sound)
    end
end)

runservice.Heartbeat:Connect(checkAudioPlaying3)

-- ReGui buttons
Window:Button({
    Text = "Last Survivor -> Fear - Blocktales OST",
    Callback = function()
        audioReplacerActive = not audioReplacerActive
        ReGui:Notify({
            Title = "Theme Replacer",
            Content = audioReplacerActive and "Enabled" or "Disabled | new game must start",
            Duration = 3,
            Image = 4483362458
        })
    end
})

Window:Button({
    Text = "Last Survivor -> Komodo Dragon - Blocktales OST",
    Callback = function()
        audioReplacerActive2 = not audioReplacerActive2
        ReGui:Notify({
            Title = "Theme Replacer",
            Content = audioReplacerActive2 and "Enabled" or "Disabled | new game must start",
            Duration = 3,
            Image = 4483362458
        })
    end
})

Window:Button({
    Text = "1x1x1x1 Chase -> Griefer/Bubonic Plant - Blocktales",
    Callback = function()
        audioReplacerActive3 = not audioReplacerActive3
        ReGui:Notify({
            Title = "Theme Replacer",
            Content = audioReplacerActive3 and "Enabled" or "Disabled | new game must start",
            Duration = 3,
            Image = 4483362458
        })
    end
})
