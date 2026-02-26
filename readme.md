# YAS UI

A clean, smooth AMOLED-optimized UI library for Lua. Inspired by Rayfield's elegance, YAS UI brings minimalist design principles with powerful functionality.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Lua](https://img.shields.io/badge/lua-5.1+-blue)

---

## Features

✨ **Clean Design** – Minimalist AMOLED theme optimized for true black backgrounds  
🎨 **Customizable** – Easy theming and styling system  
⚡ **Smooth** – Optimized performance and animations  
📦 **Lightweight** – Minimal dependencies, easy integration  
🎯 **Intuitive API** – Simple, clear methods for creating UI elements  
🌙 **Dark-First** – Built with AMOLED displays in mind  
♿ **Accessible** – Clear visual hierarchy and readable typography  

---

## Quick Start

### Installation

```lua
local YAS = loadfile("source.lua")()
```

### Basic Example

```lua
local Window = YAS.CreateWindow({
    Title = "My App",
    Size = {Width = 600, Height = 400}
})

local Tab = Window:AddTab("Home")
Tab:AddLabel("Hello, YAS UI!")
Tab:AddButton("Click Me", function()
    print("Button clicked!")
end)

Window:Show()
```

---

## Documentation

For comprehensive documentation, see [Documentation.md](Documentation.md)

Quick links:
- [Installation Guide](Documentation.md#installation)
- [API Reference](Documentation.md#api-reference)
- [Examples](Documentation.md#examples)
- [Styling Guide](Documentation.md#styling)
- [Troubleshooting](Documentation.md#troubleshooting)

---

## Files

- **source.lua** – Main library source code
- **icons.lua** – Icon library with emoji and symbol sets
- **example.lua** – Comprehensive examples demonstrating all features
- **Documentation.md** – Full API documentation
- **README.md** – This file
- **LICENSE** – MIT License

---

## Features Overview

### Windows
Create elegant, draggable windows with multiple tabs and customizable properties.

```lua
local Window = YAS.CreateWindow({
    Title = "Application",
    Size = {Width = 800, Height = 600},
    Transparency = 0.98,
    Draggable = true
})
```

### Tabs
Organize content with tab-based navigation.

```lua
local HomeTab = Window:AddTab("Home")
local SettingsTab = Window:AddTab("Settings")
```

### Elements
Rich set of UI elements with smooth interactions.

```lua
-- Text
Tab:AddLabel("Welcome!")

-- Interactive
Tab:AddButton("Click Me", callback)
Tab:AddToggle("Enable Feature", callback)
Tab:AddSlider(0, 100, 50, callback)
Tab:AddTextBox("Enter text...", callback)
Tab:AddDropdown({"Option 1", "Option 2"}, callback)
Tab:AddColorPicker(callback)
```

### Icons
Built-in icon support for enhanced UI.

```lua
local Icons = loadfile("icons.lua")()
Tab:AddLabel(Icons.Get("Success") .. " Operation completed!")
```

---

## AMOLED Theme

YAS UI uses a carefully-tuned AMOLED color palette:

| Component | Color | Hex |
|-----------|-------|-----|
| Background | Pure Black | `#000000` |
| Surface | Dark Gray | `#1A1A1A` |
| Primary | Cyan | `#00D9FF` |
| Secondary | Hot Pink | `#FF006E` |
| Text | White | `#FFFFFF` |
| Muted Text | Light Gray | `#B0B0B0` |

---

## Examples

### Login Form
```lua
local Window = YAS.CreateWindow({
    Title = "Login",
    Size = {Width = 400, Height = 300}
})

local LoginTab = Window:AddTab("Login")
LoginTab:AddLabel("Sign In")

local username = ""
LoginTab:AddTextBox("Username", function(value)
    username = value
end)

LoginTab:AddButton("Sign In", function()
    print("Logging in as: " .. username)
end)

Window:Show()
```

### Settings Panel
```lua
local Window = YAS.CreateWindow({
    Title = "Settings",
    Size = {Width = 600, Height = 500}
})

local GeneralTab = Window:AddTab("General")
GeneralTab:AddToggle("Auto-update", function(enabled)
    print("Auto-update: " .. (enabled and "ON" or "OFF"))
end)

local AppearanceTab = Window:AddTab("Appearance")
AppearanceTab:AddSlider(30, 100, 80, function(value)
    print("Brightness: " .. value .. "%")
end)

Window:Show()
```

See [example.lua](example.lua) for more comprehensive examples.

---

## API Quick Reference

### Window Methods
```lua
Window:Show()              -- Display the window
Window:Hide()              -- Hide the window
Window:Destroy()           -- Remove the window
Window:SetPosition(x, y)   -- Move to coordinates
Window:SetSize(w, h)       -- Resize window
Window:AddTab(name)        -- Create new tab
```

### Tab Methods
```lua
Tab:AddLabel(text)                          -- Add text label
Tab:AddButton(text, callback)               -- Add button
Tab:AddTextBox(placeholder, callback)       -- Add text input
Tab:AddToggle(text, callback)               -- Add toggle switch
Tab:AddSlider(min, max, default, callback)  -- Add slider
Tab:AddDropdown(options, callback)          -- Add dropdown
Tab:AddColorPicker(callback)                -- Add color picker
```

---

## Performance

YAS UI is optimized for performance:

- Lazy rendering of off-screen elements
- Efficient event handling
- Minimal memory footprint
- Supports 100+ elements without lag

### Tips for Best Performance

1. **Use lazy loading** for dynamic content
2. **Batch element creation** when possible
3. **Keep callbacks lightweight**
4. **Destroy unused windows** to free memory

See [Performance Tips](Documentation.md#performance-tips) for more details.

---

## Customization

### Theme Customization
```lua
YAS.Config.Theme = {
    Background = "#000000",
    Surface = "#1A1A1A",
    Primary = "#00D9FF",
    Secondary = "#FF006E",
    Text = "#FFFFFF"
}
```

### Font Settings
```lua
YAS.Config.Font = {
    Family = "Segoe UI",
    Size = 12,
    SizeSmall = 10,
    SizeLarge = 14
}
```

---

## Compatibility

- **Lua:** 5.1+
- **Environments:** 
  - Roblox (with appropriate rendering)
  - Custom Lua environments
  - Game modding frameworks

---

## Troubleshooting

### Window doesn't appear
- Make sure to call `Window:Show()` after creating elements

### Callback not firing
- Verify the element is on a visible tab
- Check callback function syntax

### Layout issues
- Adjust window size with `Window:SetSize()`
- Consider element spacing and padding

See [Troubleshooting Guide](Documentation.md#troubleshooting) for more solutions.

---

## Contributing

Contributions are welcome! Please:

1. Keep code clean and readable
2. Document new features
3. Test thoroughly
4. Submit PRs with clear descriptions

---

## License

YAS UI is licensed under the MIT License. See [LICENSE](LICENSE) for details.

```
MIT License

Copyright (c) 2025 YAS UI Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software...
```

---

## Support

- 📖 [Full Documentation](Documentation.md)
- 💡 [Examples](example.lua)
- 🎨 [Icons Library](icons.lua)
- ⚙️ [Source Code](source.lua)

---

## Roadmap

- [x] Core UI elements
- [x] Tab system
- [x] AMOLED theme
- [x] Icon support
- [ ] Advanced animations
- [ ] Custom themes marketplace
- [ ] Plugin system
- [ ] More element types

---

## Changelog

### v1.0.0 (2025)
- Initial release
- Core UI elements
- AMOLED theme
- Comprehensive documentation
- Icon library
- Example applications

---

## Credits

Inspired by [Rayfield](https://github.com/rayfield/rayfield) – a beautiful UI library.

Built with ❤️ for the Lua community.

---

## Contact

For questions, issues, or suggestions:
- Open an issue on GitHub
- Check the documentation
- Review examples

---

**Made with ❤️ by YAS Community**
