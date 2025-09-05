# Add homebrew to path
export PATH=/opt/homebrew/bin:$PATH

source /opt/homebrew/etc/profile.d/bash_completion.sh
source /opt/homebrew/etc/bash_completion.d/git-prompt.sh

# Include local binaries as part of the path.
export PATH=$PATH:~/.local/bin

# Add path for mise package management.
eval "$(mise activate bash)"

# Environment variable configuration.
export CLICOLOR=1
export EDITOR='nvim'

# Prompt configuration.
export PROMPT_DIRTRIM=2
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\u@\h \w$(__git_ps1 " (%s)") \[\e[0;$(($?==0?0:91))m\]$ \[\e[0m\]'

# Use starship for prompting
eval "$(starship init bash)"

# Alias commands
if command -v eza &>/dev/null
then
    alias ls='eza'
    alias ll='eza -l'
    alias la='eza -la'
    alias lt='eza -la --sort=time'
else
    alias ll='ls -lh'
    alias la='ls -lah'
    alias lt='ls -latr'
fi

alias gap='git add -p'
alias gs='git status'
alias gd='git diff'

alias grep="grep --color"
alias vim='nvim'

# Set JuliaUP and LLVM paths
export PATH=$PATH:~/.juliaup/bin
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Enable rustup.
test -f "$HOME/.cargo/env" && source "$HOME/.cargo/env"

# Enable fzf integration for Bash and fzf-git support.
eval "$(fzf --bash)"
source ~/.local/bin/fzf-git.sh
export FZF_DEFAULT_OPTS='--color=dark'
