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

export DISPLAY=:0.0

# Go
export GOPATH=~/src/go

# Groovy
export GROOVY_HOME=/usr/local/groovy
export PATH=~/bin:/usr/local/mysql/bin:$GROOVY_HOME/bin:$PATH

# Android SDK
export ANDROID_HOME=~/src/android-sdk-macosx
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

export GITHUB_API_TOKEN=548bc016425131685ae021add44a6d7f33bf1d2f

export AWS_CREDENTIAL_FILE=~/.aws/accessKeys
export DEBUG_KEYSTORE_PASSWD="red duck black swan"

# Java
export JAVA_HOME=`/usr/libexec/java_home`

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

source <(kubectl completion `basename $SHELL`)

eval "$(nodenv init -)"

