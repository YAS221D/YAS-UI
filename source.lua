-- YAS UI - Main Source
-- A clean, smooth AMOLED-optimized UI library for Lua
-- Version: 1.0.0

local YAS = {}
YAS.__VERSION = "1.0.0"
YAS.Windows = {}
YAS.Config = {}

-- ============================================================================
-- CONFIGURATION
-- ============================================================================

YAS.Config.Theme = {
    Background = "#000000",      -- Pure black for AMOLED
    Surface = "#1A1A1A",         -- Dark gray surfaces
    Primary = "#00D9FF",         -- Cyan accent
    Secondary = "#FF006E",       -- Hot pink accent
    Text = "#FFFFFF",            -- White text
    MutedText = "#B0B0B0",       -- Light gray for secondary text
    Border = "#2A2A2A",          -- Border color
}

YAS.Config.Font = {
    Family = "Segoe UI",
    Size = 12,
    SizeSmall = 10,
    SizeLarge = 14,
}

YAS.Config.Spacing = {
    Small = 4,
    Medium = 8,
    Large = 16,
}

YAS.Config.BorderRadius = 6

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

local function HexToRGB(hex)
    hex = hex:gsub("#", "")
    return tonumber("0x" .. hex:sub(1, 2)) / 255,
           tonumber("0x" .. hex:sub(3, 4)) / 255,
           tonumber("0x" .. hex:sub(5, 6)) / 255
end

local function RGBToHex(r, g, b)
    return string.format("#%02X%02X%02X", r * 255, g * 255, b * 255)
end

local function CreateUUID()
    return string.format("%08X-%04X-%04X-%04X-%012X",
        math.random(0, 0xFFFFFFFF),
        math.random(0, 0xFFFF),
        math.random(0, 0xFFFF),
        math.random(0, 0xFFFF),
        math.random(0, 0xFFFFFFFFFFFF)
    )
end

-- ============================================================================
-- ELEMENT CLASS
-- ============================================================================

local Element = {}
Element.__index = Element

function Element.new(elementType, properties)
    local self = setmetatable({}, Element)
    self.Type = elementType
    self.ID = CreateUUID()
    self.Visible = true
    self.Enabled = true
    
    for key, value in pairs(properties or {}) do
        self[key] = value
    end
    
    return self
end

function Element:SetVisible(visible)
    self.Visible = visible
    return self
end

function Element:SetEnabled(enabled)
    self.Enabled = enabled
    return self
end

-- ============================================================================
-- TAB CLASS
-- ============================================================================

local Tab = {}
Tab.__index = Tab

function Tab.new(name, window)
    local self = setmetatable({}, Tab)
    self.Name = name
    self.Window = window
    self.ID = CreateUUID()
    self.Elements = {}
    self.ElementCount = 0
    
    return self
end

function Tab:AddLabel(text)
    local element = Element.new("Label", {
        Text = text,
        Tab = self,
    })
    table.insert(self.Elements, element)
    self.ElementCount = self.ElementCount + 1
    return element
end

function Tab:AddButton(text, callback)
    local element = Element.new("Button", {
        Text = text,
        Callback = callback,
        Tab = self,
    })
    table.insert(self.Elements, element)
    self.ElementCount = self.ElementCount + 1
    return element
end

function Tab:AddTextBox(placeholder, callback)
    local element = Element.new("TextBox", {
        Placeholder = placeholder,
        Value = "",
        Callback = callback,
        Tab = self,
    })
    table.insert(self.Elements, element)
    self.ElementCount = self.ElementCount + 1
    return element
end

function Tab:AddToggle(text, callback)
    local element = Element.new("Toggle", {
        Text = text,
        Value = false,
        Callback = callback,
        Tab = self,
    })
    table.insert(self.Elements, element)
    self.ElementCount = self.ElementCount + 1
    return element
end

function Tab:AddSlider(min, max, default, callback)
    local element = Element.new("Slider", {
        Min = min,
        Max = max,
        Value = default or (min + max) / 2,
        Callback = callback,
        Tab = self,
    })
    table.insert(self.Elements, element)
    self.ElementCount = self.ElementCount + 1
    return element
end

function Tab:AddDropdown(options, callback)
    local element = Element.new("Dropdown", {
        Options = options,
        Value = options[1] or "",
        Callback = callback,
        Tab = self,
    })
    table.insert(self.Elements, element)
    self.ElementCount = self.ElementCount + 1
    return element
end

function Tab:AddColorPicker(callback)
    local element = Element.new("ColorPicker", {
        Value = "#000000",
        Callback = callback,
        Tab = self,
    })
    table.insert(self.Elements, element)
    self.ElementCount = self.ElementCount + 1
    return element
end

function Tab:GetElementCount()
    return self.ElementCount
end

-- ============================================================================
-- WINDOW CLASS
-- ============================================================================

local Window = {}
Window.__index = Window

function Window.new(options)
    local self = setmetatable({}, Window)
    
    self.ID = CreateUUID()
    self.Title = options.Title or "Window"
    self.Size = options.Size or {Width = 600, Height = 400}
    self.Position = options.Position or {X = 0, Y = 0}
    self.Transparency = options.Transparency or 0.98
    self.Draggable = options.Draggable ~= false
    
    self.Visible = false
    self.Focused = false
    
    self.Tabs = {}
    self.TabCount = 0
    self.CurrentTab = nil
    self.ActiveTabIndex = 1
    
    return self
end

function Window:AddTab(name)
    local tab = Tab.new(name, self)
    table.insert(self.Tabs, tab)
    self.TabCount = self.TabCount + 1
    
    if self.TabCount == 1 then
        self.CurrentTab = tab
        self.ActiveTabIndex = 1
    end
    
    return tab
end

function Window:SelectTab(tabIndex)
    if tabIndex >= 1 and tabIndex <= self.TabCount then
        self.CurrentTab = self.Tabs[tabIndex]
        self.ActiveTabIndex = tabIndex
        return true
    end
    return false
end

function Window:Show()
    self.Visible = true
    return self
end

function Window:Hide()
    self.Visible = false
    return self
end

function Window:Toggle()
    self.Visible = not self.Visible
    return self
end

function Window:Destroy()
    self.Visible = false
    self.Tabs = {}
    self.TabCount = 0
    self.CurrentTab = nil
    
    -- Remove from YAS registry
    for i, window in ipairs(YAS.Windows) do
        if window.ID == self.ID then
            table.remove(YAS.Windows, i)
            break
        end
    end
end

function Window:SetPosition(x, y)
    self.Position = {X = x, Y = y}
    return self
end

function Window:SetSize(width, height)
    self.Size = {Width = width, Height = height}
    return self
end

function Window:SetTitle(title)
    self.Title = title
    return self
end

function Window:SetTransparency(transparency)
    self.Transparency = math.clamp(transparency, 0, 1)
    return self
end

function Window:Focus()
    self.Focused = true
    return self
end

function Window:Unfocus()
    self.Focused = false
    return self
end

function Window:GetTabCount()
    return self.TabCount
end

function Window:GetCurrentTab()
    return self.CurrentTab
end

-- ============================================================================
-- MAIN YAS API
-- ============================================================================

function YAS.CreateWindow(options)
    local window = Window.new(options)
    table.insert(YAS.Windows, window)
    return window
end

function YAS.GetWindowByTitle(title)
    for _, window in ipairs(YAS.Windows) do
        if window.Title == title then
            return window
        end
    end
    return nil
end

function YAS.GetWindowByID(id)
    for _, window in ipairs(YAS.Windows) do
        if window.ID == id then
            return window
        end
    end
    return nil
end

function YAS.GetWindows()
    return YAS.Windows
end

function YAS.GetWindowCount()
    return #YAS.Windows
end

function YAS.ShowAllWindows()
    for _, window in ipairs(YAS.Windows) do
        window:Show()
    end
end

function YAS.HideAllWindows()
    for _, window in ipairs(YAS.Windows) do
        window:Hide()
    end
end

function YAS.DestroyAllWindows()
    for i = #YAS.Windows, 1, -1 do
        YAS.Windows[i]:Destroy()
    end
    YAS.Windows = {}
end

-- ============================================================================
-- CONFIGURATION API
-- ============================================================================

function YAS.SetTheme(theme)
    for key, value in pairs(theme) do
        YAS.Config.Theme[key] = value
    end
end

function YAS.SetFont(font)
    for key, value in pairs(font) do
        YAS.Config.Font[key] = value
    end
end

function YAS.GetTheme()
    return YAS.Config.Theme
end

function YAS.GetFont()
    return YAS.Config.Font
end

-- ============================================================================
-- EVENT SYSTEM
-- ============================================================================

YAS.Events = {}

function YAS.On(eventName, callback)
    if not YAS.Events[eventName] then
        YAS.Events[eventName] = {}
    end
    table.insert(YAS.Events[eventName], callback)
end

function YAS.Off(eventName, callback)
    if YAS.Events[eventName] then
        for i, cb in ipairs(YAS.Events[eventName]) do
            if cb == callback then
                table.remove(YAS.Events[eventName], i)
                break
            end
        end
    end
end

function YAS:_FireEvent(eventName, ...)
    if YAS.Events[eventName] then
        for _, callback in ipairs(YAS.Events[eventName]) do
            callback(...)
        end
    end
end

-- ============================================================================
-- UTILITY API
-- ============================================================================

function YAS.HexToRGB(hex)
    return HexToRGB(hex)
end

function YAS.RGBToHex(r, g, b)
    return RGBToHex(r, g, b)
end

function YAS.CreateUUID()
    return CreateUUID()
end

-- ============================================================================
-- INFO & VERSION
-- ============================================================================

function YAS.GetVersion()
    return YAS.__VERSION
end

function YAS.PrintInfo()
    print("========== YAS UI ==========")
    print("Version: " .. YAS.__VERSION)
    print("License: MIT")
    print("Windows: " .. YAS.GetWindowCount())
    print("===========================")
end

-- ============================================================================
-- COMPATIBILITY HELPERS
-- ============================================================================

-- Add clamp function if not available
if not math.clamp then
    function math.clamp(value, min, max)
        return math.max(min, math.min(max, value))
    end
end

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

-- Print welcome message
print("YAS UI v" .. YAS.__VERSION .. " loaded successfully!")
print("Use 'local YAS = loadfile(\"source.lua\")()' to import")

-- ============================================================================
-- EXPORT
-- ============================================================================

return YAS
