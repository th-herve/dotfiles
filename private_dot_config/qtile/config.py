#   █████  ▄▄▄█████▓ ██▓ ██▓    ▓█████ 
# ▒██▓  ██▒▓  ██▒ ▓▒▓██▒▓██▒    ▓█   ▀ 
# ▒██▒  ██░▒ ▓██░ ▒░▒██▒▒██░    ▒███   
# ░██  █▀ ░░ ▓██▓ ░ ░██░▒██░    ▒▓█  ▄ 
# ░▒███▒█▄   ▒██▒ ░ ░██░░██████▒░▒████▒
# ░░ ▒▒░ ▒   ▒ ░░   ░▓  ░ ▒░▓  ░░░ ▒░ ░
#  ░ ▒░  ░     ░     ▒ ░░ ░ ▒  ░ ░ ░  ░
#   ░   ░   ░       ▒ ░  ░ ░      ░   
#    ░              ░      ░  ░   ░  ░
                                     

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

import datetime
import os
import subprocess

mod = "mod4"
terminal = "kitty"
editor = "nvim"

@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key(
        [mod, "shift"],
        "m",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),


    # Toggle between different layouts as defined below
    Key([mod], "m", lazy.next_layout(), desc="Toggle between layouts"),

    Key([mod], "x", lazy.window.kill(), desc="Kill focused window"),

    
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "p", lazy.window.toggle_floating(), desc="Toggle floating",),

    # Rofi
    Key([mod], "d", lazy.spawn("rofi -show drun")),
    Key([mod], "f", lazy.spawn("rofi -show window")),
    Key([mod], "g", lazy.spawn("rofi -show filebrowser")),
    Key([mod], "c", lazy.spawn("/home/adiantum/.config/rofi/vimwiki.sh")),
    Key([mod], "s", lazy.spawn("/home/adiantum/.config/rofi/select_spotify_playlist/rofi_spotify_playlist.sh")),
    

    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "t", lazy.spawn(terminal)),

    # Media control
    Key([], "XF86AudioLowerVolume",lazy.spawn("amixer -c 1 sset PCM 2%-")),
    Key([], "XF86AudioRaiseVolume",lazy.spawn("amixer -c 1 sset PCM 2%+")),
    Key([], "XF86AudioPrev",lazy.spawn("playerctl previous")),
    Key([], "XF86AudioNext",lazy.spawn("playerctl next")),
    Key([], "XF86AudioPlay",lazy.spawn("playerctl --player=spotify play-pause")),

    Key([mod], "o", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next keyboard layout."),
]

# Colors
catppuccin = {
    "flamingo": "#F3CDCD",
    "mauve": "#DDB6F2",
    "pink": "#f5c2e7",
    "maroon": "#e8a2af",
    "red": "#f28fad",
    "peach": "#f8bd96",
    "yellow": "#fae3b0",
    "green": "#abe9b3",
    "teal": "#b4e8e0",
    "blue": "#96cdfb",
    "sky": "#89dceb",
    "white": "#d9e0ee",
    "gray": "#6e6c7e",
    "black": "#1a1826",
        }

groups = [Group("q",  label="  "),
                   
          Group("w",  label=" 󰈹 ", spawn="firefox"),
                   
          Group("e",  label=" 󰚩 ", spawn="google-chrome https://chat.openai.com/"),

          Group("1",  label="  "),

          Group("2",  label="  "),

          Group("3",  label="  ", spawn="google-chrome https://mail.google.com/mail/u/1/#inbox"),

          Group("4",  label="", spawn="spotify")]


for i in groups:
    keys.extend( [
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
        ]
    )

layouts = [
    layout.Columns(
        border_focus=catppuccin["teal"],
        border_normal=catppuccin["black"],
        border_focus_stack=catppuccin['green'],
        border_width=1,
        margin=8,
        ),
    layout.Max(),
]

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=16,
    padding=3,
    forground=catppuccin["black"],
)
extension_defaults = widget_defaults.copy()

# add white space easily in the bottom bar
def add_white_space(background_color, space_number=1):
    return widget.TextBox(text=" " * space_number, background=background_color )

# define half circle size in bar
CIRCLE_SIZE = 35

screens = [
    Screen(

        bottom=bar.Bar(
            [
                add_white_space(catppuccin["green"]),

                widget.QuickExit(
                    default_text="󰄛 ",
                    fontsize=25, 
                    background=catppuccin["green"],
                    foreground=catppuccin["black"],
                    countdown_format='{} ',
                    ),

                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=CIRCLE_SIZE,
                    foreground=catppuccin["green"],
                    background=catppuccin["mauve"],
                    ),

                widget.GroupBox(highlight_method="line", 
                                fontsize=20,
                                background=catppuccin["mauve"], 
                                highlight_color=[catppuccin["mauve"], catppuccin["mauve"]],
                                inactive=catppuccin["black"],
                                active=catppuccin["black"]
                                ),

                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=CIRCLE_SIZE,
                    foreground=catppuccin["mauve"],
                    background=catppuccin["black"],
                    ),

                widget.WindowName(
                    format="{state}",
                    background=catppuccin["black"],
                    ),

                widget.Countdown(
                    background=catppuccin["black"],
                    date=datetime.datetime(2023,5,26,17,0),
                    format='󰀠 {H}h {M}m'
                    ),

                add_white_space(catppuccin["black"]),

                widget.Systray(
                    background=catppuccin["black"],
                    ),

                add_white_space(catppuccin["black"]),

                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=CIRCLE_SIZE,
                    foreground=catppuccin["sky"],
                    background=catppuccin["black"],
                    ),

                widget.PulseVolume(
                    fmt=" {}",
                    foreground=catppuccin["black"],
                    background=catppuccin["sky"],
                    ),

                add_white_space(catppuccin["sky"]),
                
                widget.KeyboardLayout(
                        fmt="󰌌 {}",
                        foreground=catppuccin["black"],
                        background=catppuccin["sky"],
                        configured_keyboards=['us','us intl'],
                        display_map={'us':'us', 'us intl':'int'},
                        ),

                add_white_space(catppuccin["sky"]),

                widget.Wallpaper(directory="~/.config/qtile/wallpaper/",
                                 label=" ",
                                 foreground=catppuccin["black"],
                                 background=catppuccin["sky"],
                                 ),

                add_white_space(catppuccin["sky"]),

                widget.TextBox(
                        text="",
                        padding=0,
                        fontsize=CIRCLE_SIZE,
                        foreground=catppuccin["maroon"],
                        background=catppuccin["sky"],
                        ),

                add_white_space(catppuccin["maroon"]),

                widget.TextBox(
                        text=" ",
                        font="Font Awesome 6 Free Solid",
                        foreground=catppuccin["black"],
                        background=catppuccin["maroon"]),

                widget.Clock(format="%d %B   %H:%M",
                             foreground=catppuccin["black"],
                             background=catppuccin["maroon"]),

                add_white_space(catppuccin["maroon"]),

                widget.Wttr(
                        location={'Lorient': 'Lorient'},
                        background=catppuccin["maroon"],
                        foreground=catppuccin["black"],
                        format="%t%c",),

                add_white_space(catppuccin["maroon"]),
            ],

            # Bar height
            35,

            # background="catppuccin["maroon"]",
            # border_width=[5, 0, 5, 0],  # Draw top and bottom borders
            # border_color=[catppuccin["black"], "000000",catppuccin["black"], "000000"]  # Borders are magenta
        ),
        # wallpaper='~/.config/qtile/wallpaper/cat_desk1080.png',
        # wallpaper_mode='fill',
    ),
]



# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
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

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
