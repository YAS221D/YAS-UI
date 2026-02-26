-- YAS UI - Icon Library
-- A collection of minimalist icon definitions for use in YAS UI
-- Each icon is represented as a simple string or Unicode character

local Icons = {}

-- ============================================================================
-- UNICODE SYMBOLS & ICONS
-- ============================================================================

Icons.Symbols = {
    -- Navigation
    ChevronLeft = "‹",
    ChevronRight = "›",
    ChevronUp = "˅",
    ChevronDown = "˄",
    ArrowLeft = "←",
    ArrowRight = "→",
    ArrowUp = "↑",
    ArrowDown = "↓",
    
    -- Common Actions
    Plus = "+",
    Minus = "-",
    Close = "✕",
    Check = "✓",
    Cross = "✗",
    
    -- UI Elements
    Menu = "☰",
    Settings = "⚙",
    Search = "⌕",
    Home = "⌂",
    User = "👤",
    Bell = "🔔",
    Heart = "♥",
    Star = "★",
    
    -- Status Icons
    Info = "ℹ",
    Warning = "⚠",
    Error = "⛔",
    Success = "✔",
    Loading = "⟳",
    
    -- Media
    Play = "▶",
    Pause = "⏸",
    Stop = "⏹",
    Volume = "🔊",
    Mute = "🔇",
    
    -- Files & Folders
    File = "📄",
    Folder = "📁",
    Download = "⬇",
    Upload = "⬆",
    Copy = "📋",
    
    -- Social & Communication
    Mail = "✉",
    Share = "🔗",
    Link = "🔗",
    Phone = "☎",
    Message = "💬",
    
    -- Utilities
    Clock = "🕐",
    Calendar = "📅",
    Lock = "🔒",
    Unlock = "🔓",
    Refresh = "🔄",
    Gear = "⚙",
    
    -- Shapes
    Circle = "●",
    Square = "■",
    Triangle = "▲",
    Diamond = "◆",
}

-- ============================================================================
-- ICON SETS (Emoji-based for better visual clarity)
-- ============================================================================

Icons.Emoji = {
    -- Navigation
    Home = "🏠",
    Back = "🔙",
    Forward = "🔜",
    Menu = "☰",
    
    -- File Operations
    File = "📄",
    Folder = "📁",
    Download = "📥",
    Upload = "📤",
    Trash = "🗑️",
    Copy = "📋",
    Paste = "📌",
    
    -- Editing
    Edit = "✏️",
    Delete = "🗑️",
    Save = "💾",
    Undo = "↶",
    Redo = "↷",
    
    -- Settings & System
    Settings = "⚙️",
    Configuration = "🔧",
    Tools = "🛠️",
    Power = "⏻",
    
    -- Communication
    Message = "💬",
    Mail = "📧",
    Phone = "📞",
    Share = "🔗",
    Like = "👍",
    
    -- Status & Notifications
    Info = "ℹ️",
    Warning = "⚠️",
    Error = "❌",
    Success = "✅",
    Loading = "⏳",
    
    -- Time
    Clock = "🕐",
    Calendar = "📅",
    Alarm = "⏰",
    Timer = "⏱️",
    
    -- Media
    Image = "🖼️",
    Video = "🎥",
    Audio = "🎵",
    Camera = "📷",
    
    -- Security
    Lock = "🔒",
    Unlock = "🔓",
    Key = "🔑",
    Password = "🔐",
    
    -- User & Profile
    User = "👤",
    Users = "👥",
    Profile = "👤",
    Account = "🎫",
    
    -- Navigation & Direction
    Home = "🏠",
    Search = "🔍",
    Filter = "🎚️",
    Sort = "📊",
    
    -- Light & Dark
    Sun = "☀️",
    Moon = "🌙",
    Star = "⭐",
    
    -- Other
    Gift = "🎁",
    Favorite = "❤️",
    Flag = "🚩",
    Pin = "📍",
    Bell = "🔔",
    Mute = "🔇",
    Volume = "🔊",
}

-- ============================================================================
-- ICON ALIASES (Friendly names for common icons)
-- ============================================================================

Icons.Aliases = {
    -- Navigation
    Back = Icons.Emoji.Back,
    Next = Icons.Emoji.Forward,
    Previous = Icons.Emoji.Back,
    Menu = Icons.Emoji.Menu,
    
    -- File Management
    NewFile = Icons.Emoji.File,
    NewFolder = Icons.Emoji.Folder,
    DeleteFile = Icons.Emoji.Trash,
    
    -- Actions
    Create = Icons.Emoji.Edit,
    Update = Icons.Emoji.Edit,
    Remove = Icons.Emoji.Delete,
    
    -- Status
    Loading = Icons.Emoji.Loading,
    Busy = Icons.Emoji.Loading,
    Available = Icons.Emoji.Success,
    Unavailable = Icons.Emoji.Error,
    
    -- Theme
    DarkMode = Icons.Emoji.Moon,
    LightMode = Icons.Emoji.Sun,
    AutoTheme = Icons.Emoji.Settings,
}

-- ============================================================================
-- CUSTOM ICON SETS
-- ============================================================================

Icons.Minimal = {
    -- Very minimal line-based representations
    Arrow = ">",
    ArrowLeft = "<",
    Check = "[✓]",
    Cross = "[✕]",
    Plus = "[+]",
    Minus = "[-]",
    Settings = "[⚙]",
    Home = "[⌂]",
    User = "[👤]",
    File = "[📄]",
    Folder = "[📁]",
    Search = "[🔍]",
    Menu = "[☰]",
    Close = "[✕]",
}

Icons.Outlined = {
    -- Outlined icon representations
    Check = "☐✓",
    Cross = "☐✕",
    Square = "☐",
    Circle = "○",
    Triangle = "△",
    Diamond = "◇",
    Star = "☆",
}

Icons.Filled = {
    -- Filled icon representations
    Check = "☑✓",
    Cross = "☒✕",
    Square = "■",
    Circle = "●",
    Triangle = "▲",
    Diamond = "◆",
    Star = "★",
}

-- ============================================================================
-- ICON MANAGEMENT FUNCTIONS
-- ============================================================================

function Icons.Get(iconName)
    -- Try to get from multiple sets
    return Icons.Aliases[iconName] 
        or Icons.Emoji[iconName] 
        or Icons.Symbols[iconName] 
        or Icons.Minimal[iconName] 
        or "●"
end

function Icons.GetEmoji(iconName)
    return Icons.Emoji[iconName] or "●"
end

function Icons.GetSymbol(iconName)
    return Icons.Symbols[iconName] or "●"
end

function Icons.GetMinimal(iconName)
    return Icons.Minimal[iconName] or "●"
end

function Icons.Register(name, icon)
    -- Register custom icon
    Icons.Aliases[name] = icon
end

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

function Icons.CreateIconButton(text, icon, callback)
    -- Helper function to create button with icon
    local iconStr = Icons.Get(icon)
    return {
        Text = iconStr .. " " .. text,
        Callback = callback
    }
end

function Icons.CreateIconLabel(text, icon)
    -- Helper function to create label with icon
    local iconStr = Icons.Get(icon)
    return iconStr .. " " .. text
end

-- ============================================================================
-- PRESET ICON COMBINATIONS
-- ============================================================================

Icons.Presets = {
    FileMenu = {
        New = Icons.Get("File"),
        Open = Icons.Get("Folder"),
        Save = Icons.Get("Save"),
        Close = Icons.Get("Close"),
    },
    EditMenu = {
        Undo = Icons.Get("Undo"),
        Redo = Icons.Get("Redo"),
        Cut = Icons.Get("Copy"),
        Copy = Icons.Get("Copy"),
        Paste = Icons.Get("Paste"),
    },
    SettingsMenu = {
        General = Icons.Get("Settings"),
        Appearance = Icons.Get("Sun"),
        Security = Icons.Get("Lock"),
        About = Icons.Get("Info"),
    },
    Status = {
        Success = Icons.Get("Success"),
        Warning = Icons.Get("Warning"),
        Error = Icons.Get("Error"),
        Info = Icons.Get("Info"),
    },
    Communication = {
        Message = Icons.Get("Message"),
        Mail = Icons.Get("Mail"),
        Phone = Icons.Get("Phone"),
        Share = Icons.Get("Share"),
    }
}

return Icons
