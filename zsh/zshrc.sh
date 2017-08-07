# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000
	setopt inc_append_history # To save every command before it is executed
	setopt share_history # setopt inc_append_history

# Aliases
	# alias v="vim -p"
    alias stopvpn="sudo service openvpn stop"
    alias startvpn="sudo service openvpn start"
    alias statusvpn="sudo service openvpn status"
    alias vim="vim -p"
    alias vi="vim -p"
    alias v="vim -p"
    alias nvim="nvim -p"
    alias nvi="nvim -p"
    alias nv="nvim -p"
    alias cls="clear"
    alias tm="tmux"
    alias la="ls -a -l --sort=extension -v"
    alias _="sudo"

# Settings
	export VISUAL=vim

source ~/dotfiles/zsh/plugins/fixls.zsh

#Functions
	# Custom cd
	c() {
		cd $1;
		ls;
	}
	alias cd="c"

# For vim mappings:
	stty -ixon

source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/keybindings.sh

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source ~/dotfiles/zsh/prompt.sh

export ANDROID_HOME=/home/qadc/Android/Sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

TERM=screen-256color

source ~/dotfiles/zsh/plugins/oh-my-zsh/plugins/virtualenv/virtualenv.plugin.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/plugins/virtualenvwrapper/virtualenvwrapper.plugin.zsh

plugins=(virtualenv virtualenvwrapper)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/qadc/.sdkman"
[[ -s "/home/qadc/.sdkman/bin/sdkman-init.sh" ]] && source "/home/qadc/.sdkman/bin/sdkman-init.sh"

# tmux-new() {
#   if [[ -n $TMUX ]]; then
#     tmux switch-client -t "$(TMUX= tmux -S "${TMUX%,*,*}" new-session -dP "$@")"
#   else
#     tmux new-session "$@"
#   fi
# }

# # example usage:
# tmux-new -s new > /dev/null 2>&1

# Run tmux if exists
if command -v tmux>/dev/null; then
  [ -z $TMUX ] && exec tmux
else
  echo "tmux not installed. Run ./deploy to configure dependencies"
fi
