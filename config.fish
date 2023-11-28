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

# fzf
set -x FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--height 50% --reverse --border"

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

        # Homebrew
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin

        # Rancher Desktop
        fish_add_path $HOME/.rd/bin
end

