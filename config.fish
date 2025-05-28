# Fish configuration

# Source core settings
for config_file in ~/.config/fish/.fish_modules/core/*.fish
  source "$config_file"
end

# Source git configuration
for config_file in ~/.config/fish/.fish_modules/git/*.fish
  source "$config_file"
end

# Source tool configurations
for config_file in ~/.config/fish/.fish_modules/tools/*.fish
  source "$config_file"
end

# Initialize zoxide if available
if command -v zoxide >/dev/null 2>&1
  zoxide init fish | source
end

# Enable Starship prompt on startup
starship init fish | source

# Start Zellij on interactive shells
if status is-interactive
    if not set -q ZELLIJ
        if test -z "$TMUX"
            zellij
        end
    end
end