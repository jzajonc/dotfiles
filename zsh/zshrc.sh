TERM=screen-256color
autoload -Uz compinit && compinit
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
alias la="ls -al"
alias _="sudo"
# alias d-clogs="docker-compose logs --follow"
# alias d-c="docker-compose"
alias :q="exit"
alias :Q="exit"
alias mux="tmuxinator"
alias emc="emacs -nw"
alias em="emacs"
alias dclfc="docker-compose logs -f | sed -r -e 's/((ERROR|FATAL|CRITICAL|Error|Fatal|Critical|error|fatal|critical|exit).*)/\o033[41m\1\o033[39m/' -e 's/((WARNING|NOTICE|Warning|Notice|warning|notice).*)/\o033[1;33m\1\o033[39m/' -e 's/((INFO|Info|info).*)/\o033[0;32m\1\o033[39m/'"
alias mc="bash /usr/local/opt/midnight-commander/libexec/mc/mc-wrapper.sh"
alias dcpsn="docker ps --format '{{.Names}}'"

# Settings
export VISUAL=vim
# export ZSH=$HOME/.antigen/bundles/robbyrussell/oh-my-zsh
export EDITOR=nvim
export ANDROID_HOME=/home/qadc/Android/Sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export SDKMAN_DIR="/home/qadc/.sdkman"
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG

# source $ZSH/oh-my-zsh.sh
source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/lib/history.zsh
source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/lib/key-bindings.zsh
source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/lib/completion.zsh
# source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/virtualenv/virtualenv.plugin.zsh
# source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/virtualenvwrapper/virtualenvwrapper.plugin.zsh
source $HOME/.antigen/bundles/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.antigen/bundles/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh
source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found/command-not-found.plugin.zsh
source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/dirhistory/dirhistory.plugin.zsh
source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker-compose/docker-compose.plugin.zsh
source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip/pip.plugin.zsh
# source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/python/python.plugin.zsh
source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/wd/wd.plugin.zsh
# source $HOME/dotfiles/zsh/plugins/vi-mode.plugin.zsh
source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh
source $HOME/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/lein/lein.plugin.zsh
source $HOME/dotfiles/zsh/plugins/pytest.plugin.zsh
source $HOME/dotfiles/zsh/plugins/python.completion.zsh
source $HOME/dotfiles/zsh/plugins/python.plugin.zsh
source $HOME/dotfiles/zsh/plugins/zle_vi_visual.zsh
source $HOME/dotfiles/zsh/plugins/fixls.zsh
source $HOME/dotfiles/zsh/keybindings.sh
source $HOME/dotfiles/zsh/prompt.sh
source $HOME/dotfiles/zsh/plugins/tmuxinator.zsh
source $HOME/dotfiles/zsh/plugins/iterm2_shell_integration.zsh

#Functions
# Custom cd
c() {
	cd $1;
	ls;
}
alias cd="c"

# For vim mappings:
stty -ixon

plugins=()

if [[ ! -d ~/.antigen/bundles/robbyrussell ]]; then
	source $HOME/dotfiles/zsh/plugins/antigen.zsh

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
	# antigen theme robbyrussell
	# antigen theme refined

	# Tell Antigen that you're done.
	antigen apply
fi

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/home/qadc/.sdkman/bin/sdkman-init.sh" ]] && source "/home/qadc/.sdkman/bin/sdkman-init.sh"
