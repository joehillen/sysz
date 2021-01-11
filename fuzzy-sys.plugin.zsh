#!/usr/bin/env bash

get_service_type() {
  service_type=$(fzf --multi --reverse --prompt="Select the service type:" < <(
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
    unit=$(systemctl list-unit-files --type=service | preview_service)
    [ -n "$unit" ] && sudo systemctl edit --full "$unit"
  else
    unit=$(systemctl list-unit-files --user --type=service | preview_service)
    [ -n "$unit" ] && systemctl --user edit --full "$unit"
  fi

  [ -n "$unit" ] && journalctl -u "$unit" --since "10 sec ago" --no-pager
}

# sysenable - enable and start systemd unit
sysenable() {
  get_service_type
  if [[ "$service_type" = "system" ]]; then
    unit=$(systemctl list-unit-files --type=service --state=disabled | preview_service)
    [ -n "$unit" ] && sudo systemctl enable --now "$unit"
  else
    unit=$(systemctl list-unit-files --user --type=service --state=disabled | preview_service)
    [ -n "$unit" ] && systemctl --user enable --now "$unit"
  fi

  [ -n "$unit" ] && journalctl -u "$unit" --since "10 sec ago" --no-pager
}

# sysedit - edit systemd unit
sysedit() {
  get_service_type
  if [[ "$service_type" = "system" ]]; then
    unit=$(systemctl list-unit-files --type=service | preview_service)
    [ -n "$unit" ] && sudo systemctl edit --full "$unit"
  else
    unit=$(systemctl list-unit-files --user --type=service | preview_service)
    [ -n "$unit" ] && systemctl --user edit --full "$unit"
  fi

  [ -n "$unit" ] && journalctl -u "$unit" --since "10 sec ago" --no-pager
}

# sysenable - enable and start systemd unit
sysenable() {
  get_service_type
  if [[ "$service_type" = "system" ]]; then
    unit=$(systemctl list-unit-files --type=service --state=disabled | preview_service)
    [ -n "$unit" ] && sudo systemctl enable --now "$unit"
  else
    unit=$(systemctl list-unit-files --user --type=service --state=disabled | preview_service)
    [ -n "$unit" ] && systemctl --user enable --now "$unit"
  fi

  [ -n "$unit" ] && journalctl -u "$unit" --since "10 sec ago" --no-pager
}

# sysdisable - disable and stop systemd unit
sysdisable() {
  get_service_type
  if [[ "$service_type" = "system" ]]; then
    unit=$(systemctl list-unit-files --type=service --state=enabled | preview_service)
    [ -n "$unit" ] && sudo systemctl disable --now "$unit"
  else
    unit=$(systemctl list-unit-files --user --type=service --state=enabled | preview_service)
    [ -n "$unit" ] && systemctl --user disable --now "$unit"
  fi

  [ -n "$unit" ] && journalctl -u "$unit" --since "10 sec ago" --no-pager
}

# sysstart - start systemd unit
sysstart() {
  get_service_type
  if [[ "$service_type" = "system" ]]; then
    unit=$(systemctl list-unit-files --type=service | preview_service)
    [ -n "$unit" ] && sudo systemctl start "$unit"
  else
    unit=$(systemctl list-unit-files --user --type=service | preview_service)
    [ -n "$unit" ] && systemctl --user start "$unit"
  fi

  [ -n "$unit" ] && journalctl -u "$unit" --since "10 sec ago" --no-pager
}

# sysstop - stop systemd unit
sysstop() {
  get_service_type
  if [[ "$service_type" = "system" ]]; then
    unit=$(systemctl list-units --type=service --state=running | preview_service)
    [ -n "$unit" ] && sudo systemctl stop "$unit"
  else
    unit=$(systemctl list-units --user --type=service --state=running | preview_service)
    [ -n "$unit" ] && systemctl --user stop "$unit"
  fi

  [ -n "$unit" ] && journalctl -u "$unit" --since "10 sec ago" --no-pager
}

# sysstat - show systemd unit status
sysstat() {
  get_service_type
  if [[ "$service_type" = "system" ]]; then
    unit=$(systemctl list-unit-files --type=service | preview_service)
    sudo systemctl status "$unit"
  else
    unit=$(systemctl list-unit-files --user --type=service | preview_service)
    systemctl --user status "$unit"
  fi

  [ -n "$unit" ] && journalctl -u "$unit" --since "10 sec ago" --no-pager
}

preview_service() {
  if [[ "$service_type" = "system" ]]; then
    awk '{print $1}' | grep service | fzf --ansi --preview="SYSTEMD_COLORS=1 systemctl status --no-pager {}"
  else
    awk '{print $1}' | grep service | fzf --ansi --preview="SYSTEMD_COLORS=1 systemctl --user status --no-pager {}"
  fi
}
