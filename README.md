# [sysz](https://github.com/joehillen/sysz)

An interactive fuzzy matching TUI for systemctl using [fzf](https://github.com/junegunn/fzf) written entirely in Bash.

# Features

- See and filter both system and user units simultaneously.
- Runs sudo automatically and only if necessary.
- Shows status after every command.
- Supports both services and timers.
- TODO Select multiple units using TAB key.
- TODO Only shows prompts commands based on running state (show "start" only if not running).

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
If no command is given, one can be chosen interactively.
If no option is give, both system and user units are shown.

Select multiple units using the TAB key.

Usage: sysz [OPT] [CMD] [args...]

OPT:
  -u, --user             Only show --user services
  -s, --sys, --system    Only show --user services
  -h, --help             Print this message

CMD:
  start                  systemctl start <unit>
  stop                   systemctl stop <unit>
  re, restart            systemctl restart <unit>
  s, stat, status        systemctl status <unit>
  ed, edit               systemctl edit --full <unit>
  en, enable             systemctl enable --now <unit>
  d, dis, disable        systemctl disable --now <unit>
  h, help                Print this message

Examples:
  sysz --system stat      Get the status of a system unit
  sysz --user --edit      Edit a user unit
  sysz start              Start a unit
  sysz -u s -n100         Show status of a user unit with 100 log lines
```

## Demo

TODO
[![asciicast](https://asciinema.org/a/390806.svg)](https://asciinema.org/a/390806)

# Acknowledgements

Based on [fuzzy-sys](https://github.com/NullSense/fuzzy-sys) by [NullSense](https://github.com/NullSense/)
