local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Config System",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "Config Manager",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MyHub",
        FileName = "DefaultConfig"
    }
})

local MainTab = Window:CreateTab("Configs", 4483362458)

local ConfigSelected = nil
local ConfigName = ""

-- DROPDOWN (IMPORTANT: store it in a variable)
local ConfigsDropdown = MainTab:CreateDropdown({
    Name = "Configs",
    Options = {},
    CurrentOption = {},
    MultipleOptions = false,
    Flag = "ConfigList",
    Callback = function(Value)
        ConfigSelected = Value
    end,
})

-- INPUT
MainTab:CreateInput({
    Name = "Config Name",
    CurrentValue = "",
    PlaceholderText = "Enter config name",
    RemoveTextAfterFocusLost = false,
    Flag = "ConfigName",
    Callback = function(Value)
        ConfigName = Value
    end,
})

-- SAVE NEW CONFIG
MainTab:CreateButton({
    Name = "Save New Config",
    Callback = function()
        if ConfigName ~= "" then
            Rayfield:SaveConfig(ConfigName)
            Rayfield:RefreshConfigsList(ConfigsDropdown)
        end
    end,
})

-- LOAD SELECTED CONFIG
MainTab:CreateButton({
    Name = "Load Selected Config",
    Callback = function()
        if ConfigSelected then
            Rayfield:LoadConfig(ConfigSelected)
        end
    end,
})

-- DELETE CONFIG
MainTab:CreateButton({
    Name = "Delete Selected Config",
    Callback = function()
        if ConfigSelected then
            Rayfield:DeleteConfig(ConfigSelected)
            Rayfield:RefreshConfigsList(ConfigsDropdown)
        end
    end,
})

-- REFRESH LIST
MainTab:CreateButton({
    Name = "Refresh Config List",
    Callback = function()
        Rayfield:RefreshConfigsList(ConfigsDropdown)
    end,
})

-- Initial refresh
Rayfield:RefreshConfigsList(ConfigsDropdown)
