# # Aliases
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
alias hangon="git stash -u"
alias just_push="gpr; git push"
alias merge="git mergetool"
alias unwip="git reset HEAD~"
alias whereisjava="/usr/libexec/java_home"

alias be="bundle exec"
alias build_all="parallel_rspec --nice spec; npm test"
alias findlogs="find . -name *.log"
alias ll="ls -hal"
alias migrape="bin/rake db:migrate db:test:prepare"
alias obash="code ~/.bash_profile "
alias patient_nuke="rails patient:db:drop patient:db:create patient:db:migrate patient:db:test:prepare"
alias nuke="rails db:drop db:create db:migrate db:test:prepare "
alias server="foreman start -f Procfile.dev"
alias setup_tests="bin/rake parallel:prepare"
alias yolo="patient_nuke; nuke; rm -rf log/shoryuken.log; touch log/shoryuken.log; rails db:seed"
alias zmv="noglob zmv -W"

alias mc="cd ~/Documents/mobilecare"
alias chili="cd ~/Documents/electric-chili-projects/"
alias workflows_api="cd ~/Documents/mobilecare/software/workflows_api"
alias identity="cd ~/Documents/mobilecare/software/identity-service"
alias discovery="cd ~/Documents/mobilecare/software/eureka-discovery-service"
alias jenkins-slaves="cd ~/Documents/mobilecare/software/jenkins-slaves"
alias book="cd ~/Documents/mobilecare/software/book-service"
alias builder="cd ~/Documents/mobilecare/software/builder-service"
alias gateway="cd ~/Documents/mobilecare/software/builder-web-ui-gateway"
alias media="cd ~/Documents/mobilecare/software/media-service"
alias market="cd ~/Documents/mobilecare/software/market-service"
alias form="cd ~/Documents/mobilecare/software/documentation-form-service"
alias collections="cd ~/Documents/mobilecare/software/collections-space-service"
alias activity="cd ~/Documents/mobilecare/software/learning-activity-service"
alias dynamodb-local="java -Djava.library.path=./DynamoDBLocal_lib -jar ~/Library/dynomodb_local_latest/DynamoDBLocal.jar -sharedDb"









alias fs="foreman s -f Procfile.dev"
alias hl="heroku login --sso"

set MYIP curl ifconfig.me


function set_profile
  echo -e "\033]50;SetProfile=$argv\a"
end

function setAWSIP
  aws ec2 authorize-security-group-ingress --group-id sg-01e9437ec462a08e5 --ip-permissions '[{"IpProtocol": "tcp", "ToPort": 22, "FromPort": 22, "IpRanges": [{"CidrIp": "'(eval $MYIP)'/32", "Description": "AndrewCarmer'(date +%F%T)'"}]}]' --profile allogy-development
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
