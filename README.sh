#!/bin/bash
CODE='```'

cat <<EOF >README.md
# [sysz](https://github.com/joehillen/sysz)

A [fzf](https://github.com/junegunn/fzf) terminal UI for systemctl

<a href="https://console.dev" title="Visit Console - the best tools for developers"><img src="https://console.dev/img/badges/1.0/svg/console-badge-logo-dark.svg" alt="Console - Developer Tool of the Week" /></a>

# Demo

[![asciicast](https://asciinema.org/a/BLsJz73uF7DdQj7FVGqLPhqCa.svg)](https://asciinema.org/a/BLsJz73uF7DdQj7FVGqLPhqCa)

# Features

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

# Requirements

- [fzf](https://github.com/junegunn/fzf) >= [0.27.1](https://github.com/junegunn/fzf/blob/master/CHANGELOG.md#0244)
- bash > 4.3 (released 2009)
- awk

# Installation

## Arch Linux

${CODE}
paru -S sysz
${CODE}

## NixOS

${CODE}
nix-env -iA nixos.sysz
${CODE}

## Using Nix

${CODE}
nix-env -iA nixpkgs.sysz
${CODE}

## Using [\`bin\`](https://github.com/marcosnils/bin)

${CODE}
bin install https://github.com/joehillen/sysz
${CODE}

## Direct Download

${CODE}sh
wget -O ~/.bin/sysz https://github.com/joehillen/sysz/releases/latest/download/sysz
chmod +x ~/.bin/sysz
${CODE}

## From Source

${CODE}sh
git clone https://github.com/joehillen/sysz.git
cd sysz
sudo make install # /usr/local/bin/sysz
${CODE}

# Usage

${CODE}text
$(./sysz -h 2>&1 | sed -e "s:/home/[a-z]\+/.cache:\$XDG_CACHE_HOME:")
${CODE}

# Acknowledgements

Inspired by [fuzzy-sys](https://github.com/NullSense/fuzzy-sys) by [NullSense](https://github.com/NullSense/)

Thank you for [ShellCheck](https://github.com/koalaman/shellcheck) without which this would be a buggy mess.
EOF
