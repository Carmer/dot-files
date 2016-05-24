export PATH=~/bin:$PATH


[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# git auto_completion
source ~/.git-completion.bash

# enables 'git hub'
eval "$(hub alias -s)"

#Git Aliases
alias gs="git status"
alias gc="git checkout"
alias ga="git add"
alias gcom="git commit -m"
alias gpl="git pull"
alias gps="git push"
alias grv="git remote -v"
alias gra="git remote add"
alias grr="git remote remove"
alias gcl="git clone"

# Directory Aliases
alias Turing="cd ~/Documents/Turing"
alias projects="cd ~/Documents/Turing/projects"
alias homework="cd ~/Documents/Turing/homework"
alias submissions="cd ~/Documents/Turing/ruby-submissions"
alias practice="cd ~/Documents/Turing/practice"
alias soft="cd ~/Documents/Turing/software"
alias pp="cd ~/Documents/personal_projects"
alias inst="cd ~/Documents/Turing/instructing"
alias mod2="cd ~/Documents/Turing/instructing/mod2"
alias temp="cd ~/Documents/Turing/instructing/temp"
alias today="cd ~/Documents/Turing/software/today"
alias lessons="cd ~/Documents/Turing/software/lesson_plans"
alias curriculum="cd ~/Documents/Turing/software/curriculum"
alias ruby_submissions="cd ~/Documents/Turing/software/ruby-submissions"
alias student-assessments="cd ~/Documents/Turing/software/student-assessments"
alias todo="cd ~/Documents/Turing/software/Mod2-ToDo"
alias house="cd ~/Documents/personal_projects/house_of_luthiery"

# Command Aliases
alias obash="atom ~/.bash_profile"

# Rails / Ruby Alias
alias nuke='bundle exec rake db:drop db:create db:migrate db:seed'
alias clean_assets='rake assets:clobber RAILS_ENV=production ; rake assets:precompile RAILS_ENV=production'


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
