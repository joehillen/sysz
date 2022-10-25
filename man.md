## NAME

sysz - A fuzzy matching terminal UI for systemctl

## SYNOPSIS

sysz is a tool that makes working with systemd fast and easy. You can quickly
search, see the status of, and control systemd units with keybindings.

sysz supports:

- color units based on state
- multi-selection using the TAB key
- manage multiple resources at once
- automatic daemon-reload
- automatic sudo
- manage templates and template instances
- filtering units by:
  - unit type (service, timer)
  - status (active, stopped
  - manager (user, system)

## OPTIONS

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

## ENVIRONMENT VARIABLES

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

## COLORS

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

## Examples: Some examples of common usage

## Exit Values: The possible return codes and their meanings

## Author: The person or people who wrote the command

## Copyright: Your copyright message. These also usually include the type of license under which the program is released
