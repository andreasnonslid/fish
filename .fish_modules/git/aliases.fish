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

function gsquash
	git rebase -i (git rev-list --max-parents=0 HEAD)
end
complete -c gsquash -a "(git branch --format='%(refname:short)')" -d "Git branch"

function gxcl
	git reset --hard && \
	git clean -ffdx && \
	git submodule sync --recursive && \
	git submodule update --init --recursive --force && \
	git submodule foreach --recursive git clean -ffdx && \
	git checkout --force
end
complete -c gxcl -a "(git branch --format='%(refname:short)')" -d "Git branch"

function gxclFULL
	git reset --hard --recurse-submodules && \
	git lfs fetch --all && \
	git lfs prune && \
	git add --renormalize . && \
	git stash --include-untracked && \
	git clean -ffdx && \
	git reflog expire --all --expire='2.weeks.ago' --expire-unreachable='now' && \
	git gc --prune=now && \
	git submodule sync --recursive && \
	git submodule update --init --recursive --force && \
	git submodule foreach --recursive git clean -ffdx && \
	git checkout --force
end
complete -c gxclFULL -a "(git branch --format='%(refname:short)')" -d "Git branch" 