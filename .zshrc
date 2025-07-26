# Oh My ZSH plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
export ZSH="$HOME/.oh-my-zsh"
source "$ZSH/oh-my-zsh.sh"

# get machine's ip address
alias ip="ipconfig getifaddr en0"

# edit global zsh configuration
alias zshconfig="vim ~/.zshrc"
# reload zsh configuration
alias zshsource="source ~/.zshrc"
# reload zsh configuration
alias ohmyzsh="cd ~/.oh-my-zsh"

# navigate to global ssh directory
alias sshhome="cd ~/.ssh"
alias sshconfig="vim ~/.ssh/config"
alias gitconfig="vim ~/.gitconfig"

# Navigation aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gpush='git push'
alias gpull='git pull'
alias gco='git checkout'
alias gcm='git commit -m'
alias gl='git log --oneline --graph --all --decorate'
alias gll='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]%Creset" --decorate --date=short'

# load zsh-completions
autoload -U compinit && compinit

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Fnm
eval "$(fnm env --use-on-cd)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# poetry
export PATH="$HOME/.local/bin:$PATH"

# Use radian as default r terminal
alias r="radian"

# Run jaeger
alias run_jaeger='docker run -d --rm --name jaeger \
  -e COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  -p 5778:5778 \
  -p 16686:16686 \
  -p 4317:4317 \
  -p 4318:4318 \
  -p 14250:14250 \
  -p 14268:14268 \
  -p 14269:14269 \
  -p 9411:9411 \
  jaegertracing/all-in-one && echo "Jaeger UI service is running at http://localhost:16686"'

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# dotfiles config alias
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

# use starship theme (needs to be at the end)
eval "$(starship init zsh)"
