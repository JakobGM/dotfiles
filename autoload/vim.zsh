# -------- Setup for vim functionality in ZSH --------

# Use vim editing mode in terminal [escape to enter normal mode]
bindkey -v

# Restore some keymaps removed by vim keybind mode
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# Dependencies for the following lines
zmodload zsh/zle
autoload -U colors && colors

# Change prompt icon + color based on insert/normal vim mode in prompt
export PURE_PROMPT_SYMBOL="%{$fg[blue]%}❯%{$reset_color%}"
export PURE_PROMPT_VICMD_SYMBOL="%{$fg[green]%}❮%{$reset_color%}"

# By default, we have insert mode shown on right hand side
export RPROMPT="%{$fg[blue]%}[INSERT]%{$reset_color%}"

# And also a beam as the cursor
echo -ne '\e[5 q'

# Callback for vim mode change
function zle-keymap-select () {
    # Invoke Pure as super function

    # Only supported in these terminals
    if [ "$TERM" = "xterm-256color" ] || [ "$TERM" = "xterm-kitty" ]; then
        if [ $KEYMAP = vicmd ]; then
            # Command mode
            export RPROMPT="%{$fg[green]%}[NORMAL]%{$reset_color%}"

            # Set block cursor
            echo -ne '\e[1 q'
        else
            # Insert mode
            export RPROMPT="%{$fg[blue]%}[INSERT]%{$reset_color%}"

            # Set beam cursor
            echo -ne '\e[5 q'
        fi
    fi

    # Refresh prompt and call Pure super function
    prompt_pure_update_vim_prompt_widget
}

# Bind the callback
zle -N zle-keymap-select

# Reduce 
export KEYTIMEOUT=1
