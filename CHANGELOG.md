# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.4.2] - 2021-10-11

### Fixed

- Ensure that fzf uses bash when calling preview by settings SHELL (#15)

## [1.4.1] - 2021-10-08

### Fixed

- Ensure that fzf uses bash when calling preview

## [1.4.0] - 2021-09-21

### Added

- Major Refactor
- Better ctrl-s and ctrl-r handling
- Better handling of fzf exit codes
- Wider preview window on command prompt

### Fixed

- Remove duplicates

### Removed

- `--reverse`. User can set this using `FZF_DEFAULT_OPTS`.

## [1.3.1] - 2021-09-21

### Fixed

- Require fzf >= 0.27.1
- Unbind ctrl-v in state and daemon-reload prompts

## [1.3.0] - 2021-09-20

### Added

- `cat` command
- `mask` command
- `unmask` command
- color results based on state
- `ctrl-s` to filter states
- `ctrl-r` to run daemon-reload
- `?` to show keybindings

### Fixed

- Do not run `status` after `show`

## [1.2.3] - 2021-09-20

### Fixed

- use `#!/usr/bin/env bash`
- `-s` option is for state

### Added

- `--state=` support

## [1.2.2] - 2021-09-17

### Fixed

- root check

## [1.2.1] - 2021-09-17

### Fixed

- Bug in "follow" action

## [1.2.0] - 2021-09-17

### Added

- Version flag `-v`
- "show" action

### Changed

- Verbose flag to `-V`

### Fixed

- "follow" action
- root user doesn't have a --user instance

## [1.1.0] - 2021-09-02

### Added

- Keybinding `CTRL-v` to cat the current unit in preview window
- Support parametrized units: `unit@.service`

### Changed

- Remove `cat` command
- Show `cat` in preview for parametrized units: `unit@.service`

### Fixed

- Show `start` command if unit is "failed"
- Show `enable` command is unit is "static"
