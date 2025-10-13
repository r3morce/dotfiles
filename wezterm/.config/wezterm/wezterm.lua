local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ============================================================================
-- PLATFORM DETECTION
-- ============================================================================
local function is_macos()
  return wezterm.target_triple:find("apple") ~= nil
end

local function is_linux()
  return wezterm.target_triple:find("linux") ~= nil
end

-- ============================================================================
-- BASIC CONFIGURATION
-- ============================================================================
config.color_scheme = "Dracula (Official)"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.font = wezterm.font("Fira Code")

-- Platform-specific font size
if is_macos() then
  config.font_size = 16.0
  config.line_height = 1.2
elseif is_linux() then
  config.font_size = 12.0
  -- config.line_height = 1.2  -- Commented out for Linux compatibility
end

-- ============================================================================
-- KEY BINDINGS
-- ============================================================================
-- Pane navigation key bindings
config.keys = {
  -- Switch between panes using Alt + arrow keys
  {
    key = "LeftArrow",
    mods = "ALT",
    action = wezterm.action({ ActivatePaneDirection = "Left" }),
  },
  {
    key = "RightArrow",
    mods = "ALT",
    action = wezterm.action({ ActivatePaneDirection = "Right" }),
  },
  {
    key = "UpArrow",
    mods = "ALT",
    action = wezterm.action({ ActivatePaneDirection = "Up" }),
  },
  {
    key = "DownArrow",
    mods = "ALT",
    action = wezterm.action({ ActivatePaneDirection = "Down" }),
  },
  -- Cycle through panes with Alt + Tab
  {
    key = "Tab",
    mods = "ALT",
    action = wezterm.action({ ActivatePaneDirection = "Next" }),
  },
  {
    key = "Tab",
    mods = "ALT|SHIFT",
    action = wezterm.action({ ActivatePaneDirection = "Prev" }),
  },
}

-- ============================================================================
-- PLATFORM-SPECIFIC CONFIGURATIONS
-- ============================================================================
if is_macos() then
  -- macOS-specific configurations
  config.color_scheme_dirs = { "~/.config/wezterm/colors" }
elseif is_linux() then
  -- Linux-specific configurations
  -- config.color_scheme_dirs = { "~/.config/wezterm/colors" }  -- Commented for compatibility
end

return config