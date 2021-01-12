#!/usr/bin/env bash

preview_service() {
    case $1 in
        --system|--user)
            awk '{print $1}' | fzf --multi --ansi --preview="SYSTEMD_COLORS=1 systemctl $1 -n 30 --user status --no-pager {}" ;;
        *) exit 1
    esac
}

promptmode() {
    case $(fzf --reverse --prompt='Select the service type:' <<< $'system\nuser\n') in
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
    printf '\033[0;32m%s\033[0m\n' start
    printf '\033[0;31m%s\033[0m\n' stop
    printf '\033[0;37m%s\033[0m\n' status
    printf '\033[0;37m%s\033[0m\n' edit
    printf '\033[0;32m%s\033[0m\n' enable
    printf '\033[0;31m%s\033[0m\n' disable
    ))

    case $mode in
        start) sysstart ;;
        stop) sysstop ;;
        status) sysstat ;;
        edit) sysedit ;;
        enable) sysenable ;;
        disable) sysdisable
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
