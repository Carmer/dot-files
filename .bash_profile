export PATH=~/bin:$PATH

export TURING_AUTH_ADMIN_TOKEN="151a38aa2d935a90d15913da8dbb4942734ad846ddf31d4e42be3773721fda588d99ce6189fc851df8b3b37ebc7d7f298de73e1f83860c9c3bd15cdb021f09d2"
export PEOPLE_GITHUB_ID="151a38aa2d935a90d15913da8dbb4942734ad846ddf31d4e42be3773721fda588d99ce6189fc851df8b3b37ebc7d7f298de73e1f83860c9c3bd15cdb021f09d2"
export PEOPLE_GITHUB_SECRET="151a38aa2d935a90d15913da8dbb4942734ad846ddf31d4e42be3773721fda588d99ce6189fc851df8b3b37ebc7d7f298de73e1f83860c9c3bd15cdb021f09d2"

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# PS1=" \t \n \w - ⎈ "


# git auto_completion
# source ~/.git completion.bash

# enables 'git hub'
eval "$(hub alias -s)"

#Git Aliases
alias gs="git status"
alias gc="git checkout"
alias ga="git add"
alias gcom="git commit -m"
alias gpl="git pull"
alias gps="git push"

# Directory Aliases
alias Turing='cd ~/Documents/Turing'
alias projects='cd ~/Documents/Turing/projects'
alias homework='cd ~/Documents/Turing/homework'
alias submissions='cd ~/Documents/Turing/ruby-submissions'
alias practice='cd ~/Documents/Turing/practice'


# git prompt settings
parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export -f parse_git_branch

# prompt
export CLICOLOR=1
export PS1="\[\033[36m\][\w]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n\$\[\033[00m\] ⎈ "

# hubsupport
eval "$(hub alias -s)"
