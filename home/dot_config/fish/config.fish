# Interactive shell setup. Environment variables live in conf.d/00-env.fish so
# that non-interactive and login shells get them too.
status is-interactive; or return

set -g fish_greeting

# ---------------- VI MODE ------------------
# Insert mode keeps fish's default emacs-style bindings (ctrl-p/n/w/a/e, …)
fish_vi_key_bindings
set -g fish_cursor_default block
set -g fish_cursor_insert line
set -g fish_cursor_replace_one underscore
set -g fish_cursor_visual block
# Accept the autosuggestion with ctrl+space
bind -M insert ctrl-space accept-autosuggestion

# ---------------- ABBREVIATIONS ------------------
# Abbreviations expand when you press space, so history stores full commands
abbr -a cz chezmoi
abbr -a g git
abbr -a gpgdisable git config commit.gpgsign false
abbr -a gpgenable git config commit.gpgsign true
abbr -a k kubectl
abbr -a n nvim
abbr -a nn nvim .
abbr -a m mise
abbr -a mr mise run
abbr -a x exit
abbr -a c clear
abbr -a ud kitty +kitten diff
abbr -a icat kitty +kitten icat
abbr -a wrapoff tput rmam
abbr -a wrapon tput smam
abbr -a .. cd ..
abbr -a ... cd ../..
abbr -a .... cd ../../..
abbr -a ..... cd ../../../..

# ---------------- WRAPPERS ------------------
# These replace a command, so they stay aliases instead of abbreviations
if command -q eza
    alias ls 'eza --group-directories-first'
    alias la 'eza -la --group-directories-first'
    alias ll 'eza -l --group-directories-first'
else
    alias la 'ls -la'
    alias ll 'ls -l'
end
command -q bat; and alias cat bat
# Make ripgrep produce hyperlinks that kitty can open
alias rg 'rg --hyperlink-format=kitty'

# `app`, `ci`, `db`, `dev`, `fix` and `lint` run mise tasks, see mise_run
for cmd in app ci db dev fix lint
    eval "function $cmd --wraps 'mise run' --description 'mise run $cmd:<task>'; mise_run $cmd \$argv; end"
end

# ---------------- TOOL INTEGRATIONS ------------------
# fzf: ctrl+t file picker, alt+c cd (atuin below takes over ctrl+r)
command -q fzf; and fzf --fish | source
# direnv must hook in before mise
command -q direnv; and direnv hook fish | source
command -q mise; and mise activate fish | source
command -q zoxide; and zoxide init fish --cmd z | source
command -q atuin; and atuin init fish | source
command -q starship; and starship init fish | source
