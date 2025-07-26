# Dotfiles

Bare Git repository for managing dotfiles. Track configuration files directly in your home directory without symlinks.

## Quick Setup

```bash
# Initialize
git init --bare $HOME/.myconf
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no

# Add to shell config
echo "alias config='/usr/bin/git --git-dir=\$HOME/.myconf/ --work-tree=\$HOME'" >> ~/.zshrc

# Add files and push
config add .zshrc .gitconfig
config commit -m "Add initial configs"
config remote add origin git@github.com:timlrx/dotfiles.git
config push -u origin main
```

## Install on New Machine

```bash
git clone --bare git@github.com:timlrx/dotfiles.git $HOME/.myconf
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config checkout
config config status.showUntrackedFiles no

# Add alias to shell config
echo "alias config='/usr/bin/git --git-dir=\$HOME/.myconf/ --work-tree=\$HOME'" >> ~/.zshrc
```

If checkout fails due to existing files:
```bash
mkdir -p .config-backup
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
config checkout
```

## Usage

Use `config` instead of `git`:

```bash
config status
config add .vimrc
config commit -m "Update vimrc"
config push
config pull
```

