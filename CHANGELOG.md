# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
