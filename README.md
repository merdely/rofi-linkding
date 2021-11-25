# rofi-linkding
Rofi Script for using Linkding Bookmarks

# Installation

1. Copy rofi-linkding to a directory like $HOME/bin
1. Copy .linkdingrc to $HOME
1. Modify $HOME/.linkdingrc with your URL & API Key
1. Install Rofi
1. Install jq
1. Use something like xbindkeys or sxhkd to configure a hot key combination

# xbindkeys example:
```
"rofi -show linkding -modi linkding:$HOME/bin/rofi-linkding"
  Shift + Alt + k
```
