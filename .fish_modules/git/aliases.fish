# Fish Git aliases

alias gs="git status --untracked-files=normal"
complete -c gs -w git-status

alias ga="git add"
complete -c ga -w git-add

alias gc="git commit"
complete -c gc -w git-commit

alias gcm="git commit -m"
complete -c gcm -w git-commit

alias gco="git checkout"
complete -c gco -w git-checkout

alias gsb="git switch -c"
complete -c gsb -w git-switch

alias gsw="git switch"
complete -c gsw -w git-switch

alias gp="git push"
complete -c gp -w git-push

alias gpl="git pull"
complete -c gpl -w git-pull

alias gr="git rebase"
complete -c gr -w git-rebase

alias grs="git restore"
complete -c grs -w git-restore

alias gb="git branch"
complete -c gb -w git-branch

alias gf="git fetch"
complete -c gf -w git-fetch

alias gds="git diff --staged"
complete -c gds -w git-diff

alias gfp="git fetch --prune"
complete -c gfp -w git-fetch

alias gca="git commit --amend --no-edit"
complete -c gca -w git-commit

alias gl="git log --oneline --graph --all --decorate"
complete -c gl -w git-log

alias grsall="git restore ."
complete -c grsall -w git-restore

alias grsstaged="git restore --staged"
complete -c grsstaged -w git-restore

alias glast="git log -p -1"
complete -c glast -w git-log

alias gundo="git reset --soft HEAD~1"
complete -c gundo -w git-reset

alias gprune='git fetch -p && git branch --merged | grep -v "\*\|main\|master" | xargs -n 1 git branch -d'
complete -c gprune -w git-fetch

function gcmp
    git log --oneline --graph "$argv[1]..$argv[2]"
end
complete -c gcmp -a "(git branch --format='%(refname:short)')" -d "Git branch"

alias gsquash="git rebase -i (git rev-list --max-parents=0 HEAD)"

function gxcl
    # Hard-reset working tree
    git reset --hard
    and git clean -ffdx
    and git submodule sync --recursive
    and git submodule update --init --recursive --force
    and git submodule foreach --recursive git clean -ffdx
    and git checkout --force
end

function gxclFULL
    # Hard-reset including submodules
    git reset --hard --recurse-submodules
    and git lfs fetch --all
    and git lfs prune
    and git add --renormalize .
    and git stash --include-untracked
    and git clean -ffdx
    and git reflog expire --all --expire='2.weeks.ago' --expire-unreachable='now'
    and git gc --prune=now
    and git submodule sync --recursive
    and git submodule update --init --recursive --force
    and git submodule foreach --recursive git clean -ffdx
    and git checkout --force
end

