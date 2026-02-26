# YAS UI Documentation

A clean, smooth AMOLED-optimized UI library for Lua. Inspired by the elegance of Rayfield, YAS UI brings minimalist design principles with powerful functionality.

---

## Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Core Concepts](#core-concepts)
- [API Reference](#api-reference)
  - [Window](#window)
  - [Tabs](#tabs)
  - [Elements](#elements)
  - [Callbacks](#callbacks)
- [Styling](#styling)
- [Examples](#examples)
- [Advanced](#advanced)
- [Performance Tips](#performance-tips)
- [Troubleshooting](#troubleshooting)

---

## Installation

### Method 1: Direct Download

1. Download `source.lua` from the repository
2. Place it in your project directory
3. Import in your script:

```lua
local YAS = loadfile("source.lua")()
```

### Method 2: Git Clone

```bash
git clone https://github.com/yourusername/YAS-UI.git
cd YAS-UI
```

Then import:

```lua
local YAS = loadfile("YAS-UI/source.lua")()
```

---

## Quick Start

### Basic Window Setup

```lua
local YAS = loadfile("source.lua")()

-- Create a window
local Window = YAS.CreateWindow({
    Title = "My App",
    Size = {Width = 600, Height = 400},
    Position = {X = 100, Y = 100},
    Transparency = 0.95
})

-- Add content
local Tab = Window:AddTab("Home")
Tab:AddLabel("Welcome to YAS UI!")
Tab:AddButton("Click Me", function()
    print("Button clicked!")
end)

-- Show the window
Window:Show()
```

---

## Core Concepts

### Windows

Windows are the primary containers in YAS UI. Each window can hold multiple tabs and elements.

**Properties:**
- `Title`: String displayed in the window header
- `Size`: Table with `Width` and `Height` keys
- `Position`: Table with `X` and `Y` coordinates
- `Transparency`: Float (0-1) for window opacity
- `Draggable`: Boolean to enable/disable window dragging

**Methods:**
- `AddTab(name)`: Create a new tab
- `Show()`: Display the window
- `Hide()`: Hide the window
- `Destroy()`: Remove the window and all elements
- `SetPosition(x, y)`: Move the window
- `SetSize(width, height)`: Resize the window

### Tabs

Tabs organize elements within a window. Users can switch between tabs.

**Methods:**
- `AddLabel(text)`: Add text
- `AddButton(text, callback)`: Add a clickable button
- `AddTextBox(placeholder, callback)`: Add an input field
- `AddToggle(text, callback)`: Add an on/off toggle
- `AddSlider(min, max, default, callback)`: Add a number slider
- `AddDropdown(options, callback)`: Add a dropdown menu
- `AddColorPicker(callback)`: Add a color picker

### Elements

Elements are individual components within tabs. All elements support callbacks for user interactions.

---

## API Reference

### Window

#### CreateWindow(options)

Creates a new window instance.

```lua
local Window = YAS.CreateWindow({
    Title = "Application Title",
    Size = {Width = 800, Height = 600},
    Position = {X = 50, Y = 50},
    Transparency = 0.98,
    Draggable = true
})
```

**Options:**
- `Title` (string, required): Window title
- `Size` (table, required): `{Width, Height}`
- `Position` (table, optional): `{X, Y}` - Defaults to center
- `Transparency` (number, optional): 0-1 scale - Default: 0.98
- `Draggable` (boolean, optional): Default: true

**Returns:** Window object

#### Window:Show()

Display the window and all its content.

```lua
Window:Show()
```

#### Window:Hide()

Hide the window from view (keeps it in memory).

```lua
Window:Hide()
```

#### Window:Destroy()

Completely remove the window and free resources.

```lua
Window:Destroy()
```

#### Window:SetPosition(x, y)

Move the window to specified coordinates.

```lua
Window:SetPosition(200, 150)
```

#### Window:SetSize(width, height)

Resize the window.

```lua
Window:SetSize(900, 700)
```

#### Window:AddTab(name)

Create and return a new tab.

```lua
local Tab = Window:AddTab("Settings")
```

### Tabs

#### Tab:AddLabel(text)

Add a text label.

```lua
Tab:AddLabel("Configuration Options")
```

**Returns:** Label element

#### Tab:AddButton(text, callback)

Add a button with a click callback.

```lua
Tab:AddButton("Save", function()
    print("Settings saved!")
end)
```

**Callback Parameters:** None

#### Tab:AddTextBox(placeholder, callback)

Add a text input field.

```lua
Tab:AddTextBox("Enter your name...", function(value)
    print("User entered: " .. value)
end)
```

**Callback Parameters:**
- `value` (string): Current text in the box

#### Tab:AddToggle(text, callback)

Add an on/off switch.

```lua
Tab:AddToggle("Enable notifications", function(enabled)
    print(enabled and "Notifications ON" or "Notifications OFF")
end)
```

**Callback Parameters:**
- `enabled` (boolean): Current toggle state

#### Tab:AddSlider(min, max, default, callback)

Add a numeric slider.

```lua
Tab:AddSlider(0, 100, 50, function(value)
    print("Slider value: " .. value)
end)
```

**Parameters:**
- `min` (number): Minimum value
- `max` (number): Maximum value
- `default` (number): Initial value
- `callback` (function): Called on value change

**Callback Parameters:**
- `value` (number): Current slider value

#### Tab:AddDropdown(options, callback)

Add a dropdown selection menu.

```lua
Tab:AddDropdown({"Option 1", "Option 2", "Option 3"}, function(selected)
    print("Selected: " .. selected)
end)
```

**Parameters:**
- `options` (table): List of choices
- `callback` (function): Called on selection

**Callback Parameters:**
- `selected` (string): The chosen option

#### Tab:AddColorPicker(callback)

Add a color picker.

```lua
Tab:AddColorPicker(function(color)
    print("Color selected: " .. color)
end)
```

**Callback Parameters:**
- `color` (string): Hex color code (e.g., "#FF5733")

### Callbacks

All interactive elements support callbacks. Callbacks are invoked when the user interacts with the element.

**Best Practices:**
- Keep callbacks lightweight; heavy operations may cause lag
- Use callbacks to update application state
- Avoid recursive callbacks
- Handle errors gracefully within callbacks

```lua
Tab:AddButton("Process", function()
    if not ProcessData() then
        print("Error processing data")
        return
    end
    print("Processing complete")
end)
```

---

## Styling

### AMOLED Theme

YAS UI uses an AMOLED color palette optimized for true black backgrounds and vibrant accents.

**Color Palette:**
- Background: `#000000` (Pure black)
- Surface: `#1A1A1A` (Dark gray)
- Primary: `#00D9FF` (Cyan)
- Secondary: `#FF006E` (Hot pink)
- Text: `#FFFFFF` (White)
- Muted Text: `#B0B0B0` (Light gray)

### Custom Styling

Elements inherit the default theme. Customize colors in the configuration:

```lua
YAS.Config.Theme = {
    Background = "#000000",
    Surface = "#1A1A1A",
    Primary = "#00D9FF",
    Secondary = "#FF006E",
    Text = "#FFFFFF"
}
```

### Font Customization

```lua
YAS.Config.Font = {
    Family = "Segoe UI",
    Size = 12,
    SizeSmall = 10,
    SizeLarge = 14
}
```

---

## Examples

### Complete Login Form

```lua
local YAS = loadfile("source.lua")()

local Window = YAS.CreateWindow({
    Title = "Login",
    Size = {Width = 400, Height = 300},
    Transparency = 0.98
})

local LoginTab = Window:AddTab("Login")

LoginTab:AddLabel("Sign In to Your Account")

local username = ""
LoginTab:AddTextBox("Username", function(value)
    username = value
end)

local password = ""
LoginTab:AddTextBox("Password", function(value)
    password = value
end)

LoginTab:AddButton("Sign In", function()
    if username == "" or password == "" then
        print("Please fill all fields")
        return
    end
    
    if AuthenticateUser(username, password) then
        print("Login successful!")
        Window:Hide()
    else
        print("Invalid credentials")
    end
end)

Window:Show()
```

### Settings Panel with Multiple Tabs

```lua
local YAS = loadfile("source.lua")()

local Window = YAS.CreateWindow({
    Title = "Settings",
    Size = {Width = 600, Height = 500},
})

-- General Tab
local GeneralTab = Window:AddTab("General")
GeneralTab:AddLabel("General Settings")
GeneralTab:AddToggle("Auto-update", function(enabled)
    SaveSetting("AutoUpdate", enabled)
end)

-- Appearance Tab
local AppearanceTab = Window:AddTab("Appearance")
AppearanceTab:AddLabel("Customize Your Experience")
AppearanceTab:AddSlider(50, 100, 80, function(value)
    SaveSetting("Brightness", value)
end)
AppearanceTab:AddColorPicker(function(color)
    SaveSetting("AccentColor", color)
end)

-- Advanced Tab
local AdvancedTab = Window:AddTab("Advanced")
AdvancedTab:AddLabel("Advanced Options")
AdvancedTab:AddDropdown({"Low", "Medium", "High"}, function(selected)
    SaveSetting("Performance", selected)
end)

Window:Show()
```

### Data Visualization Panel

```lua
local YAS = loadfile("source.lua")()

local Window = YAS.CreateWindow({
    Title = "Dashboard",
    Size = {Width = 800, Height = 600},
})

local DashTab = Window:AddTab("Statistics")

DashTab:AddLabel("System Performance")

local cpuUsage = 45
DashTab:AddLabel("CPU Usage: " .. cpuUsage .. "%")
DashTab:AddSlider(0, 100, cpuUsage, function(value)
    cpuUsage = value
end)

local memUsage = 62
DashTab:AddLabel("Memory Usage: " .. memUsage .. "%")
DashTab:AddSlider(0, 100, memUsage, function(value)
    memUsage = value
end)

DashTab:AddButton("Refresh", function()
    cpuUsage = math.random(10, 90)
    memUsage = math.random(20, 80)
    print("Data refreshed")
end)

Window:Show()
```

---

## Advanced

### Custom Element Styling

Extend YAS UI with custom styling for specific elements:

```lua
local CustomButton = Tab:AddButton("Custom", function()
    print("Clicked!")
end)

CustomButton.Style = {
    Background = "#FF006E",
    Text = "#000000",
    BorderRadius = 8
}
CustomButton:ApplyStyle()
```

### Event Listeners

Register global event listeners:

```lua
YAS:On("WindowCreated", function(window)
    print("New window created: " .. window.Title)
end)

YAS:On("ElementClicked", function(element, tab)
    print("Element clicked in tab: " .. tab.Name)
end)
```

### Performance Optimization

For applications with many elements:

```lua
-- Batch element creation
local Tab = Window:AddTab("Batch")

for i = 1, 100 do
    Tab:AddLabel("Item " .. i)
end

-- Lazy loading
local LazyTab = Window:AddTab("Lazy")
LazyTab.OnActivated = function()
    if not LazyTab._loaded then
        -- Load content only when tab is shown
        for i = 1, 50 do
            LazyTab:AddLabel("Dynamic Item " .. i)
        end
        LazyTab._loaded = true
    end
end
```

---

## Performance Tips

1. **Minimize Callbacks**: Keep callback functions lightweight
2. **Lazy Load**: Load elements only when needed
3. **Batch Updates**: Update multiple settings in a single operation
4. **Use Debouncing**: For frequently-triggered callbacks:

```lua
local debounceTimer = 0
Tab:AddSlider(0, 100, 50, function(value)
    if debounceTimer < 0.1 then
        return
    end
    debounceTimer = 0
    print("Value: " .. value)
end)
```

5. **Memory Management**: Destroy unused windows

```lua
if not windowNeeded then
    Window:Destroy()
end
```

---

## Troubleshooting

### Window Not Appearing

**Solution:** Call `Window:Show()` after creating elements

```lua
local Window = YAS.CreateWindow({Title = "Test", Size = {Width = 400, Height = 300}})
local Tab = Window:AddTab("Home")
Tab:AddLabel("Hello!")
Window:Show()  -- Don't forget this!
```

### Callback Not Firing

**Solution:** Ensure the callback is properly defined and the element is on a visible tab

```lua
Tab:AddButton("Test", function()
    print("This will print when clicked")
end)
```

### Layout Issues

**Solution:** Adjust window size or use appropriate spacing

```lua
Window:SetSize(600, 400)  -- Larger window for more content
```

### Performance Lag

**Solution:** Reduce number of elements or optimize callbacks

```lua
-- Instead of creating 500+ elements:
local Items = {}
for i = 1, 500 do
    table.insert(Items, "Item " .. i)
end

-- Display paginated:
local CurrentPage = 1
local ItemsPerPage = 20

-- Render only visible items
for i = 1, ItemsPerPage do
    local itemIndex = (CurrentPage - 1) * ItemsPerPage + i
    if Items[itemIndex] then
        Tab:AddLabel(Items[itemIndex])
    end
end
```

---

## Contributing

Contributions are welcome! Please follow these guidelines:

1. Keep code clean and readable
2. Document new features
3. Test thoroughly
4. Submit pull requests with clear descriptions

---

## License

YAS UI is licensed under the MIT License. See LICENSE file for details.

---

## Support

For issues, questions, or suggestions:
- Open an issue on GitHub
- Check existing documentation
- Review example files

---

**Version:** 1.0.0  
**Last Updated:** 2025  
**Maintained by:** YAS Community
