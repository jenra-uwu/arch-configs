# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format '%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 999999
zstyle ':completion:*' menu select=2
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit add-zsh-hook vcs_info
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -v
export KEYTIMEOUT=1
# End of lines configured by zsh-newuser-install

alias rickroll='curl -L http://bit.ly/10hA8iC | bash'
alias please=sudo
if [[ $TERM == 'xterm-kitty' ]]; then
    alias ssh='kitty +kitten ssh'
fi
alias config='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias ls='exa'
config config --local status.showUntrackedFiles no &> /dev/null

alias mute-mic='pactl set-source-mute @DEFAULT_SOURCE@'

PATH="/opt/riscv-linux/bin/:/opt/riscv/bin/:~/.rbenv/versions/2.7.3/bin/:/opt/riscv/bin:~/bin:~/.cargo/bin:/opt/homebrew/bin:~/.local/bin:/usr/local/opt/openjdk/bin:~/.local/share/gem/ruby/3.0.0/bin:$PATH"

# Startup message is neofetch logo
neofetch -L

# Autoselect Vi mode indicator
PROMPT_VI_MODE_BOX='%B%S%F{green}[I]'
function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
        PROMPT_VI_MODE_BOX='%B%S%F{red}[N]'
    ;;
    $ZVM_MODE_INSERT)
        PROMPT_VI_MODE_BOX='%B%S%F{green}[I]'
    ;;
    $ZVM_MODE_VISUAL)
        PROMPT_VI_MODE_BOX='%B%S%F{yellow}[V]'
    ;;
    $ZVM_MODE_VISUAL_LINE)
        PROMPT_VI_MODE_BOX='%B%S%F{yellow}[V]'
    ;;
    $ZVM_MODE_REPLACE)
        PROMPT_VI_MODE_BOX='%B%S%F{blue}[R]'
    ;;
  esac
}

# Git stuff
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '(%F{green}%b%f%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# Prompt message is:
# [Vi mode] (exit code)? @hostname:current-directory
# ~> 
setopt PROMPT_SUBST
PROMPT='$PROMPT_VI_MODE_BOX%f%s%(?. . %F{red}%?%f )%F{yellow}@%m%F{green}:%~%f%b $vcs_info_msg_0_
%F{magenta}%B~>%f%b '

# Syntax highlighting, autosuggestions, and a good Vi mode
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Ocaml stuff
test -r ~/.opam/opam-init/init.zsh && source ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
