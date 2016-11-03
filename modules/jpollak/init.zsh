# Activate zsh completion
fpath=(/opt/boxen/homebrew/share/zsh-completions $fpath)

setopt sharehistory

bindkey "${key[Up]}" up-line-or-local-history
bindkey "${key[Down]}" down-line-or-local-history
bindkey "^[[1;5A" up-line-or-history    # [CTRL] + Cursor up
bindkey "^[[1;5B" down-line-or-history  # [CTRL] + Cursor down

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
HELPDIR=/opt/boxen/homebrew/share/zsh/help

export EDITOR=nano
export LESS="${LESS} -x4"
export TZ=America/New_York

export DISPLAY=:0.0

# Go
export GOPATH=~/src/go
export PATH=$PATH:/opt/boxen/homebrew/opt/go/libexec/bin

# Groovy
export GROOVY_HOME=/usr/local/groovy
export PATH=~/bin:/usr/local/mysql/bin:$GROOVY_HOME/bin:$PATH

# Android SDK
export ANDROID_HOME=~/src/android-sdk-macosx
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

# Tomcat
#export CATALINA_HOME=~/daemons/apache-tomcat-latest/
#export PATH=$PATH:${CATALINA_HOME}/bin

export GITHUB_API_TOKEN=548bc016425131685ae021add44a6d7f33bf1d2f
export HOMEBREW_GITHUB_API_TOKEN=${GITHUB_API_TOKEN}

export AWS_CREDENTIAL_FILE=~/.aws/accessKeys
export DEBUG_KEYSTORE_PASSWD="red duck black swan"


# Mysql
export PATH=$PATH:/usr/local/mysql/bin

# Java
export JAVA_HOME=`/usr/libexec/java_home`

source /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

source <(kubectl completion `basename $SHELL`)
