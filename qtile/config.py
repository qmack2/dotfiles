import os
import re
import socket
import subprocess

from typing import List  # noqa: F401

from libqtile import qtile
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.widget import base

mod = "mod4"
terminal = "alacritty"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "t", lazy.window.toggle_floating(), desc='Toggle floating'), 
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "s", lazy.spawn('flameshot gui'), desc="Take screenshot"),
    Key([mod, "shift"], "Return", lazy.spawn("rofi -modi drun -show drun"), desc='Run Launcher'),
    Key([mod, "shift"], "b", lazy.spawn("brave --use-gl=desktop --enable-features=VaapiVideoDecoder --disable-features=UseChromeOSDirectVideoDecode"), desc='Web Browser'),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "p", lazy.spawn('dmenu_run'), desc="Spawn a command using a prompt widget"),
    Key([mod], "w", lazy.to_screen(0), desc='Keyboard focus to monitor 1'),
    Key([mod], "e", lazy.to_screen(1), desc='Keyboard focus to monitor 2'),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": "81A1C1",
                "border_normal": "1D2330"
                }


layouts = [
    #layout.MonadWide(**layout_theme),
    #layout.Bsp(**layout_theme),
    #layout.Stack(stacks=2, **layout_theme),
    #layout.Columns(**layout_theme),
    #layout.RatioTile(**layout_theme),
    #layout.Tile(shift_windows=True, **layout_theme),
    #layout.VerticalTile(**layout_theme),
    #layout.Matrix(**layout_theme),
    #layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    #layout.Stack(num_stacks=2),
    #layout.RatioTile(**layout_theme),
    #layout.TreeTab(
    #     font = "Ubuntu",
    #     fontsize = 10,
    #     sections = ["FIRST", "SECOND", "THIRD", "FOURTH"],
    #     section_fontsize = 10,
    #     border_width = 2,
    #     bg_color = "1c1f24",
    #     active_bg = "c678dd",
    #     active_fg = "000000",
    #     inactive_bg = "a9a1e1",
    #     inactive_fg = "1c1f24",
    #     padding_left = 0,
    #     padding_x = 0,
    #     padding_y = 5,
    #     section_top = 10,
    #     section_bottom = 20,
    #     level_shift = 8,
    #     vspace = 3,
    #     panel_width = 200
    #     ),
    layout.Floating(**layout_theme)
]


widget_defaults = dict(
    font="SF Pro Bold",
    fontsize=12,
    padding=0,
    background = "2e3440",
    foreground = "eceff4",
)
extension_defaults = widget_defaults.copy()

colors = [["#2e3440", "#2e3440"], #bg
          ["#4c566a", "#4c566a"], #bg2
          ["#8fbcbb", "#8fbcbb"], #Frost 0
          ["#88c0d0", "#88c0d0"], #Frost 1
          ["#81a1c1", "#81a1c1"], #Frost 2
          ["#5e81ac", "#5e81ac"], #Frost 3
          ["#5e81ac", "#5e81ac"], #aqua
          ["#4c566a", "#4c566a"], #gray
          ["#eceff4", "#eceff4"]] #foreground

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[0]
                       ),
                widget.Image(
                       filename = "~/.config/qtile/icons/python-white.png",
                       scale = "False",
                       ),
                widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[0]
                       ),
                widget.GroupBox(
                       font = "Ubuntu Bold",
                       fontsize = 9,
                       margin_y = 3,
                       margin_x = 0,
                       padding_y = 5,
                       padding_x = 3,
                       borderwidth = 3,
                       active = colors[8],
                       inactive = colors[7],
                       rounded = False,
                       highlight_color = colors[6],
                       highlight_method = "line",
                       this_current_screen_border = colors[6],
                       this_screen_border = colors [6],
                       other_current_screen_border = colors[4],
                       other_screen_border = colors[4],
                       foreground = colors[2],
                       background = colors[0]
                       ),
                widget.TextBox(
                       text = '|',
                       font = "Ubuntu Mono",
                       background = colors[0],
                       foreground = '474747',
                       padding = 2,
                       fontsize = 14
                       ),
                widget.WindowName(foreground = colors[8]),
                widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[0]
                       ),
                widget.Image(
                       filename = "~/.config/qtile/icons/left-sep.png",
                       scale = "True",
					   background = colors[1],
                       ),  
                widget.Systray(background = colors[1]),
                widget.Image(
                       filename = "~/.config/qtile/icons/mid-sep.png",
                       scale = "True",
					   background = colors[1],
                       ),               
                widget.OpenWeather(location = "elora,CA", format = '☁ {main_temp} °{units_temperature}', background = colors[1],padding = 2),
                widget.Image(
                       filename = "~/.config/qtile/icons/mid-sep.png",
                       scale = "True",
					   background = colors[1],
                       ),
                widget.CheckUpdates(
                       update_interval = 1800,
                       foreground = colors[8],
                       background = colors[1],
                       colour_have_updates = colors[8],
                       colour_no_updates = colors[8],
                       distro = 'Arch',
                       display_format='{updates} Updates',
                       no_update_string='No Updates',
                       padding = 5,
                       ),
               widget.Image(
                       filename = "~/.config/qtile/icons/mid-sep.png",
                       scale = "True",
					   background = colors[1],
                       ),
                widget.Clock(foreground = colors[8], background = colors[1],format="🗓 %A %B %d %Y - %I:%M%p"),
				widget.Image(
                       filename = "~/.config/qtile/icons/mid-sep.png",
                       scale = "True",
					   background = colors[1],
                       ),
                widget.Battery(
					format='{percent:2.0%} {hour:d}:{min:02d}',
					background = colors[1]),
				widget.Image(
                       filename = "~/.config/qtile/icons/right-sep.png",
                       scale = "True",
					   background = colors[1],
                       ),
            ],
            20,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[0]
                       ),
                widget.Image(
                       filename = "~/.config/qtile/icons/python-white.png",
                       scale = "False",
                       ),
                widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[0]
                       ),
                widget.GroupBox(
                       font = "Ubuntu Bold",
                       fontsize = 9,
                       margin_y = 3,
                       margin_x = 0,
                       padding_y = 5,
                       padding_x = 3,
                       borderwidth = 3,
                       active = colors[8],
                       inactive = colors[7],
                       rounded = False,
                       highlight_color = colors[6],
                       highlight_method = "line",
                       this_current_screen_border = colors[6],
                       this_screen_border = colors [6],
                       other_current_screen_border = colors[4],
                       other_screen_border = colors[4],
                       foreground = colors[2],
                       background = colors[0]
                       ),
                widget.TextBox(
                       text = '|',
                       font = "Ubuntu Mono",
                       background = colors[0],
                       foreground = '474747',
                       padding = 2,
                       fontsize = 14
                       ),
                widget.WindowName(foreground = colors[8]),
                widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[0]
                       ),
                widget.Image(
                       filename = "~/.config/qtile/icons/left-sep.png",
                       scale = "True",
					   background = colors[1],
                       ),               
                widget.OpenWeather(location = "elora,CA", format = '☁ {main_temp} °{units_temperature}', background = colors[1],padding = 2),
                widget.Image(
                       filename = "~/.config/qtile/icons/mid-sep.png",
                       scale = "True",
					   background = colors[1],
                       ),
                widget.CheckUpdates(
                       update_interval = 1800,
                       foreground = colors[8],
                       background = colors[1],
                       colour_have_updates = colors[8],
                       colour_no_updates = colors[8],
                       distro = 'Arch',
                       display_format='{updates} Updates',
                       no_update_string='No Updates',
                       padding = 5,
                       ),
               widget.Image(
                       filename = "~/.config/qtile/icons/mid-sep.png",
                       scale = "True",
					   background = colors[1],
                       ),
                widget.Clock(foreground = colors[8], background = colors[1],format="🗓 %A %B %d %Y - %I:%M%p"),
				widget.Image(
                       filename = "~/.config/qtile/icons/right-sep.png",
                       scale = "True",
					   background = colors[1],
                       ),
            ],
            20,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.run([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
