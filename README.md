# rofi-linkding
Rofi Script for using Linkding Bookmarks

# User Installation

1. Download the latest release file
1. Extract package: `tar -xvzf rofi-linkding-1.0.tar.gz`
1. Change to package directory: `cd rofi-linkding-1.0`
1. Modify 'config' with your URL & API Key
1. Run: `make install-user`
1. Install Rofi
1. Install jq
1. Use something like xbindkeys or sxhkd to configure a hot key combination

# My xbindkeys example:
```
"rofi -show linkding -modi linkding:$HOME/bin/rofi-linkding"
  Shift + Alt + k
```
