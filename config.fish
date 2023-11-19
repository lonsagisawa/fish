if not functions --query fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    echo "Run fisher update to install plugins"
end

set fish_greeting

switch (uname)
    case Linux
        # Linux specific configuration
        bass source /etc/profile
    case Darwin
        # macOS specific configuration
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin
end

# catppuccin theme
set --global theme_color_scheme "Catppuccin Mocha"

# bun
set -gx BUN_INSTALL $HOME/.bun
fish_add_path $BUN_INSTALL/bin

# cargo
fish_add_path $HOME/.cargo/bin

# Deno
fish_add_path $HOME/.deno/bin

# composer
fish_add_path $HOME/.composer/vendor/bin
