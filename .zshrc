# Oh My ZSH plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tmux
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-fzf-history-search
  you-should-use
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
export ZSH="$HOME/.oh-my-zsh"
source "$ZSH/oh-my-zsh.sh"

# load zsh-completions
autoload -U compinit && compinit

# Aliases
[ -f ~/.aliases ] && source ~/.aliases

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

# tailscale alias
alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'

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

# Remote sync
sync-remote() {
    if [ $# -eq 0 ]; then
        echo "Usage: sync-remote <hostname>"
        return 1
    fi
    rsync -av ~/.aliases "$1":~/.bash_aliases
}

# use starship theme (needs to be at the end)
eval "$(starship init zsh)"

