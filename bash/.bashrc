source /opt/homebrew/etc/profile.d/bash_completion.sh
source /opt/homebrew/etc/bash_completion.d/git-prompt.sh

# Environment variable configuration.
export CLICOLOR=1
export EDITOR='nvim'

# Prompt configuration.
export PROMPT_DIRTRIM=2
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\u@\h \w$(__git_ps1 " (%s)") \[\e[0;$(($?==0?0:91))m\]$ \[\e[0m\]'

# Alias commands
alias ll='ls -lh'
alias la='ls -lah'
alias lt='ls -latr'

alias gap='git add -p'
alias gs='git status'
alias gd='git diff'

alias grep="grep --color"

alias vim='nvim'

# Set JuliaUP and LLVM paths
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.juliaup/bin
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Enable rustup.
test -f "$HOME/.cargo/env" && source "$HOME/.cargo/env"

# Enable GHCUP environment.
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"

# Enable fzf integration for Bash and fzf-git support.
eval "$(fzf --bash)"
source ~/.local/bin/fzf-git.sh

# Add path for starship prompt.
eval "$(starship init bash)"
