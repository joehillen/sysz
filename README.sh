#!/bin/bash
BLOCK='```'

cat <<EOF >README.md
# [sysz](https://github.com/joehillen/sysz)

A [fzf](https://github.com/junegunn/fzf) terminal UI for systemctl

# Demo

[![asciicast](https://asciinema.org/a/BLsJz73uF7DdQj7FVGqLPhqCa.svg)](https://asciinema.org/a/BLsJz73uF7DdQj7FVGqLPhqCa)

# Features

VERSION: $(cat VERSION)

- See and filter both system and user units simultaneously
- Supports all units types
- Units ordered by service, timer, socket, and the rest
- Runs \`sudo\` automatically and only if necessary
- History (\`Ctrl-p\` and \`Ctrl-n\`)
- Support short versions of systemctl commands to reduce typing
- Runs status after other commands (start, stop, restart, etc)
- Select multiple units and commands using \`TAB\` key
- Only prompts commands based on current state
  (e.g. show "start" and "restart" only if the unit is inactive)
- Can filter units based on their state using the \`--state\` option

# Requirements

- [fzf](https://github.com/junegunn/fzf) >= [0.22.0](https://github.com/junegunn/fzf/blob/master/CHANGELOG.md#0220)
- bash > 4.3 (released 2009)
- awk

# Installation

## Arch Linux

${BLOCK}
paru -S sysz
${BLOCK}

## Direct Download

${BLOCK}sh
wget -O ~/.bin/sysz https://raw.githubusercontent.com/joehillen/sysz/master/sysz
chmod +x ~/.bin/sysz
${BLOCK}

## From Source

${BLOCK}sh
git clone https://github.com/joehillen/sysz.git
cd sysz
sudo make install # /usr/local/bin/sysz
${BLOCK}

# Usage

${BLOCK}text
$(./sysz -h 2>&1 | sed -e 's:/home/[a-z]\+/.cache:$XDG_CACHE_HOME:')
${BLOCK}

# Acknowledgements

Inspired by [fuzzy-sys](https://github.com/NullSense/fuzzy-sys) by [NullSense](https://github.com/NullSense/)
EOF
