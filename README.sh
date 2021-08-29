BLOCK='```'
TICK='`'


DOC=$(cat <<EOF
# [sysz](https://github.com/joehillen/sysz)

VERSON: ${TICK}1.0.0${TICK}

An interactive fuzzy matching TUI for systemctl using [fzf](https://github.com/junegunn/fzf) written entirely in Bash.

# Features

- See and filter both system and user units simultaneously
- Runs ${TICK}sudo${TICK} automatically and only if necessary
- History (${TICK}Ctrl-p${TICK} and ${TICK}Ctrl-n${TICK})
- Shows status after commands
- Supports all units types
- Units ordered by service, timer, socket, and the rest
- Select multiple units using ${TICK}TAB${TICK} key
- Select multiple commands using the ${TICK}TAB${TICK} key
- Only shows prompts commands based on current state (show "start" only if not running, etc)

# Usage

${BLOCK}text
$(./sysz -h 2>&1)
${BLOCK}

# Requirements

- [fzf](https://github.com/junegunn/fzf)
- bash > 4.3 (released 2009)
- awk

# Installation

## Arch Linux

TODO

## Direct Download

${BLOCK}sh
wget -O ~/.bin/sysz https://raw.githubusercontent.com/joehillen/sysz/master/sysz
chmod +x ~/.bin/sysz
${BLOCK}

## From Source

${BLOCK}sh
git clone https://github.com/joehillen/sysz.git
cd sysz
sudo make install
${BLOCK}

# Demo

TODO
[![asciicast](https://asciinema.org/a/390806.svg)](https://asciinema.org/a/390806)

# Acknowledgements

Inspired by [fuzzy-sys](https://github.com/NullSense/fuzzy-sys) by [NullSense](https://github.com/NullSense/)
EOF
)

printf "$DOC" > README.md
