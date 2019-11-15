# Activate zsh completion

setopt sharehistory

bindkey "${terminfo[kpp]}" up-line-or-local-history
bindkey "${terminfo[knp]}" down-line-or-local-history
bindkey "^[^[[A" up-line-or-history    # [Meta] + Cursor up
bindkey "^[^[[B" down-line-or-history  # [Meta] + Cursor down


up-line-or-local-history() {
    zle set-local-history 1
    zle up-line-or-history
    zle set-local-history 0
}
zle -N up-line-or-local-history
down-line-or-local-history() {
    zle set-local-history 1
    zle down-line-or-history
    zle set-local-history 0
}
zle -N down-line-or-local-history


# Setup Homebrew ZSH Help
unalias run-help
autoload run-help
HELPDIR=/usr/share/zsh/5.2/help

export EDITOR=nano
export LESS="${LESS} -x4"
export TZ=America/New_York

export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

# Go
export GOPATH=~/src/go
export PATH=$PATH:${GOPATH//://bin:}/bin

# Rust
export PATH=$PATH:${HOME}/.cargo/bin

# Groovy
export GROOVY_HOME=/usr/local/groovy
export PATH=~/bin:/usr/local/mysql/bin:$GROOVY_HOME/bin:$PATH

# Android SDK
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_SDK_ROOT/tools

# Java
export JAVA_HOME=`/usr/libexec/java_home`

# Golang
export GOPATH=$HOME/src/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# GNU Utils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(pyenv init -)"

# ccache
export PATH=/usr/local/opt/ccache/libexec:${PATH}

# Miniconda
export PATH=/usr/local/miniconda3/bin:${PATH}

# Do Completion Last
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

source <(kubectl completion `basename $SHELL`)
source <(npm completion)

alias nano="nano -m"

# Reattach to tmux
#if [[ $TMUX = "" ]]; then
#  tmux attach
#fi

# FASD

export BYOBU_PREFIX=/usr/local

eval "$(fasd --init auto)"

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

alias config='/usr/bin/git --git-dir=/Users/jpollak/.cfg/ --work-tree=/Users/jpollak'

source ${HOME}/.privaterc

export PGHOST=localhost
export PGUSER=6river
export PGPASSWORD=6river
export PATH=/Users/jpollak/.local/bin:$PATH
