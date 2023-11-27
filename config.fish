if not functions --query fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    echo "Run fisher update to install plugins"
end

set fish_greeting

# catppuccin theme
set --global theme_color_scheme "Catppuccin Mocha"

# bun
set -gx BUN_INSTALL $HOME/.bun
fish_add_path $BUN_INSTALL/bin

# cargo
fish_add_path $HOME/.cargo/bin

# composer
fish_add_path $HOME/.composer/vendor/bin

# aliases
alias vim="nvim"

alias g="git"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

alias ls="eza -l"
alias la="eza -la"

switch (uname)
    case Linux
        # Linux specific configuration
        replay source /etc/profile

        # Deno
        set -gx DENO_INSTALL $HOME/.deno
        fish_add_path $DENO_INSTALL/bin
    case Darwin
        # macOS specific configuration
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin
end

