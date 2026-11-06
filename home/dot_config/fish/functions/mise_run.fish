function mise_run --description 'mise run <cmd>[:<sub>] [args…]'
    # mise_run ci          -> mise run ci
    # mise_run ci lint …   -> mise run ci:lint …
    set -l cmd $argv[1]
    if test (count $argv) -eq 1
        mise run $cmd
    else
        mise run $cmd:$argv[2] $argv[3..]
    end
end
