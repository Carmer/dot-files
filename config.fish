set -x PGHOST /var/pgsql_socket
set -x PGHOST localhost
set -gx FLASK_APP=run.py



set fish_greeting "Suh..."

set fish_theme robbyrussell

set fish_plugins git rails rvm bundler node brew

# Load oh-my-fish configuration.
#. $fish_path/oh-my-fish.fish
. $HOME/.config/fish/aliases.fish

eval (direnv hook fish)
rvm default

function pg_start
  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/logfile start
end

function pg_stop
  pg_ctl -D /usr/local/var/postgres stop -s -m fast
end
