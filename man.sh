#!/usr/bin/env bash

set -e

# shellcheck source=./sysz
source ./sysz

#TMP=$(mktemp sysz-man-XXXXXX.md)

# The man page writer extracts a title, man page section number, and other header and footer information from the title line. The title is assumed to be the first word on the title line, which may optionally end with a (single-digit) section number in parentheses. (There should be no space between the title and the parentheses.) Anything after this is assumed to be additional footer and header text. A single pipe character (|) should be used to separate the footer text from the header text. Thus,
# 
# % PANDOC(1)
# 
# will yield a man page with the title PANDOC and section 1.
# 
# % PANDOC(1) Pandoc User Manuals
# 
# will also have “Pandoc User Manuals” in the footer.
# 
# % PANDOC(1) Pandoc User Manuals | Version 4.0
# 
# will also have “Version 4.0” in the header.

cat <<EOF
## NAME

$_sysz_title

## SYNOPSIS

$_sysz_usage

## DESCRIPTION

sysz is a interactive terminal user-interface for systemd's systemctl.
sysz is designed to be 
The interface functionality is provided by fzf which allows for fuzzy
matching/filtering of systemd units.


## OPTIONS

$(./sysz -h opts_man)

## ENVIRONMENT VARIABLES

$(./sysz -h envvars_man)

## KEYBINDINGS

## COLORS

$(./sysz -h colors)

## Examples: Some examples of common usage.
## Exit Values: The possible return codes and their meanings.
## Bugs: A list of known bugs and quirks. Sometimes, this is supplemented with (or replaced by) a link to the issue tracker for the project.
## Author: The person or people who wrote the command.
## Copyright: Your copyright message. These also usually include the type of license under which the program is released.

## SEE ALSO

fzf(1)

EOF
