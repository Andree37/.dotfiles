# .dotfiles

## Navigator
This script allows you to quickly navigate to directories or manage tmux sessions based on your workspace structure. It supports both cd functionality and tmux session management.

### Prerequisites

- fzf: Ensure `fzf` is installed for directory selection.
  - Install via your package manager:
    - macOS: `brew install fzf`
    - Linux: `sudo apt install fzf` or `yum install fzf`
- tmux: Required if `TMUX_SESSION=true` for session management.
  - Install via your package manager:
    - macOS: `brew install tmux`
    - Linux: `sudo apt install tmux` or `yum install tmux`

### Installation

1, Clone the Repository: Clone the navigator script repository to your local machine:
```bash
git clone https://github.com/Andree37/.dotfiles.git ~/github/Andree37/.dotfiles
```

2. Make the Script Executable:
```bash
chmod +x ~/github/Andree37/.dotfiles/navigator
```

3. Update Your Zsh Configuration: Add the following lines to your `~/.zshrc` file:
> Note: remove `source` if you are using the tmux session management feature.
```bash
export NAVIGATOR_PATH="~/github/Andree37/.dotfiles/navigator"
bindkey -s '^f' "source $NAVIGATOR_PATH\n"
```
or to have a cleaner output in your terminal:
```bash
navigator() {
    source ~/github/Andree37/.dotfiles/navigator
}
bindkey -s "^f" "navigator\n"
```

4. Reload Your Zsh Configuration:
```bash
source ~/.zshrc
```

5. (Optional) Change configuration:
```bash
vim ~/github/Andree37/.dotfiles/navigator

# Change the BASE_DIR to your workspace directory
BASE_DIR="$HOME/workplace"

# Change the TMUX_SESSION to false if you don't want to use tmux
TMUX_SESSION=false

# Change the WORKSPACE_SRC_STRUCTURE to true if your directory structure is ~/workplace/WORKSPACE/src/PROJECT/files
WORKSPACE_SRC_STRUCTURE=true
```

### Configuration

You can configure the script to match your workspace directory structure and desired behavior by modifying the following variables at the top of the script:

1. Workspace Directory:
```bash
BASE_DIR="$HOME/github"
```

2. Workspace Structure:
- Set to true if your directory structure is ~/github/WORKSPACE/src/PROJECT/files.
- Set to false if your directory structure is ~/github/WORKSPACE/PROJECT/files.
```bash
WORKSPACE_SRC_STRUCTURE=false
```

3. TMUX Session Management:
- Set to true to enable tmux session management.
- Set to false to use cd functionality instead.
```bash
TMUX_SESSION=true
```

### Usage

- Press `Ctrl+F` to trigger the script.
- Use `fzf` to select a directory from your workspace.
- Depending on your configuration:
  - With `TMUX_SESSION=true`: A new tmux session will be created or switched for the selected project.
  - With `TMUX_SESSION=false`: The terminal will navigate to the selected directory.

### Troubleshooting

- No Selection in fzf:
  - If you exit fzf without making a selection, the script will exit gracefully.

- Error: Package directory not found:
  - Ensure the `BASE_DIR` and `WORKSPACE_SRC_STRUCTURE` match your actual directory structure.

- Keybinding Issues:
  - Verify that `NAVIGATOR_PATH` is correctly set in your ~/.zshrc file.
  - Check the bindkey setup.

Enjoy seamless navigation and session management with your custom workspace! 😊
