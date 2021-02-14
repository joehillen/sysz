<h1 align="center">:vertical_traffic_light: fuzzy-sys</h1>
<p align="center">
    <em>Utility for using systemctl interactively via <a href="https://github.com/junegunn/fzf">junegunn/fzf</a>.</em>
</p>

## :package: Installation

**Make sure you have [fzf](https://github.com/junegunn/fzf) installed**

```zsh
# for zplug
zplug 'NullSense/fuzzy-sys'

# for zgen
zgen load 'NullSense/fuzzy-sys'

# for antigen
antigen bundle 'NullSense/fuzzy-sys'

# manually
# Clone the repository and source it in your shell's rc file.
```

## Try it out without installing anything

If you want to try `fuzzy-sys` without installing it:

```bash
# bash / zsh
source <(curl -sSL git.io/JteMq)
```

## :star: Features

All commands support multi selection via Tab.

```bash
Usage: fuzzy-sys [options]
Utility for using systemctl interactively via fzf.
If no options are given fully interactive mode is launched with system service units being used.
    -u          : work with --user services
    --start     : systemctl start <unit>
    --stop      : systemctl stop <unit>
    --restart   : systemctl restart <unit>
    --status    : systemctl status <unit>
    --edit      : systemctl edit --full <unit>
    --enable    : systemctl enable --now <unit>
    --disable   : systemctl disable --now <unit>
    --help      : print this message and exit

Examples:
    fuzzy-sys -u --edit    : edit a user service
    fuzzy-sys --start      : start a system service
```

## Demo

[![asciicast](https://asciinema.org/a/390806.svg)](https://asciinema.org/a/390806)
