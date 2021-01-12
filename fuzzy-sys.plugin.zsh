#!/usr/bin/env bash

get_service_type() {
  service_type=$(fzf --reverse --prompt="Select the service type:" < <(
  echo system
  echo user
  ))
}

fsysctl() {
  mode=$(fzf --reverse --ansi --prompt="Select systemctl mode:" "$@" < <(
  echo "$(tput setaf 2)start"
  echo "$(tput setaf 1)stop"
  echo "$(tput sgr 0)status"
  echo "$(tput sgr 0)edit"
  echo "$(tput setaf 2)enable"
  echo "$(tput setaf 1)disable"
  ))

  case "$mode" in
    default)
      ;;
    "start")
      sysstart
      ;;
    "stop")
      sysstop
      ;;
    "status")
      sysstat
      ;;
    "edit")
      sysedit
      ;;
    "enable")
      sysenable
      ;;
    "disable")
      sysdisable
      ;;
  esac
}

# sysedit - edit systemd unit
sysedit() {
  get_service_type
  if [[ "$service_type" = "system" ]]; then
    unit=$(systemctl list-unit-files --no-legend --type=service | preview_service)
    [ -n "$unit" ] && sudo systemctl edit --full "$unit"
  else
    unit=$(systemctl list-unit-files --no-legend --user --type=service | preview_service)
    [ -n "$unit" ] && systemctl --user edit --full "$unit"
  fi
}

# sysenable - enable and start systemd unit
sysenable() {
  get_service_type
  if [[ "$service_type" = "system" ]]; then
    unit=$(systemctl list-unit-files --no-legend --type=service --state=disabled | preview_service)
    [ -n "$unit" ] && sudo systemctl enable --now "$unit" && sudo systemctl -n 20 status "$unit"
  else
    unit=$(systemctl list-unit-files --no-legend --user --type=service --state=disabled | preview_service)
    [ -n "$unit" ] && systemctl --user enable --now "$unit" && systemctl -n 20 --user status "$unit"
  fi
}

# sysdisable - disable and stop systemd unit
sysdisable() {
  get_service_type
  if [[ "$service_type" = "system" ]]; then
    unit=$(systemctl list-unit-files --no-legend --type=service --state=enabled | preview_service)
    [ -n "$unit" ] && sudo systemctl disable --now "$unit" && sudo systemctl -n 20 status "$unit"
  else
    unit=$(systemctl list-unit-files --no-legend --user --type=service --state=enabled | preview_service)
    [ -n "$unit" ] && systemctl --user disable --now "$unit" && systemctl -n 20 --user status "$unit"
  fi
}

# sysstart - start systemd unit
sysstart() {
  get_service_type
  if [[ "$service_type" = "system" ]]; then
    unit=$(systemctl list-unit-files --no-legend --type=service | preview_service)
    [ -n "$unit" ] && sudo systemctl start "$unit" && sudo systemctl -n 20 status "$unit"
  else
    unit=$(systemctl list-unit-files --no-legend --user --type=service | preview_service)
    [ -n "$unit" ] && systemctl --user start "$unit" && systemctl -n 20 --user status "$unit"
  fi
}

# sysstop - stop systemd unit
sysstop() {
  get_service_type
  if [[ "$service_type" = "system" ]]; then
    unit=$(systemctl list-units --no-legend --type=service --state=running | preview_service)
    [ -n "$unit" ] && sudo systemctl stop "$unit" && sudo systemctl -n 20 status "$unit"
  else
    unit=$(systemctl list-units --no-legend --user --type=service --state=running | preview_service)
    [ -n "$unit" ] && systemctl --user stop "$unit" && systemctl -n 20 --user status "$unit"
  fi
}

# sysstat - show systemd unit status
sysstat() {
  get_service_type
  if [[ "$service_type" = "system" ]]; then
    unit=$(systemctl list-unit-files --no-legend --type=service | preview_service)
    [ -n "$unit" ] && systemctl -n 20 status "$unit"
  else
    unit=$(systemctl list-unit-files --no-legend --user --type=service | preview_service)
    [ -n "$unit" ] && systemctl -n 20 --user status "$unit"
  fi
}

preview_service() {
  if [[ "$service_type" = "system" ]]; then
    awk '{print $1}' | fzf --multi --ansi --preview="SYSTEMD_COLORS=1 systemctl -n 30 status --no-pager {}"
  else
    awk '{print $1}' | fzf --multi --ansi --preview="SYSTEMD_COLORS=1 systemctl -n 30 --user status --no-pager {}"
  fi
}
