# Change git repo to use SSH instead
function github_ssh() {
    git remote set-url origin git@github.com:$1/$2.git
}
