alias ls='ls --color=auto'
alias rickroll='curl -L http://bit.ly/10hA8iC | fish'
alias please=sudo
alias config='git --git-dir=$HOME/arch-configs.git/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

abbr -ag mute-mic pactl set-source-mute @DEFAULT_SOURCE@

thefuck --alias | source

function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

