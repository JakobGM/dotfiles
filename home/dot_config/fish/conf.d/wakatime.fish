# Send a wakatime heartbeat after each interactive command. Only the command
# name is sent, never its arguments, since those can contain secrets.
# Uses the wakatime-cli that vim-wakatime installs under $WAKATIME_HOME.
status is-interactive; or return

function __wakatime_heartbeat --on-event fish_postexec
    set -l cli $WAKATIME_HOME/.wakatime/wakatime-cli
    test -x $cli; or return
    set -l entity (string split -f1 ' ' -- (string trim -- $argv[1]))
    test -n "$entity"; or return
    command $cli --write --plugin fish-wakatime/0.1 --entity-type app \
        --project Terminal --entity $entity >/dev/null 2>&1 &
    disown
end
