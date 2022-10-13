alias aws='aws --endpoint-url http://localhost:4566'


# >>> talisman >>>
# Below environment variables should not be modified unless you know what you are doing
export TALISMAN_HOME=/Users/prabhujayakumar/.talisman/bin
alias talisman=$TALISMAN_HOME/talisman_darwin_amd64
export TALISMAN_INTERACTIVE=true
# <<< talisman <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
