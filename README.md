# [sysz](https://github.com/joehillen/sysz)

A [fzf](https://github.com/junegunn/fzf) terminal UI for systemctl

# Demo

[![asciicast](https://asciinema.org/a/BLsJz73uF7DdQj7FVGqLPhqCa.svg)](https://asciinema.org/a/BLsJz73uF7DdQj7FVGqLPhqCa)

# Features

VERSION: 1.2.3

- See and filter both system and user units simultaneously
- Supports all units types
- Units ordered by service, timer, socket, and the rest
- Runs `sudo` automatically and only if necessary
- History (`Ctrl-p` and `Ctrl-n`)
- Support short versions of systemctl commands to reduce typing
- Runs status after other commands (start, stop, restart, etc)
- Select multiple units and commands using `TAB` key
- Only prompts commands based on current state
  (e.g. show "start" and "restart" only if the unit is inactive)
- Can filter units based on their state using the `--state` option

# Requirements

- [fzf](https://github.com/junegunn/fzf) >= [0.22.0](https://github.com/junegunn/fzf/blob/master/CHANGELOG.md#0220)
- bash > 4.3 (released 2009)
- awk

# Installation

## Arch Linux

```
paru -S sysz
```

## Using [`bin`](https://github.com/marcosnils/bin)

```
bin install https://github.com/joehillen/sysz
```

## Direct Download

```sh
wget -O ~/.bin/sysz https://github.com/joehillen/sysz/releases/latest/download/sysz
chmod +x ~/.bin/sysz
```

## From Source

```sh
git clone https://github.com/joehillen/sysz.git
cd sysz
sudo make install # /usr/local/bin/sysz
```

# Usage

```text
A utility for using systemctl interactively via fzf.

Usage: sysz [OPTS...] [CMD] [-- ARGS...]

Select multiple units and commands using TAB.

sudo is invoked automatically, if necessary.

If only one unit is chosen, available commands will be presented
based on the state of the unit (e.g. start is only shows if active).

Use CTRL-v to run `systemctl cat <unit>` in the preview window.

OPTS:
  -u, --user               Only show --user units
  --sys, --system          Only show --system units
  -s STATE, --state STATE  Only show units in STATE (repeatable)
  -V, --verbose            Print the systemctl command
  -v, --version            Print the version
  -h, --help               Print this message

  If no options are given, both system and user units are shown.

CMD:
  start                  systemctl start <unit>
  stop                   systemctl stop <unit>
  r, restart             systemctl restart <unit>
  s, stat, status        systemctl status <unit>
  ed, edit               systemctl edit <unit>
  reload                 systemctl reload <unit>
  en, enable             systemctl enable <unit>
  d, dis, disable        systemctl disable <unit>

  If no command is given, one or more can be chosen interactively.

ARGS are passed to the systemctl command for each selected unit.

History:
  sysz is stored in $XDG_CACHE_HOME/sysz/history
  This can be changed with the environment variable: SYSZ_HISTORY

  Use CTRL-p and CTRL-n to navigate through history.

Examples:
  sysz -u                      User units
  sysz -sys -s active          Active system units
  sysz --user --state failed   Failed user units

Examples with commands:
  sysz start                  Start a unit
  sysz --sys s                Get the status of system units
  sysz --user edit            Edit user units
  sysz s -- -n100             Show status with 100 log lines
  sysz -sys -s active stop    Stop an active system unit
  sysz -u --state failed r    Restart failed user units
```

# Acknowledgements

Inspired by [fuzzy-sys](https://github.com/NullSense/fuzzy-sys) by [NullSense](https://github.com/NullSense/)
