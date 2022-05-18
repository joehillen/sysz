# [sysz](https://github.com/joehillen/sysz)

A [fzf](https://github.com/junegunn/fzf) terminal UI for systemctl.

<a href="https://console.dev" title="Visit Console - the best tools for developers"><img src="https://console.dev/img/badges/1.0/svg/console-badge-logo-dark.svg" alt="Console - Developer Tool of the Week" /></a>

## Demo

[![asciicast](https://asciinema.org/a/BLsJz73uF7DdQj7FVGqLPhqCa.svg)](https://asciinema.org/a/BLsJz73uF7DdQj7FVGqLPhqCa)

## Features

VERSION: 1.4.3

- See and filter both system and user units simultaneously.
- Supports all unit types.
- Units ordered by service, timer, socket, and the rest.
- Runs `sudo` automatically and only if necessary.
- Filter units by state using `ctrl-s` or the `--state` option.
- Run `daemon-reload` with `ctrl-r`.
- Has short versions of systemctl commands to reduce typing.
- Runs status after other commands (start, stop, restart, etc).
- Select multiple units, states, and commands using `TAB`.
- Only prompts commands based on current state
  (e.g. show "start" only if the unit is inactive).

## Usage

```text
sysz - interactive terminal UI for systemctl

sysz [OPTS...] [CMD] [-- ARGS...]

sudo is invoked automatically, if necessary.

If only one unit is chosen, available commands will be presented
based on the state of the unit (e.g. "start" only shows if unit is "active").

OPTS:
  -u, --user                  Only show --user units [default].
  --sys, --system             Only show --system units [default].
  -s STATE, --state STATE     Only show units in STATE (repeatable).
  -t TYPE, --type TYPE        Only show units of TYPE (repeatable).
  --no-color                  Disable colors.
  -V, --verbose               Print the systemctl command.
  -v, --version               Print the version.
  -h, --help                  Print this message.

ARGS are passed to the systemctl command for each selected unit.

Keybindings:
  TAB            Toggle selection.
  ctrl-r         Run daemon-reload. Selection is reset.
  ctrl-x         Switch between user and system managers. Selection is reset.
  ctrl-s         Filter by states. Selection is reset.
  ctrl-t         Filter by types. Selection is reset.
  ctrl-v         'cat' the selected units in the preview window.
  ctrl-p         History previous.
  ctrl-n         History next.
  left|right     Toggle word-wrapping in the preview window.
                 Note: fzf does not support horizontal scrolling.
  shift-up       Scroll up in the preview window.
  shift-down     Scroll down in the preview window.
  ?              Show keybindings.

Environment Variables:
  SYSZ_HISTORY     Command history file [default: /home/joe/.cache/sysz/history].
  SYSZ_COLOR       Turn colors on or off [default: on].

Units are colored based on their state:
  green       active
  red         failed
  yellow      not-found
  template    blue
  other       cyan

Examples:
  sysz -u                             User units.
  sysz --sys -s active                Active system units.
  sysz --user --state failed          Failed user units.
  sysz --type socket                  Sockets.
  sysz --state=inactive -t service    Inactive services.
```

## Requirements

- [fzf](https://github.com/junegunn/fzf) >=
  [0.27.1](https://github.com/junegunn/fzf/blob/master/CHANGELOG.md#0244)
- bash > 4.3 (released 2009)

## Installation

### Arch Linux

With [paru](https://github.com/Morganamilo/paru):

```sh
paru -S sysz
```

Manually:

```sh
git clone https://aur.archlinux.org/sysz.git
cd sysz
makepkg -sri
```

### NixOS

```sh
nix-env -iA nixos.sysz
```

### Using Nix

```sh
nix-env -iA nixpkgs.sysz
```

### Using [`bin`](https://github.com/marcosnils/bin)

```sh
bin install https://github.com/joehillen/sysz
```

### From Source

```sh
git clone https://github.com/joehillen/sysz.git
cd sysz
sudo make install # /usr/local/bin/sysz
```

### Direct Download

```sh
wget -O ~/.bin/sysz https://github.com/joehillen/sysz/releases/latest/download/sysz
chmod +x ~/.bin/sysz
```

## Acknowledgements

Inspired by [fuzzy-sys](https://github.com/NullSense/fuzzy-sys) by
[NullSense](https://github.com/NullSense/)

Thank you for [ShellCheck](https://github.com/koalaman/shellcheck) without which
this would be a buggy mess.
