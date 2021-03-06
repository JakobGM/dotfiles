# Use gpip to install global python packages, as pip requires virtualenv
gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# Use neovim as manpager in zsh
local NMAN="$XDG_CONFIG_HOME/nvim/plugged/neoman.vim/scripts/nman.zsh"
if [[ -a $NMAN ]]
then
    source $NMAN
fi

function fixsystemdboot() {
    # Mount the EFI partition
    mkdir -p /Volumes/EFI
    mount /dev/disk0s1 /Volumes/EFI

    # "Bless" the systemd boot loader
    sudo bless --mount /Volumes/EFI --setBoot --file /Volumes/EFI/EFI/systemd/systemd-bootx64.efi --shortform
}

function setup_gpg_keys() {
    # A function to setup GPG keys on a new system
    local PRIVATE_KEY=/tmp/private.key

    xdg-open "https://keybase.io/jakobgm"
    vared -p "Have you copied your private PGP key to your system clipboard[Y/n]: " -c REPLY

    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        return 1
    fi
    xclip -o -sel clip > $PRIVATE_KEY

    printf "--- Importing secret key ---\n"
    gpg --allow-secret-key-import --import $PRIVATE_KEY

    printf "\n--- Importing public key from keybase ---\n"
    curl -Ls https://keybase.io/jakobgm/pgp_keys.asc | gpg --import

    rm $PRIVATE_KEY
}


# Change git repo to use SSH instead
function github_ssh() {
    git remote set-url origin git@github.com:$1/$2.git
}

# Run sphinx docserver on internal ip adress
function internal_ds() {
    INTERNAL_IP=$(ip addr show | rg -o "inet (.+)/.+global.+" -r '$1')
    firefox $INTERNAL_IP:8000
    sphinx-autobuild . _build --host $INTERNAL_IP
}

# Copy file to folk.ntnu.no/jakobgm
function folk() {
    scp ${1} jakobgm@login.ansatt.ntnu.no:public_html
}

# Convert video file to web optimized GIF
function convert2gif() {
    # Remove file suffix for output file designation
    output=${${1}%.*}

    # Set FPS = 15, color depth = 32, and use the entire file
    gifcurry_cli -i $1 -o $output -f 15 -c 32 -s 0 -d 10000
}

# Copy newest screenshot to current directory with correct filename extension
# Usage: cpss my_custom_screenshot_name
function cpss() {
    newest_screenshot=$(\ls -td ~/Screenshots/* | head -n1)
    extension="${newest_screenshot##*.}"
    new_path="${1}.${extension}"
    echo "cp ${newest_screenshot} -> ${new_path}"
    cp ${newest_screenshot} ${new_path}
}

# Sync the current directory with another directory
function syncdir {
  watchexec \
    --verbose \
    --ignore 'tags.*' \
    'for path in ${WATCHEXEC_WRITTEN_PATH//:/ }; do cp .$path '"${1%/}"'/$(realpath --relative-to=$PWD .$path); done'
}
