# Add homebrew to path
export PATH=/opt/homebrew/bin:$PATH

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

