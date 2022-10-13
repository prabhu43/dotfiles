# zmodload zsh/zprof
RUBY_DEP_GEM_SILENCE_WARNINGS=1
export RUBY_DEP_GEM_SILENCE_WARNINGS=1

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/prabhujayakumar/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME=powerlevel10k/powerlevel10k
#ZSH_THEME="myown"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export NVM_LAZY=1
plugins=(git brew kubectl aws nvm)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
. ~/.zsh_aliases
. ~/.zsh_functions

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-13.0.1.jdk/Contents/Home/
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/openjdk-13.0.1.jdk/Contents/Home/

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/10/bin"

# Brew Python: version 3
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="${HOME}/Library/Python/3.9/bin/:$PATH" # for python3 libraries

# for python2 libraries
# export PATH="${HOME}/Library/Python/2.7/bin/:$PATH"

#EXA
export PATH="/Users/prabhujayakumar/.cargo/bin:$PATH"

export PATH="/usr/local/Cellar/curl/7.67.0/bin/curl:$PATH"

export PATH="/usr/local/opt/gettext/bin:$PATH"


# kubernetes bash completion
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

function iterm2_print_user_vars() {
  iterm2_set_user_var kubecontext $(kubectl config view -o=jsonpath='{.current-context}')
}

function git_branch {
  BRANCH_REFS=$(git symbolic-ref HEAD 2>/dev/null) || return
  GIT_BRANCH="${BRANCH_REFS#refs/heads/}"
  [ -n "$GIT_BRANCH" ] && echo "($GIT_BRANCH)"
}

function precmd {
  echo -ne "\e]1;${PWD//*\//} $(git_branch)\a"
}

source /Users/prabhujayakumar/workspace/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT

# Load autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# GO variables
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export HOMEBREW_EDITOR=vi

# source /usr/local/share/antigen/antigen.zsh

eval "$(direnv hook zsh)"

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Krew
export PATH="${PATH}:${HOME}/.krew/bin"

# Chef ruby
# eval "$(chef shell-init zsh)"
# export KNIFE_HOME=/Users/prabhujayakumar/chef-repo

#### increase history size
export SAVEHIST=1000000000
export HISTSIZE=1000000000

## fzf - key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# java 11
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

# >>> talisman >>>
# Below environment variables should not be modified unless you know what you are doing
export TALISMAN_HOME=/Users/prabhujayakumar/.talisman/bin
alias talisman=$TALISMAN_HOME/talisman_darwin_amd64
export TALISMAN_INTERACTIVE=true
export TALISMAN_SKIP_UPGRADE=true
# <<< talisman <<<


## nvm
# export NVM_DIR="$HOME/.nvm"
# # [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# alias nvm="unalias nvm; [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"; nvm $@"
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; nvm $@"

# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
alias sdkman="unalias sdkman; [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"; sdkman $@"

# colima
# export DOCKER_HOST=unix:///Users/prabhujayakumar/.colima/docker.sock
# export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
# zprof