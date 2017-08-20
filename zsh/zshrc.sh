# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000000
	setopt inc_append_history # To save every command before it is executed
	setopt share_history # setopt inc_append_history

# Aliases
	# alias v="vim -p"
    alias stopvpn="sudo service openvpn stop"
    alias startvpn="sudo service openvpn start"
    alias statusvpn="sudo service openvpn status"
    alias vim="vim"
    alias vi="vim"
    alias v="vim"
    alias nvim="nvim"
    alias nvi="nvim"
    alias nv="nvim"
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

source ~/dotfiles/zsh/plugins/antigen.zsh

if [[ ! -d ~/.antigen/bundles/robbyrussell ]]; then
	# Load the oh-my-zsh's library.
	antigen use oh-my-zsh

	# Bundles from the default repo (robbyrussell's oh-my-zsh).
	antigen bundle git
	antigen bundle heroku
	antigen bundle pip
	antigen bundle lein
	antigen bundle command-not-found

	# Syntax highlighting bundle.
	antigen bundle zsh-users/zsh-syntax-highlighting

	# Autosuggestions
	antigen bundle zsh-users/zsh-autosuggestions

	# Load the theme.
	# antigen theme refined
	antigen theme robbyrussell

	# Tell Antigen that you're done.
	antigen apply
fi

source ~/.antigen/bundles/robbyrussell/oh-my-zsh/lib/history.zsh
source ~/.antigen/bundles/robbyrussell/oh-my-zsh/lib/key-bindings.zsh
source ~/.antigen/bundles/robbyrussell/oh-my-zsh/lib/completion.zsh
# source ~/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/virtualenv/virtualenv.plugin.zsh
# source ~/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/virtualenvwrapper/virtualenvwrapper.plugin.zsh
source ~/.antigen/bundles/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.antigen/bundles/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
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

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

TERM=screen-256color


plugins=( virtualenv virtualenvwrapper oh-my-zsh-virtualenv-prompt )

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/qadc/.sdkman"
[[ -s "/home/qadc/.sdkman/bin/sdkman-init.sh" ]] && source "/home/qadc/.sdkman/bin/sdkman-init.sh"


# My settings for start tmux
# tmux-new() {
#   if [[ -n $TMUX ]]; then
#     tmux switch-client -t "$(TMUX= tmux -S "${TMUX%,*,*}" new-session -dP "$@")"
#   else
#     tmux new-session "$@"
#   fi
# }

# # example usage:
# tmux-new -s new > /dev/null 2>&1

# # Run tmux if exists
# if command -v tmux>/dev/null; then
#   [ -z $TMUX ] && exec tmux
# else
#   echo "tmux not installed. Run ./deploy to configure dependencies"
# fi
