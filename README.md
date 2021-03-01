# [sysz](https://github.com/joehillen/sysz)

An interactive fuzzy matching TUI for systemctl using [fzf](https://github.com/junegunn/fzf) written entirely in Bash.

# Features

- See and filter both system and user units simultaneously.
- Runs sudo automatically and only if necessary.
- Shows status after every command.
- Supports both services and timers.
- Select multiple units using TAB key.
- Only shows prompts commands based on current state (show "start" only if not running).

# Requirements

- [fzf](https://github.com/junegunn/fzf)
- bash > 4.3 (released 2009)

# Installation

## Arch Linux

TODO

## Direct Download

```
wget -O ~/.bin/sysz https://raw.githubusercontent.com/joehillen/sysz/master/sysz
chmod +x ~/.bin/sysz
```

## From Source

```
git clone https://github.com/joehillen/sysz.git
cd sysz
sudo make install
```

# Usage

All commands support multi selection via Tab.

```text
A utility for using systemctl interactively via fzf.

Usage: sysz [OPT] [CMD] [ARGS...]

Select multiple units using TAB

Extra ARGS are passed to the systemctl command.

OPT:
  -u, --user             Only show --user services
  -s, --sys, --system    Only show --user services
  -h, --help             Print this message

If no option is given, both system and user units are shown.

CMD:
  start                  systemctl start <unit>
  stop                   systemctl stop <unit>
  re, restart            systemctl restart <unit>
  s, stat, status        systemctl status <unit>
  ed, edit               systemctl edit --full <unit>
  reload                 systemctl reload <unit>
  en, enable             systemctl enable --now <unit>
  d, dis, disable        systemctl disable --now <unit>
  h, help                Print this message

If no command is given, one can be chosen interactively based on state.

Examples:
  sysz --system stat      Get the status of a system unit
  sysz --user --edit      Edit a user unit
  sysz start              Start a unit
  sysz -u s -n100         Show status of a user unit with 100 log lines.
```

## Demo

TODO
[![asciicast](https://asciinema.org/a/390806.svg)](https://asciinema.org/a/390806)

# Acknowledgements

Based on [fuzzy-sys](https://github.com/NullSense/fuzzy-sys) by [NullSense](https://github.com/NullSense/)
