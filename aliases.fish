# Aliases
alias redis-start='sudo launchctl start io.redis.redis-server'
alias redis-stop='sudo launchctl stop io.redis.redis-server'
alias preparallel='env DISABLE_SPRING=1 rake parallel:prepare'
alias diskusage='ls -al | tail -n +2 | awk \'{ print substr($0, index($0,$9)) }\' | sed "s/;/\";\"/g;s/^/\"/;s/\$/\"/" | grep -v \'^"[\.]\+"$\' | xargs -L 1 sudo du -sh 2>/dev/null | gsort -hr'
alias gs='git status'
alias ga='git add'
alias gcm='git commit -m'
alias gco='git checkout'
alias fiveman='foreman start -f Procfile.dev'
alias banana="git stash pop"
alias g="git"
alias ga="git add "
alias gap="git add -p"
alias gb="git branch "
alias gc="git commit"
alias gd="git diff"
alias gdc="gd --cached"
alias gcl="git clone "
alias gco="git checkout "
alias gcom="git commit -m "
alias gcm="git commit -m"
alias gdw="gd --ignore-all-space"
alias gl="git log "
alias glsha="git show --pretty="format:" --name-only "
alias go="git checkout "
alias gra="git commit --amend --reset-author --no-edit"
alias gs="git status "
alias gs="git status "
alias gpr="git pull --rebase"
alias gpl="git pull -r"
alias gps="git push "
alias gra="git remote add "
alias grc="git rebase --continue"
alias gri="git rebase -i"
alias grr="git remote remove "
alias grv="git remote -v "
alias gsp="git stash pop"
alias gsl="git stash list"
alias gss="git stash save -u"
alias hangon="git stash save -u"
# alias hangon="git stash -u"
alias just_push="gpr; git push"
alias merge="git mergetool"
alias unwip="git reset HEAD~"

alias be="bundle exec"
alias build_all="parallel_rspec --nice spec; npm test"
alias findlogs="find . -name *.log"
#  alias -g G="| grep"
#  alias -g C="| pbcopy"
alias ll="ls -hal"
alias migrape="bin/rake db:migrate db:test:prepare"
alias obash="atom ~/.bash_profile "
alias nuke="bin/rake db:drop db:create db:dev_migrate db:test:prepare "
alias server="foreman start -f Procfile.dev"
alias setup_tests="bin/rake parallel:prepare"
alias yolo="bin/rake db:drop db:create db:dev_migrate db:test:prepare"
alias zmv="noglob zmv -W"

alias chili="cd ~/Documents/electric-chili-projects/"

alias fs="foreman s -f Procfile.dev"
alias hl="heroku login --sso"

function set_profile
  echo -e "\033]50;SetProfile=$argv\a"
end
function chill
  set_profile "Default"
end
# From: https://blog.hospodarets.com/fish-shell-the-missing-config
# REUSE ALIASES FROM ~/.bash_profile
egrep "^alias " ~/.bash_profile | while read e
        set var (echo $e | sed -E "s/^alias ([A-Za-z0-9_-]+)=(.*)\$/\1/")
        set value (echo $e | sed -E "s/^alias ([A-Za-z0-9_-]+)=(.*)\$/\2/")
        # remove surrounding quotes if existing
        set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")
    # evaluate variables. we can use eval because we most likely just used "$var"
        set value (eval echo $value)
    # set an alias
    alias $var="$value"
end
# REUSE ENVIRONMENT VARIABLES FROM ~/.bash_profile
egrep "^export " ~/.bash_profile | while read e
    set var (echo $e | sed -E "s/^export ([A-Z0-9_]+)=(.*)\$/\1/")
    set value (echo $e | sed -E "s/^export ([A-Z0-9_]+)=(.*)\$/\2/")
    # remove surrounding quotes if existing
    set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")
    if test $var = "PATH"
        # replace ":" by spaces. this is how PATH looks for Fish
        set value (echo $value | sed -E "s/:/ /g")
        # use eval because we need to expand the value
        eval set -xg $var $value
        continue
    end
    # evaluate variables. we can use eval because we most likely just used "$var"
    set value (eval echo $value)
    #echo "set -xg '$var' '$value' (via '$e')"
    switch $value
            case '`*`';
            # executable
            set NO_QUOTES (echo $value | sed -E "s/^\`(.*)\`\$/\1/")
            set -x $var (eval $NO_QUOTES)
        case '*'
            # default
            set -xg $var $value
        end
end
