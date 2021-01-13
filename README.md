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

If you want to try `fuzzy-sys` without installing it:

```bash
# bash / zsh
source <(curl -sSL git.io/JteMq)
```

## :star: Features

All commands support multi selection via Tab.

```bash
- fsysctl (fully interactive)
# All can be interactively used with `--user` services
- sysstat (systemtl status $unit)
- sysstart (systemtl start $unit)
- sysstop (systemtl stop $unit)
- sysedit (systemtl edit $unit)
- sysenable (systemtl enable $unit)
- sysdisable (systemtl disable $unit)
```

### :control_knobs: `systemctl` control center (`fsysctl`)

[![asciicast](https://asciinema.org/a/CCIPOAEajb1PM360lvZxX3MOZ.svg)](https://asciinema.org/a/CCIPOAEajb1PM360lvZxX3MOZ)

### :bar_chart: `systemctl status` (`sysstat`)

[![asciicast](https://asciinema.org/a/cbdDMDGCHMD2c1rClJEM7Qk2W.svg)](https://asciinema.org/a/cbdDMDGCHMD2c1rClJEM7Qk2W)

### :arrow_forward: `systemctl start` (`sysstart`)

[![asciicast](https://asciinema.org/a/P3TteInPNT3z8MHXgiXDCJYDD.svg)](https://asciinema.org/a/P3TteInPNT3z8MHXgiXDCJYDD)

### :stop_button: `systemctl stop` (`sysstop`)

[![asciicast](https://asciinema.org/a/AND4bOS7OjO26scbNLPMmAd3g.svg)](https://asciinema.org/a/AND4bOS7OjO26scbNLPMmAd3g)

### :memo: `systemctl edit --full` (`sysedit`)

[![asciicast](https://asciinema.org/a/2uqHRF9rJu2lTz3CvdwBSuPrD.svg)](https://asciinema.org/a/2uqHRF9rJu2lTz3CvdwBSuPrD)

### :white_check_mark: `systemctl enable` (`sysenable`)

[![asciicast](https://asciinema.org/a/tmRL0c9W8xbJmFMuXfbrk95s6.svg)](https://asciinema.org/a/tmRL0c9W8xbJmFMuXfbrk95s6)

### :x: `systemctl disable` (`sysdisable`)

[![asciicast](https://asciinema.org/a/VCtem6GjJbUKVlrYfCKobdSjU.svg)](https://asciinema.org/a/VCtem6GjJbUKVlrYfCKobdSjU)
