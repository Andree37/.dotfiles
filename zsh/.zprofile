# Keep PATH and INFOPATH free of duplicates when login shells nest (herdr panes).
# -U on the scalar PATH too, since the lines below assign PATH, not path.
typeset -U PATH path
typeset -TU INFOPATH infopath

# Added by Toolbox App
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  # shellenv exports FPATH; don't leak it into child shells, where oh-my-zsh
  # appends to it again and invalidates the shared .zcompdump.
  typeset +x FPATH
fi

# Python 3.11 (python.org framework)
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:$PATH"
