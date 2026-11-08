# .dotfiles

Shell, prompt, terminal multiplexer and editor config for macOS (Apple Silicon).

| Path | Linked to |
| --- | --- |
| `zsh/.zshrc` | `~/.zshrc` |
| `zsh/.zprofile` | `~/.zprofile` |
| `starship.toml` | `~/.config/starship.toml` |
| `tmux/tmux.conf` | `~/.config/tmux/tmux.conf` |
| `zed/settings.json` | `~/.config/zed/settings.json` |
| `herdr/config.toml` | `~/.config/herdr/config.toml` |
| `nvim/` | not linked by `install.sh` (see step 6) |

## Setting up a new Mac

Run these in order. The default macOS shell is already zsh.

### 1. Command line tools and Homebrew

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"   # for this terminal only; .zprofile handles it later
```

### 2. Clone this repo

`install.sh` creates symlinks pointing into the clone, so pick a permanent spot and
don't move it afterwards.

```sh
mkdir -p ~/github/Andree37
git clone https://github.com/Andree37/.dotfiles.git ~/github/Andree37/.dotfiles
```

### 3. Packages

Core (the shell prints errors on startup without these):

```sh
brew install starship fzf go opam nvm
```

Everything else `.zshrc` and the config here expect:

```sh
brew install neovim tmux lazygit zig make pnpm openjdk ruby@3.0 postgresql@15
brew install --cask ghostty zed
```

Then:

```sh
mkdir -p ~/.nvm && source /opt/homebrew/opt/nvm/nvm.sh && nvm install 22
opam init                                         # .zshrc runs `opam env`
curl -fsSL https://herdr.dev/install.sh | sh      # herdr, installs to ~/.local/bin
```

### 4. oh-my-zsh and plugins

Install oh-my-zsh before running `install.sh`. `KEEP_ZSHRC=yes` stops the installer
from replacing `~/.zshrc`.

```sh
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

P=~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git           $P/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git  $P/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git               $P/zsh-autosuggestions
git clone https://github.com/Andree37/zsh-navigator.git                      $P/zsh-navigator
```

### 5. Link the dotfiles

```sh
~/github/Andree37/.dotfiles/install.sh
```

Any file already in the way is moved to `<file>.bak.<timestamp>` (you get a warning
when its contents differed from the repo). Running it again is safe: links that
already point at the repo are left alone.

### 6. Neovim

`nvim/` is an AstroNvim config. `install.sh` skips it so it never replaces an
existing `~/.config/nvim`. On a fresh machine:

```sh
ln -s ~/github/Andree37/.dotfiles/nvim ~/.config/nvim
```

### 7. Open a new terminal

Open Ghostty (or quit and reopen your terminal) so the login shell loads
`.zprofile` and `.zshrc`. Check it worked:

```sh
starship --version && which pnpm fzf && bindkey '^f'   # last should print _zsh_navigator_widget
```

## Optional extras

Install these only if you use them. Missing ones are skipped or just leave an
unused PATH entry.

- **Rust**: `~/.zshenv` (not in this repo) sources `~/.cargo/env`. Install with
  `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`, which also creates `~/.zshenv`.
- **Bun**: `curl -fsSL https://bun.sh/install | bash`
- **Google Cloud SDK**: `.zshrc` looks for it in `~/Documents/google-cloud-sdk`.
- **Python 3.11** from python.org: `.zprofile` puts its framework `bin` first on PATH.
- **JetBrains Toolbox**: its scripts directory is added to PATH.
- **Akash** (`provider-services` in `/usr/local/bin`): run `akash-addr` to set
  `AKASH_ACCOUNT_ADDRESS`.

## Things that are tied to this machine

- Some `.zshrc` lines use `/Users/andre/...` (gcloud, `ijhttp`, bun completions,
  `~/bin`). With a different username, change them to `$HOME`.
- Paths assume Apple Silicon Homebrew at `/opt/homebrew`.
