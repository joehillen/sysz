#!/bin/bash
BLOCK='```'

cat <<EOF >README.md
# [sysz](https://github.com/joehillen/sysz)

A [fzf](https://github.com/junegunn/fzf) terminal UI for systemctl

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

${BLOCK}
paru -S sysz
${BLOCK}

## Using [\`bin\`](https://github.com/marcosnils/bin)

${BLOCK}
bin install https://github.com/joehillen/sysz
${BLOCK}

## Direct Download

${BLOCK}sh
mkdir -p ~/.bin/ && wget -O ~/.bin/sysz https://github.com/joehillen/sysz/releases/latest/download/sysz
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

Thank you for [ShellCheck](https://github.com/koalaman/shellcheck) without which this would be a buggy mess.
EOF
