# Fish search

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
if command -v fd >/dev/null 2>&1
  alias fd='fd-find'
else
  alias fd='find . -type f -name'
end
alias ffind='find . -type f -name'

function maliases
  rg -e "^alias.*$argv[1].*" ~/dotfiles/bashrc/.bashrc ~/dotfiles/bashrc/.shell_modules --no-ignore --hidden --glob "*.sh" --glob "*.bashrc"
end 