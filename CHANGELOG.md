# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
