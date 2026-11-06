function dot --description 'Open the chezmoi source directory in nvim with a file picker'
    cd ~/.local/share/chezmoi/home; and nvim -c 'FzfLua files'
end
