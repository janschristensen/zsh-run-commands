# Edit this file 
alias zz="vim ~/.zshrc"

# Source changes 
alias zzz="source ~/.zshrc && echo \"File sourced!\""

# Extract commands from history via fuzzy finder 
cmdz() {
   rm -f ~/cmdz
   tail -n200 ~/.zsh_history | sed "s/^: [0-9]\+.[0-9]\+.//g" | fzf -m | awk '{ print }' >> ~/cmdz
   echo "Content of ~/cmdz"
   cat ~/cmdz
}

# Create a markdown section with commands from history
docz() {
   rm -f ~/docz
   echo "" >> ~/docz
   echo "## $1" >> ~/docz
   echo "$2" >> ~/docz
   echo "\`\`\`" >> ~/docz
   cat ~/cmdz >> ~/docz
   echo "\`\`\`" >> ~/docz
   echo "Content of ~/docz"
   cat ~/docz
}

# Analyse tofu plan
alias tfp="tofu plan --out ~/tfplan.binary && tofu show -json ~/tfplan.binary > ~/tfplan.json"
alias pp='python3 -mjson.tool'
alias tfpp="pp  ~/tfplan.json | jq '.'"

# Fuzzy finder defaults
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height=80% --preview 'bat --color=always {}'"
export FZF_DEFAULT_COMMAND="fd"
export MSYS_NO_PATHCONV=1

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Nix detection
if [[ -n $USINGNIX ]]; then
   export PS1="$USINGNIX $PS1"
fi

# Git defaults
git config --global user.email jsc@miralix.com
git config --global user.name "Jan Søndergaard Christensen"
git config --global init.defaultbranch main
git config --global init.templatedir /home/jan/.git-template
git config --global core.editor vim

# time format
TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'
