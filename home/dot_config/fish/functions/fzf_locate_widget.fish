function fzf_locate_widget --description 'Replace the command line with a path picked from locate'
    if not command -q locate
        echo 'fzf_locate_widget: locate is not installed' >&2
        commandline -f repaint
        return 1
    end
    set -l selected (locate / | fzf -q (commandline -b))
    and commandline -r -- $selected
    commandline -f repaint
end
