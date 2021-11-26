# rofi-linkding
Rofi Script for using Linkding Bookmarks

# Prerequisites

* A Linkding site
* A Linkding REST API (Settings -> Integrations in Linkding)
* Install Rofi on system running rofi-linkding
     * On Arch: sudo pacman -S rofi
* Install jq on system running rofi-linkding
     * On Arch: sudo pacman -S jq

# User Installation

1. Download the latest release file (1.0 in this example)
1. Extract package: `tar -xvzf rofi-linkding-1.0.tar.gz`
1. Change to package directory: `cd rofi-linkding-1.0`
1. Modify 'config' with your URL & API Key
1. Run: `make install-user`
1. Use something like xbindkeys or sxhkd to configure a hot key combination

# System-wide Installation

For advanced users

1. Download and extract a release
1. Run: sudo make install-system
1. Create a config file in either /etc or $HOME/.config/rofi-linkding

# My xbindkeys example:
```
"rofi -show linkding -modi linkding:$HOME/bin/rofi-linkding"
  Shift + Alt + k
```
