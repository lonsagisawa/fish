if not functions --query fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    echo "Run fisher update to install plugins"
end

switch (uname)
    case Linux
        # Linux specific configuration
        replay source /etc/profile

        # Deno
        set -gx DENO_INSTALL $HOME/.deno
        fish_add_path --path --append $DENO_INSTALL/bin
    case Darwin
        # macOS specific configuration

        # Homebrew
        fish_add_path --path --append /opt/homebrew/bin
        fish_add_path --path --append /opt/homebrew/sbin

        # miniforge
        if test -f /opt/homebrew/Caskroom/miniforge/base/bin/conda
            status is-interactive && eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
        end
end

set fish_greeting

# catppuccin theme
set --global theme_color_scheme "Catppuccin Mocha"

# bun
set -gx BUN_INSTALL $HOME/.bun
fish_add_path --path --append $BUN_INSTALL/bin

# cargo
fish_add_path --path --append $HOME/.cargo/bin

# composer
fish_add_path --path --append $HOME/.composer/vendor/bin

# mise
if test -e ~/.local/bin/mise
    $HOME/.local/bin/mise activate fish | source
    mise completion fish > $HOME/.config/fish/completions/mise.fish
    status is-interactive && fish_add_path --path --append $HOME/.local/share/mise/shims
end

# fzf
set -x FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--height 50% --reverse --border"

# aliases
alias g="git"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias lg="lazygit"

alias ls="eza -l"
alias la="eza -la"

