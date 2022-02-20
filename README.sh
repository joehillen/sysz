#!/usr/bin/env bash

set -e

CODE='```'

cat <<EOF >README.md
# [sysz](https://github.com/joehillen/sysz)

A [fzf](https://github.com/junegunn/fzf) terminal UI for systemctl.

<a href="https://console.dev" title="Visit Console - the best tools for developers"><img src="https://console.dev/img/badges/1.0/svg/console-badge-logo-dark.svg" alt="Console - Developer Tool of the Week" /></a>

## Demo

[![asciicast](https://asciinema.org/a/BLsJz73uF7DdQj7FVGqLPhqCa.svg)](https://asciinema.org/a/BLsJz73uF7DdQj7FVGqLPhqCa)

## Features

VERSION: $(cat VERSION)

- See and filter both system and user units simultaneously.
- Supports all unit types.
- Units ordered by service, timer, socket, and the rest.
- Runs \`sudo\` automatically and only if necessary.
- Filter units by state using \`ctrl-s\` or the \`--state\` option.
- Run \`daemon-reload\` with \`ctrl-r\`.
- Has short versions of systemctl commands to reduce typing.
- Runs status after other commands (start, stop, restart, etc).
- Select multiple units, states, and commands using \`TAB\`.
- Only prompts commands based on current state
  (e.g. show "start" only if the unit is inactive).

## Usage

${CODE}text
$(./sysz -h 2>&1 | sed -e "s:/home/[a-z]\+/.cache:\$XDG_CACHE_HOME:")
${CODE}

## Requirements

- [fzf](https://github.com/junegunn/fzf) >=
  [0.27.1](https://github.com/junegunn/fzf/blob/master/CHANGELOG.md#0244)
- bash > 4.3 (released 2009)

## Installation

### Arch Linux

With [paru](https://github.com/Morganamilo/paru):

${CODE}sh
paru -S sysz
${CODE}

Manually:

${CODE}sh
git clone https://aur.archlinux.org/sysz.git
cd sysz
makepkg -sri
${CODE}

### NixOS

${CODE}sh
nix-env -iA nixos.sysz
${CODE}

### Using Nix

${CODE}sh
nix-env -iA nixpkgs.sysz
${CODE}

### Using [\`bin\`](https://github.com/marcosnils/bin)

${CODE}sh
bin install https://github.com/joehillen/sysz
${CODE}

### From Source

${CODE}sh
git clone https://github.com/joehillen/sysz.git
cd sysz
sudo make install # /usr/local/bin/sysz
${CODE}

### Direct Download

${CODE}sh
wget -O ~/.bin/sysz https://github.com/joehillen/sysz/releases/latest/download/sysz
chmod +x ~/.bin/sysz
${CODE}

## Acknowledgements

Inspired by [fuzzy-sys](https://github.com/NullSense/fuzzy-sys) by
[NullSense](https://github.com/NullSense/)

Thank you for [ShellCheck](https://github.com/koalaman/shellcheck) without which
this would be a buggy mess.
EOF

#MANMD=/tmp/sysz-$(git describe --no-match --always --abbrev=8 --dirty).man.md
MANMD=man.md
#trap 'rm -f "$MANMD"' EXIT
cat <<EOF >"$MANMD"
## NAME

sysz - A fuzzy matching terminal UI for systemctl

## SYNOPSIS

$(./sysz -h usage)

## Description: A description of the command or function.
## Options: A list of command-line options, and what they do.

$(./sysz -h opts_man)

## Examples: Some examples of common usage.
## Exit Values: The possible return codes and their meanings.
## Bugs: A list of known bugs and quirks. Sometimes, this is supplemented with (or replaced by) a link to the issue tracker for the project.
## Author: The person or people who wrote the command.
## Copyright: Your copyright message. These also usually include the type of license under which the program is released.

EOF
