fuzzy-sys() {
help() {
    cat >&2 <<EOF
Usage: fuzzy-sys [options]
Utility for using systemctl interactively via fzf.
If no options are given fully interactive mode is launched with system service units being used.
    -u          : work with --user services
    --start     : systemctl start <unit>
    --stop      : systemctl stop <unit>
    --status    : systemctl status <unit>
    --edit      : systemctl edit --full <unit>
    --enable    : systemctl enable --now <unit>
    --disable   : systemctl disable --now <unit>
    --help      : print this message and exit

Examples:
    fuzzy-sys -u --edit    : edit a user service
    fuzzy-sys --start      : start a system service
EOF
}


preview_service() {
    case $1 in
        --system|--user)
            awk '{print $1}' | fzf --multi --ansi --preview="SYSTEMD_COLORS=1 systemctl $1 -n 30 --user status --no-pager {}" ;;
        *) exit 1
    esac
}

promptmode() {
    case $super in
        system) printf '%s\n' --system ;;
        user) printf '%s\n' --user ;;
        *)
            case $(fzf --reverse --prompt='Select the service type:' <<< $'system\nuser') in
                system) printf '%s\n' --system ;;
                user) printf '%s\n' --user ;;
                *) exit 1
            esac
    esac
}

_sudo() {
    case $mode in
        --system) command sudo "$@" ;;
        --user) "$@"
    esac
}

interactive() {
    mode=$(fzf --reverse --ansi --prompt="Select systemctl mode:" < <(
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
        status) sysstatus ;;
        edit) sysedit ;;
        enable) sysenable ;;
        disable) sysdisable
    esac
}

sysstart() {
    mode=$(promptmode)

    systemctl "$mode" list-unit-files --no-legend --type=service \
        | preview_service "$mode" \
        | while read -r unit && [ "$unit" ]; do
            if _sudo systemctl "$mode" start "$unit"; then
                systemctl "$mode" -n20 status "$unit" --no-pager
            fi
        done
}

sysstop() {
    mode=$(promptmode)

    systemctl "$mode" list-units --no-legend --type=service --state=running \
        | preview_service "$mode" \
        | while read -r unit && [ "$unit" ]; do
            if _sudo systemctl "$mode" stop "$unit"; then
                systemctl "$mode" -n20 status "$unit" --no-pager
            fi
        done
}

sysstatus() {
    mode=$(promptmode)

    systemctl "$mode" list-unit-files --no-legend --type=service \
        | preview_service "$mode" \
        | while read -r unit && [ "$unit" ]; do
            systemctl "$mode" -n20 status "$unit" --no-pager
        done
}

sysedit() {
    mode=$(promptmode)

    units=($(systemctl "$mode" list-unit-files --no-legend --type=service \
        | preview_service "$mode"))
    _sudo systemctl "$mode" edit --full "${units[@]}"
}

sysenable() {
    mode=$(promptmode)

    systemctl "$mode" list-unit-files --no-legend --type=service --state=disabled \
        | preview_service "$mode" \
        | while read -r unit && [ "$unit" ]; do
            if _sudo systemctl "$mode" enable --now "$unit"; then
                systemctl "$mode" -n20 status "$unit" --no-pager
            fi
        done
}

sysdisable() {
    mode=$(promptmode)

    systemctl "$mode" list-unit-files --no-legend --type=service --state=enabled \
        | preview_service "$mode" \
        | while read -r unit && [ "$unit" ]; do
            if _sudo systemctl "$mode" disable --now "$unit"; then
                systemctl "$mode" -n20 status "$unit" --no-pager
            fi
        done
}

super=system
while :; do
    case $1 in
        -u)
            super=user
            ;;
        --start)
         sysstart
         break
         ;;
        --stop)
         sysstop
         break
         ;;
        --status)
         sysstatus
         break
         ;;
        --edit)
         sysedit
         break
         ;;
        --enable)
         sysenable
         break
         ;;
        --disable)
            sysdisable
            break
            ;;
        -h|--help)
            help
            break
            ;;
        *)
            interactive
            break
    esac
    shift
done
}
