# [sysz](https://github.com/joehillen/sysz)

VERSON: `1.0.0`

An interactive fuzzy matching TUI for systemctl using [fzf](https://github.com/junegunn/fzf) written entirely in Bash.

# Features

- See and filter both system and user units simultaneously
- Runs `sudo` automatically and only if necessary
- History (`Ctrl-p` and `Ctrl-n`)
- Shows status after commands
- Supports all units types
- Units ordered by service, timer, socket, and the rest
- Select multiple units using `TAB` key
- Select multiple commands using the `TAB` key
- Only shows prompts commands based on current state (show "start" only if not running, etc)

# Usage

```text
A utility for using systemctl interactively via fzf.

Usage: sysz [OPTS...] [CMD] [-- ARGS...]

Select multiple units using TAB

Extra ARGS are passed to the systemctl command
for each selected unit.

sudo is automatically invoked if necessary.

OPTS:
  -u, --user             Only show --user units
  -s, --sys, --system    Only show --user units
  --state [STATE]        Only show units in STATE
  -v, --verbose          Print the systemctl command
  -h, --help             Print this message

If no option is given, both system and user units are shown.

CMD:
  start                  systemctl start <unit>
  stop                   systemctl stop <unit>
  r, restart             systemctl restart <unit>
  s, stat, status        systemctl status <unit>
  ed, edit               systemctl edit --full <unit>
  reload                 systemctl reload <unit>
  en, enable             systemctl enable --now <unit>
  d, dis, disable        systemctl disable --now <unit>

If no command is given, one or more can be chosen interactively.

If only one unit is chosen, available commands will be presented
based on the state of the unit.

sysz stores history in the file specificed by the
environment variable SYSZ_HISTORY
Default: /home/joe/.cache/sysz/history

Examples:
  sysz -u                      User units
  sysz -s --state active       Active system units
  sysz --user --state failed   Failed user units

Examples with commands:
  sysz start                     Start a unit
  sysz --sys s                   Get the status of a system unit
  sysz --user edit               Edit a user unit
  sysz s -n100                   Show 100 log lines of units
  sysz -s --state active stop    Stop an active system unit
  sysz --state failed r          Restart failed units
```

# Requirements

- [fzf](https://github.com/junegunn/fzf)
- bash > 4.3 (released 2009)
- awk

# Installation

## Arch Linux

TODO

## Direct Download

```sh
wget -O ~/.bin/sysz https://raw.githubusercontent.com/joehillen/sysz/master/sysz
chmod +x ~/.bin/sysz
```

## From Source

```sh
git clone https://github.com/joehillen/sysz.git
cd sysz
sudo make install
```

# Demo

TODO
[![asciicast](https://asciinema.org/a/390806.svg)](https://asciinema.org/a/390806)

# Acknowledgements

Inspired by [fuzzy-sys](https://github.com/NullSense/fuzzy-sys) by [NullSense](https://github.com/NullSense/)