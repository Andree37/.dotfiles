#!/usr/bin/env bash
# Symlink dotfiles into place. Existing files are moved to <file>.bak.<timestamp>.
set -euo pipefail

repo="$(cd "$(dirname "$0")" && pwd)"
stamp="$(date +%Y%m%d%H%M%S)"


link() {
  local src="$repo/$1" dest="$HOME/$2"
  mkdir -p "$(dirname "$dest")"
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    return
  fi
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if [ -f "$dest" ] && ! cmp -s "$dest" "$src"; then
      echo "warning: $2 differs from repo copy; old version kept in $2.bak.$stamp"
    fi
    mv "$dest" "$dest.bak.$stamp"
    echo "backed up $2"
  fi
  ln -s "$src" "$dest"
  echo "linked $2"
}

link zsh/.zshrc .zshrc
link zsh/.zprofile .zprofile
link starship.toml .config/starship.toml
link tmux/tmux.conf .config/tmux/tmux.conf
link zed/settings.json .config/zed/settings.json
link herdr/config.toml .config/herdr/config.toml
