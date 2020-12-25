alias rickroll='curl -L http://bit.ly/10hA8iC | fish'
alias please=sudo
alias ssh='kitty +kitten ssh'
alias config='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no

abbr -ag mute-mic pactl set-source-mute @DEFAULT_SOURCE@

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

set -g fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths

thefuck --alias | source

set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showupstream "informative"

function fish_greeting
	neofetch -L
end

function fish_prompt
	echo -n (set_color --bold green)(prompt_pwd)(set_color normal)
	echo -n (__fish_git_prompt)
	echo (set_color --bold magenta)' ~> '(set_color normal)
end
