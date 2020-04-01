set -x PGHOST /var/pgsql_socket
set -x PGHOST localhost



set fish_greeting "

Out of chaos comes beauty...

"

set fish_theme robbyrussell

set fish_plugins git rails rvm bundler node brew

# # Load oh-my-fish configuration.
# # . $fish_path/oh-my-fish.fish
. $HOME/.config/fish/aliases.fish

# eval (direnv hook fish)
rvm default

function pg_start
  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/logfile start
end

function pg_stop
  pg_ctl -D /usr/local/var/postgres stop -s -m fast
end

set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -x PATH "/usr/local/apache-maven-3.6.1/bin" $PATH
set -x PATH "/usr/local/flyway-5.2.4/" $PATH
set -x PATH "/usr/local/share/python:" $PATH
set -x PATH "/opt/local/bin" $PATH

set -x DOCKER_HOST "unix:///var/run/docker.sock"
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"
set -x AWS_REGION "us-east-1"
set -x AWS_PROFILE "allogy-development"
set -x PROCESS_ACTIVE_ELASTIC_JOBS "true"
set -x KMS_S3_KEY "618598de-e287-429c-9842-c10c728e7d44"
set -x PROJECT_IMPLEMENTATION "trauma-jhs"