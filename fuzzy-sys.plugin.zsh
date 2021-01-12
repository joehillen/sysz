#!/usr/bin/env bash

preview_service() {
    case $1 in
        --system|--user)
            awk '{print $1}' | fzf --multi --ansi --preview="SYSTEMD_COLORS=1 systemctl $1 -n 30 --user status --no-pager {}" ;;
        *) exit 1
    esac
}

promptmode() {
    case $(printf '%s\n' system user | fzf --reverse --prompt='Select the service type:') in
        system) printf '%s\n' --system ;;
        user) printf '%s\n' --user ;;
        *) exit 1
    esac
}

sudo() {
    case $mode in
        --system) command sudo "$@" ;;
        --user) "$@"
    esac
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

# sysstart - stop systemctl unit
sysstart() {
    mode=$(promptmode)

    systemctl "$mode" list-unit-files --no-legend --type=service \
        | preview_service "$mode" \
        | while read -r unit && [ "$unit" ]; do
            if sudo systemctl "$mode" start "$unit"; then
                systemctl "$mode" -n20 status "$unit"
            fi
        done
}

# sysstop - stop systemctl unit
sysstop() {
    mode=$(promptmode)

    systemctl "$mode" list-units --no-legend --type=service --state=running \
        | preview_service "$mode" \
        | while read -r unit && [ "$unit" ]; do
            if sudo systemctl "$mode" stop "$unit"; then
                systemctl "$mode" -n20 status "$unit"
            fi
        done
}

# sysstat - systemctl unit status
sysstat() {
    mode=$(promptmode)

    systemctl "$mode" list-unit-files --no-legend --type=service \
        | preview_service "$mode" \
        | while read -r unit && [ "$unit" ]; do
            systemctl "$mode" -n20 status "$unit"
        done
}

# sysedit - edit systemd unit
sysedit() {
  mode=$(promptmode)

  systemctl "$mode" list-unit-files --no-legend --type=service \
    | preview_service "$mode" \
    | while read -r unit && [ "$unit" ]; do
      sudo systemctl "$mode" edit --full "$unit"
    done
}

# sysenable - enable & start systemd unit
sysenable() {
    mode=$(promptmode)

    systemctl "$mode" list-unit-files --no-legend --type=service --state=disabled \
        | preview_service "$mode" \
        | while read -r unit && [ "$unit" ]; do
            if sudo systemctl "$mode" enable --now "$unit"; then
                systemctl "$mode" -n20 status "$unit"
            fi
        done
}

# sysdisable - disable & stop systemd unit
sysdisable() {
    mode=$(promptmode)

    systemctl "$mode" list-unit-files --no-legend --type=service --state=enabled \
        | preview_service "$mode" \
        | while read -r unit && [ "$unit" ]; do
            if sudo systemctl "$mode" disable --now "$unit"; then
                systemctl "$mode" -n20 status "$unit"
            fi
        done
}
