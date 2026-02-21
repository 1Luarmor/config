-- Load Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create main window
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

-- Create main tab
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

-- INPUT (fixed)
MainTab:CreateInput({
    Name = "Config Name",
    CurrentValue = "",
    PlaceholderText = "Enter config name",
    RemoveTextAfterFocusLost = true, -- fixed bug
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

-- Example Toggle
local Toggle = MainTab:CreateToggle({
   Name = "Test Example",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       -- Function triggered when toggle changes
   end,
})

-- Initial refresh of dropdown
Rayfield:RefreshConfigsList(ConfigsDropdown)

-- Load configuration (fixes input bug)
Rayfield:LoadConfiguration()
