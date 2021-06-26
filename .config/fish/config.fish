#!/usr/bin/fish

alias rickroll='curl -L http://bit.ly/10hA8iC | bash'
alias please=sudo

if [ $TERM = 'xterm-kitty' ]
    alias ssh='kitty +kitten ssh'
end

alias config='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias ls='exa'
config config --local status.showUntrackedFiles no &> /dev/null

abbr -ag mute-mic pactl set-source-mute @DEFAULT_SOURCE@

set -g fish_user_paths ~/.rbenv/versions/2.7.3/bin/ /opt/riscv/bin ~/bin ~/.cargo/bin /opt/homebrew/bin ~/.local/bin /usr/local/opt/openjdk/bin ~/.local/share/gem/ruby/3.0.0/bin $fish_user_paths

set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showupstream "informative"
fish_vi_key_bindings

function fish_greeting
	neofetch -L
end

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace underscore
set fish_cursor_replace_one underscore
set fish_cursor_visual block

function fish_prompt
	set -l stat $status
	if [ $stat -ne 0 ]
		echo -n (set_color --bold red)$stat' '
	end
	echo -n (set_color --bold yellow)'@'$hostname(set_color normal)
	echo -n (set_color --bold green):(prompt_pwd)(set_color normal)
	echo (__fish_git_prompt)
	echo (set_color --bold magenta)'~> '(set_color normal)
end

