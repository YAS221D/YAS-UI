-- YAS UI - Example Usage
-- This file demonstrates all major features of the YAS UI library

local YAS = loadfile("https://raw.githubusercontent.com/YAS221D/YAS-UI/refs/heads/main/source.lua")()

-- ============================================================================
-- EXAMPLE 1: Basic Window with Simple Elements
-- ============================================================================

local function Example_BasicWindow()
    local Window = YAS.CreateWindow({
        Title = "YAS UI - Basic Example",
        Size = {Width = 500, Height = 400},
        Transparency = 0.98
    })

    local HomeTab = Window:AddTab("Home")
    HomeTab:AddLabel("Welcome to YAS UI!")
    HomeTab:AddLabel("A clean, smooth AMOLED-optimized UI library for Lua")
    
    HomeTab:AddButton("Say Hello", function()
        print("Hello from YAS UI!")
    end)

    Window:Show()
    return Window
end

-- ============================================================================
-- EXAMPLE 2: Multi-Tab Settings Panel
-- ============================================================================

local function Example_SettingsPanel()
    local Window = YAS.CreateWindow({
        Title = "YAS UI - Settings",
        Size = {Width = 600, Height = 500},
    })

    -- General Settings Tab
    local GeneralTab = Window:AddTab("General")
    GeneralTab:AddLabel("General Settings")
    
    local autoStart = false
    GeneralTab:AddToggle("Auto-start on launch", function(enabled)
        autoStart = enabled
        print("Auto-start: " .. (enabled and "ON" or "OFF"))
    end)

    local checkUpdates = true
    GeneralTab:AddToggle("Check for updates", function(enabled)
        checkUpdates = enabled
        print("Update check: " .. (enabled and "ON" or "OFF"))
    end)

    GeneralTab:AddButton("Save Settings", function()
        print("Settings saved!")
    end)

    -- Appearance Tab
    local AppearanceTab = Window:AddTab("Appearance")
    AppearanceTab:AddLabel("Customize Your Experience")
    
    local brightness = 80
    AppearanceTab:AddLabel("Brightness: " .. brightness .. "%")
    AppearanceTab:AddSlider(30, 100, brightness, function(value)
        brightness = value
        print("Brightness set to: " .. value .. "%")
    end)

    AppearanceTab:AddColorPicker(function(color)
        print("Accent color changed to: " .. color)
    end)

    -- Advanced Tab
    local AdvancedTab = Window:AddTab("Advanced")
    AdvancedTab:AddLabel("Advanced Options")
    
    AdvancedTab:AddDropdown({"Low", "Medium", "High", "Ultra"}, function(selected)
        print("Performance preset: " .. selected)
    end)

    local debugMode = false
    AdvancedTab:AddToggle("Debug Mode", function(enabled)
        debugMode = enabled
        print("Debug mode: " .. (enabled and "ENABLED" or "DISABLED"))
    end)

    Window:Show()
    return Window
end

-- ============================================================================
-- EXAMPLE 3: Form with Input Validation
-- ============================================================================

local function Example_LoginForm()
    local Window = YAS.CreateWindow({
        Title = "YAS UI - Login",
        Size = {Width = 400, Height = 350},
        Transparency = 0.98
    })

    local LoginTab = Window:AddTab("Login")
    LoginTab:AddLabel("Sign In to Your Account")

    local username = ""
    local password = ""

    LoginTab:AddTextBox("Enter username", function(value)
        username = value
    end)

    LoginTab:AddTextBox("Enter password", function(value)
        password = value
    end)

    local rememberMe = false
    LoginTab:AddToggle("Remember me", function(enabled)
        rememberMe = enabled
    end)

    LoginTab:AddButton("Sign In", function()
        if username == "" then
            print("ERROR: Username is required")
            return
        end
        if password == "" then
            print("ERROR: Password is required")
            return
        end
        
        print("Login attempt with username: " .. username)
        print("Remember me: " .. (rememberMe and "YES" or "NO"))
    end)

    LoginTab:AddButton("Create Account", function()
        print("Redirecting to registration...")
    end)

    Window:Show()
    return Window
end

-- ============================================================================
-- EXAMPLE 4: Interactive Dashboard
-- ============================================================================

local function Example_Dashboard()
    local Window = YAS.CreateWindow({
        Title = "YAS UI - Dashboard",
        Size = {Width = 800, Height = 600},
    })

    -- System Stats Tab
    local StatsTab = Window:AddTab("Statistics")
    StatsTab:AddLabel("System Performance Metrics")

    local cpuUsage = 45
    StatsTab:AddLabel("CPU Usage")
    StatsTab:AddSlider(0, 100, cpuUsage, function(value)
        cpuUsage = value
        print("CPU Usage: " .. value .. "%")
    end)

    local memUsage = 62
    StatsTab:AddLabel("Memory Usage")
    StatsTab:AddSlider(0, 100, memUsage, function(value)
        memUsage = value
        print("Memory Usage: " .. value .. "%")
    end)

    local diskUsage = 78
    StatsTab:AddLabel("Disk Usage")
    StatsTab:AddSlider(0, 100, diskUsage, function(value)
        diskUsage = value
        print("Disk Usage: " .. value .. "%")
    end)

    StatsTab:AddButton("Refresh Stats", function()
        cpuUsage = math.random(10, 90)
        memUsage = math.random(20, 80)
        diskUsage = math.random(30, 95)
        print("Stats refreshed")
    end)

    -- Network Tab
    local NetworkTab = Window:AddTab("Network")
    NetworkTab:AddLabel("Network Configuration")

    local networkMode = "Auto"
    NetworkTab:AddDropdown({"Auto", "Manual", "VPN", "Proxy"}, function(selected)
        networkMode = selected
        print("Network mode changed to: " .. selected)
    end)

    local autoConnect = true
    NetworkTab:AddToggle("Auto-connect", function(enabled)
        autoConnect = enabled
        print("Auto-connect: " .. (enabled and "ON" or "OFF"))
    end)

    NetworkTab:AddButton("Test Connection", function()
        print("Testing connection...")
    end)

    -- About Tab
    local AboutTab = Window:AddTab("About")
    AboutTab:AddLabel("YAS UI v1.0.0")
    AboutTab:AddLabel("A clean, smooth AMOLED-optimized UI library")
    AboutTab:AddLabel("")
    AboutTab:AddLabel("Features:")
    AboutTab:AddLabel("• Minimal design principles")
    AboutTab:AddLabel("• AMOLED color palette")
    AboutTab:AddLabel("• Smooth interactions")
    AboutTab:AddLabel("• Easy integration")

    Window:Show()
    return Window
end

-- ============================================================================
-- EXAMPLE 5: Data List with Actions
-- ============================================================================

local function Example_DataList()
    local Window = YAS.CreateWindow({
        Title = "YAS UI - Data Manager",
        Size = {Width = 700, Height = 500},
    })

    local ListTab = Window:AddTab("Items")
    ListTab:AddLabel("Item Management")

    local items = {"Item 1", "Item 2", "Item 3", "Item 4", "Item 5"}

    ListTab:AddLabel("Current Items: " .. #items)

    local newItemName = ""
    ListTab:AddTextBox("New item name...", function(value)
        newItemName = value
    end)

    ListTab:AddButton("Add Item", function()
        if newItemName ~= "" then
            table.insert(items, newItemName)
            print("Added: " .. newItemName)
            newItemName = ""
        else
            print("Item name cannot be empty")
        end
    end)

    ListTab:AddButton("Show All Items", function()
        print("=== Items List ===")
        for i, item in ipairs(items) do
            print(i .. ". " .. item)
        end
    end)

    ListTab:AddButton("Clear All", function()
        items = {}
        print("All items cleared")
    end)

    -- Search Tab
    local SearchTab = Window:AddTab("Search")
    SearchTab:AddLabel("Search Items")

    local searchQuery = ""
    SearchTab:AddTextBox("Search query...", function(value)
        searchQuery = value
    end)

    SearchTab:AddButton("Search", function()
        if searchQuery == "" then
            print("Search query cannot be empty")
            return
        end

        local results = {}
        for i, item in ipairs(items) do
            if string.find(item:lower(), searchQuery:lower()) then
                table.insert(results, item)
            end
        end

        if #results == 0 then
            print("No items found matching: " .. searchQuery)
        else
            print("Found " .. #results .. " items:")
            for i, item in ipairs(results) do
                print("  " .. i .. ". " .. item)
            end
        end
    end)

    Window:Show()
    return Window
end

-- ============================================================================
-- EXAMPLE 6: Settings with Color Customization
-- ============================================================================

local function Example_Customization()
    local Window = YAS.CreateWindow({
        Title = "YAS UI - Customization",
        Size = {Width = 600, Height = 500},
        Transparency = 0.96
    })

    -- Colors Tab
    local ColorsTab = Window:AddTab("Colors")
    ColorsTab:AddLabel("Customize Colors")

    local primaryColor = "#00D9FF"
    ColorsTab:AddLabel("Primary Color: " .. primaryColor)
    ColorsTab:AddColorPicker(function(color)
        primaryColor = color
        print("Primary color set to: " .. color)
    end)

    local secondaryColor = "#FF006E"
    ColorsTab:AddLabel("Secondary Color: " .. secondaryColor)
    ColorsTab:AddColorPicker(function(color)
        secondaryColor = color
        print("Secondary color set to: " .. color)
    end)

    -- Fonts Tab
    local FontsTab = Window:AddTab("Fonts")
    FontsTab:AddLabel("Font Settings")

    local fontSize = 12
    FontsTab:AddLabel("Font Size: " .. fontSize .. "pt")
    FontsTab:AddSlider(8, 20, fontSize, function(value)
        fontSize = value
        print("Font size set to: " .. value .. "pt")
    end)

    FontsTab:AddDropdown({"Segoe UI", "Arial", "Helvetica", "Courier"}, function(selected)
        print("Font changed to: " .. selected)
    end)

    -- Effects Tab
    local EffectsTab = Window:AddTab("Effects")
    EffectsTab:AddLabel("Visual Effects")

    local animations = true
    EffectsTab:AddToggle("Enable animations", function(enabled)
        animations = enabled
        print("Animations: " .. (enabled and "ENABLED" or "DISABLED"))
    end)

    local shadows = true
    EffectsTab:AddToggle("Enable shadows", function(enabled)
        shadows = enabled
        print("Shadows: " .. (enabled and "ENABLED" or "DISABLED"))
    end)

    local blurBg = false
    EffectsTab:AddToggle("Blur background", function(enabled)
        blurBg = enabled
        print("Background blur: " .. (enabled and "ENABLED" or "DISABLED"))
    end)

    Window:Show()
    return Window
end

-- ============================================================================
-- EXAMPLE 7: Complete Application
-- ============================================================================

local function Example_CompleteApp()
    local Window = YAS.CreateWindow({
        Title = "YAS UI - Complete Application",
        Size = {Width = 900, Height = 650},
    })

    -- Home Tab
    local HomeTab = Window:AddTab("Home")
    HomeTab:AddLabel("Welcome to YAS UI Complete Application")
    HomeTab:AddLabel("This example demonstrates a full-featured application.")
    HomeTab:AddButton("Get Started", function()
        print("Getting started with YAS UI...")
    end)
    HomeTab:AddButton("View Documentation", function()
        print("Opening documentation...")
    end)

    -- Profile Tab
    local ProfileTab = Window:AddTab("Profile")
    ProfileTab:AddLabel("User Profile")

    local userName = "User"
    ProfileTab:AddTextBox("Full Name", function(value)
        userName = value
    end)

    local userEmail = ""
    ProfileTab:AddTextBox("Email", function(value)
        userEmail = value
    end)

    ProfileTab:AddButton("Update Profile", function()
        print("Profile updated: " .. userName .. " (" .. userEmail .. ")")
    end)

    -- Settings Tab
    local SettingsTab = Window:AddTab("Settings")
    SettingsTab:AddLabel("Application Settings")

    local notificationsEnabled = true
    SettingsTab:AddToggle("Enable notifications", function(enabled)
        notificationsEnabled = enabled
    end)

    local darkMode = true
    SettingsTab:AddToggle("Dark mode", function(enabled)
        darkMode = enabled
    end)

    local language = "English"
    SettingsTab:AddDropdown({"English", "Spanish", "French", "German", "Japanese"}, function(selected)
        language = selected
        print("Language changed to: " .. selected)
    end)

    -- Advanced Tab
    local AdvancedTab = Window:AddTab("Advanced")
    AdvancedTab:AddLabel("Advanced Settings")

    local cacheEnabled = true
    AdvancedTab:AddToggle("Enable cache", function(enabled)
        cacheEnabled = enabled
    end)

    local apiTimeout = 30
    AdvancedTab:AddLabel("API Timeout: " .. apiTimeout .. "s")
    AdvancedTab:AddSlider(5, 120, apiTimeout, function(value)
        apiTimeout = value
    end)

    AdvancedTab:AddButton("Clear Cache", function()
        print("Cache cleared")
    end)

    AdvancedTab:AddButton("Reset to Defaults", function()
        print("Settings reset to defaults")
    end)

    -- About Tab
    local AboutTab = Window:AddTab("About")
    AboutTab:AddLabel("YAS UI Framework")
    AboutTab:AddLabel("Version: 1.0.0")
    AboutTab:AddLabel("License: MIT")
    AboutTab:AddLabel("")
    AboutTab:AddLabel("A clean, smooth AMOLED-optimized UI library")
    AboutTab:AddLabel("for Roblox and other Lua environments.")

    Window:Show()
    return Window
end

-- ============================================================================
-- MAIN: Run Examples
-- ============================================================================

-- Uncomment the example you want to run

-- Example_BasicWindow()
-- Example_SettingsPanel()
-- Example_LoginForm()
-- Example_Dashboard()
-- Example_DataList()
-- Example_Customization()
Example_CompleteApp()

-- Print instructions
print("\n=== YAS UI Examples ===")
print("Uncomment the example you want to run in the main section")
print("Available examples:")
print("  - Example_BasicWindow()")
print("  - Example_SettingsPanel()")
print("  - Example_LoginForm()")
print("  - Example_Dashboard()")
print("  - Example_DataList()")
print("  - Example_Customization()")
print("  - Example_CompleteApp()")
