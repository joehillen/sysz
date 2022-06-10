#!/usr/bin/env bash

set -e

# shellcheck source=./sysz
source ./sysz

#TMP=$(mktemp sysz-man-XXXXXX.md)

### The man page writer extracts a title, man page section number, and other header and footer information from the title line. The title is assumed to be the first word on the title line, which may optionally end with a (single-digit) section number in parentheses. (There should be no space between the title and the parentheses.) Anything after this is assumed to be additional footer and header text. A single pipe character (|) should be used to separate the footer text from the header text. Thus,
### 
### % PANDOC(1)
### 
### will yield a man page with the title PANDOC and section 1.
### 
### % PANDOC(1) Pandoc User Manuals
### 
### will also have “Pandoc User Manuals” in the footer.
### 
### % PANDOC(1) Pandoc User Manuals | Version 4.0
### 
### will also have “Version 4.0” in the header.

cat <<EOF
% SYSZ(1) $_sysz_title

## NAME

$_sysz_title

## SYNOPSIS

$_sysz_usage

## DESCRIPTION

sysz is a interactive terminal user-interface for systemd's systemctl.
It is designed to be quick, one-stop shop for most common systemctl use cases.
The interface functionality is provided by fzf which allows for fuzzy
matching/filtering of systemd units.

System and User units can be viewed, managed, and filtered simul or separately.
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


## OPTIONS

$(./sysz -h opts_man)

## ENVIRONMENT VARIABLES

$(./sysz -h envvars_man)

## KEYBINDINGS

## COLORS

$(./sysz -h colors)

## EXAMPLES

## BUGS
## AUTHOR
## COPYRIGHT

## SEE ALSO

fzf(1)

EOF
