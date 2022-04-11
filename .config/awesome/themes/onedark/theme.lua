local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local theme_path = "~/.config/awesome/themes/onedark/"

local theme = {}
--local wibar = require("wibar")
theme.nord0  = "#1a212e" --background
theme.nord1  = "#0c0e15" --alt bg 1
theme.nord2  = "#434C5E"
theme.nord3  = "#2a324a" --alt bg 2
theme.nord4  = "#93a4c3" --foreground
theme.nord5  = "#E5E9F0"
theme.nord6  = "#ECEFF4"
theme.nord7  = "#8FBCBB"
theme.nord8  = "#88C0D0"
theme.nord9  = "#41a7fc" --bright blue
theme.nord10 = "#2d80c4" --normal blue
theme.nord11 = "#34bfd0" -- cyan
theme.nord12 = "#D08770"
theme.nord13 = "#EBCB8B"
theme.nord14 = "#A3BE8C"
theme.nord15 = "#B48EAD"

theme.font          = "SF Pro Bold 9"
theme.transparent   = "#00000000"

theme.bg_normal     = theme.nord0
theme.bg_focus      = theme.bg_normal
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.bg_normal
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.nord4
theme.fg_focus      = theme.fg_normal
theme.fg_urgent     = theme.fg_normal
theme.fg_minimize   = theme.fg_normal

theme.useless_gap   = 6
theme.border_width  = 2
theme.border_focus  = theme.nord10
theme.border_normal = theme.nord1
theme.border_marked = theme.nord11

theme.tasklist_bg_focus = theme.nord0
theme.tasklist_icon_size = dpi(5)
theme.tasklist_plain_task_name = true
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"
theme.taglist_spacing = dpi(5)

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme_path.."../defaults/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

theme.wallpaper   = "~/Pictures/Wallpapers/arco-wallpaper.jpg"
theme.background  = theme.nord0

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil


theme.taglist_text_font = "JetBrains Mono 20"
-- theme.taglist_text_empty    =  {"","","","","","","","",""}
-- theme.taglist_text_occupied =  {"","","","","","","","",""}
-- theme.taglist_text_focused  = {"","","","","","","","",""}
-- theme.taglist_text_urgent   = {"","","","","","","","",""}

theme.taglist_text_empty    = {"", "", "", "", "", "", "", "", ""}
theme.taglist_text_occupied = {"", "", "", "", "", "", "", "", ""}
theme.taglist_text_focused  = {"", "", "", "", "", "", "", "", ""}
theme.taglist_text_urgent   = {"", "", "", "", "", "", "", "", ""}

-- theme.taglist_font = "Roboto 12"
theme.taglist_bg_focus = theme.bg_normal
theme.taglist_fg_focus = theme.nord9
theme.taglist_bg_occupied = theme.bg_normal
theme.taglist_fg_occupied = theme.nord10
theme.taglist_bg_empty = theme.bg_normal
theme.taglist_fg_empty = theme.nord3
theme.taglist_bg_urgent = theme.bg_normal
theme.taglist_fg_urgent = theme.nord11

return theme

