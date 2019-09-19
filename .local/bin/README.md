Scrpits’ directory
==================

This is a directory in which I keep my custom scripts (Some of them are
not actually mine but taken from GitHub). I add this directory to the
`$PATH` with the command

    export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

located in my `.profile`

List of scripts
---------------

-   `backlight` – script for backlight brightness management
-   `bar` – script for restarting, launching and killing polybar status
    bars
-   `battery_check` – script for sending dunst notification of current
    battery state and capacity
-   `compiler` – mine-but-not-mine script. Compiler script for use with
    Vim that was **heaviliy** inspired by [Luke Smith’s compiler
    script](https://github.com/LukeSmithxyz/voidrice/blob/archi3/.local/bin/tools/compiler)
-   `cron_battery.sh` – script for sending dunst notification when
    battery is low. Intended to use with
    [cron](https://en.wikipedia.org/wiki/Cron)
-   `dunst_colors.sh` – small script for setting notification colours
    consistent with .Xresources. It is dependant on `theme` script
-   `dwmstatus` – my custom status bar for
    [dwm](2https://dwm.suckless.org/). Also inspired by [Luke
    Smith](https://github.com/lukesmithxyz)
-   `export_xrdb` – particularly clumsy script for exporting xrdb
    colours as environmental variables.
-   `fa-utf` – script utilizing dmenu for copying [Font
    Awesome](https://fontawesome.com/) icons into system clipboard.
-   `kbd-leds` – script for managing brightness of keyboard leds on
    MacBook Air
-   `mktex` – rough script for making a new texfile and opening it with
    `$EDITOR`
-   `nmenu` – script utilizing dmenu and NetworkManager for making
    selection of new wireless network connection not pain in the ass
-   `rcalc` – small script for launching `R`. Intended to use with i3,
    and `ddspawn`
-   `refbar` – a bit edited script for refreshing dwmstatus bar, stolen
    from [Luke
    Smith](https://github.com/LukeSmithxyz/voidrice/blob/archi3/.local/bin/tools/compiler)
-   `theme` – script for setting new wallpaper with xwallpaper and
    setting new colourscheme with xrdb

Blatantly stolen scripts
------------------------

-   [`ddspawn`](https://github.com/LukeSmithxyz/voidrice/blob/archi3/.local/bin/i3cmds/ddspawn)
-   [`i3resize`](https://github.com/LukeSmithxyz/voidrice/blob/archi3/.local/bin/i3cmds/i3resize)
