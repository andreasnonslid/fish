# Fish reload functions

function reloadfish
  cd ~/dotfiles
  source $HOME/.config/fish/config.fish
  cd - > /dev/null
  echo "Fish configuration reloaded."
end

function editfish
  nvim $HOME/.config/fish/config.fish
  echo "Opening Fish configuration."
end 