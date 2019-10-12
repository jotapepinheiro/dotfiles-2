PATH=$PATH:/usr/local/sbin

# -------
# PATH Android Tools
# -------
export ANDROID_HOME=~/Dev/android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias work='cd ~/local/work/development/'
alias personal='cd ~/local/personal/'

# ALIAS DO PYTHON 3
alias python=python3

alias pip=pip3

# -------
# Emulador Android
# -------
alias android-list='emulator -list-avds'
alias android-28='emulator -avd Pixel_3_API_28'
alias android-26='emulator -avd Pixel_3_API_26'

# -------
# Variados Aliases
# -------
alias code='open -a "Visual Studio Code"'
alias subl='open -a "Sublime Text"'
alias edita-host='subl /etc/hosts'
alias add-host='printf "127.0.0.1       editar.test #editar\n" | sudo tee -a /etc/hosts'
alias edita-alias='open -a "Visual Studio Code" ~/.bash_aliases'
alias edita-docker='open -a "Visual Studio Code" ~/Dev/laradock/.env'
alias ip="curl icanhazip.com"
alias ip-local="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias copy='rsync -avv --stats --human-readable --itemize-changes --progress --partial'
alias cl='clear'
alias ns='npm start'
alias start='npm start'
alias nr='npm run'
alias run='npm run'
alias nis='npm i -S'
alias o="open ." # Open the current directory in Finder

# -------
# VPS
# -------
alias limpar-ram='sysctl -w vm.drop_caches=3 && swapoff -a && swapon -a'

# -------
# Tailwind Aliases
# -------
alias tailwind='./node_modules/.bin/tailwind'

# -------
# Browser Sync Aliases
# -------
alias local-server='browser-sync start -f . --server'

# -------
# Dashboard Aliases
# -------
alias dash-off='defaults write com.apple.dashboard mcx-disabled -boolean YES | killall Dock'
alias dash-on='defaults write com.apple.dashboard mcx-disabled -boolean NO | killall Dock'

# -------
# PHP Aliases
# -------
alias php.info='php -i'
alias php5.6='sudo a2dismod php7.0 && sudo a2dismod php7.1 && sudo a2dismod php7.2 && sudo a2enmod php5.6 && sudo update-alternatives --set php /usr/bin/php5.6 && sudo service apache2 restart'
alias php7.0='sudo a2dismod php5.6 && sudo a2dismod php7.1 && sudo a2dismod php7.2 && sudo a2enmod php7.0 && sudo update-alternatives --set php /usr/bin/php7.0 && sudo service apache2 restart'
alias php7.1='sudo a2dismod php5.6 && sudo a2dismod php7.0 && sudo a2dismod php7.2 && sudo a2enmod php7.1 && sudo update-alternatives --set php /usr/bin/php7.1 && sudo service apache2 restart'
alias php7.2='sudo a2dismod php5.6 && sudo a2dismod php7.0 && sudo a2dismod php7.1 && sudo a2enmod php7.2 && sudo update-alternatives --set php /usr/bin/php7.2 && sudo service apache2 restart'

# -------
# SSH Aliases
# -------
alias ssh-novo='ssh-keygen'
alias ssh-atual='cat ~/.ssh/id_rsa.pub'
alias ssh-router='ssh Jotape@192.168.1.1'
alias ssh-rasp='ssh root@192.168.1.103'

# -------
# Docker Aliases
# -------
alias d-up-olivre='cd $HOME/Dev/laradock && docker-compose up -d nginx mysql redis redis-webui workspace | cd $HOME/Dev'
alias d-up-gesp='cd $HOME/Dev/laradock && docker-compose up -d apache2 mssql workspace | cd $HOME/Dev'
alias d-up-evoto='cd $HOME/Dev/laradock && docker-compose up -d nginx postgres workspace | cd $HOME/Dev'

alias d-down='cd $HOME/Dev/laradock && docker-compose down | cd $HOME/Dev'
alias d-restart='cd $HOME/Dev/laradock && docker-compose restart | cd $HOME/Dev'
alias d-rede='docker network ls'
alias d-backend='docker network inspect laradock_backend'
alias d-frontend='docker network inspect laradock_frontend'

alias d-stop='docker container stop $(docker container ls -aq)'
alias d-remove='docker container rm $(docker container ls -aq)'

alias d-b='cd $HOME/Dev/laradock && docker-compose build --no-cache workspace'
alias d-b-php-cache='cd $HOME/Dev/laradock && docker-compose build --no-cache php-fpm'
alias d-b-php='cd $HOME/Dev/laradock && docker-compose build php-fpm'
alias d-b-mssql='cd $HOME/Dev/laradock && docker-compose build --no-cache mssql'
alias d-b-pg='cd $HOME/Dev/laradock && docker-compose build --no-cache postgres'
alias d-b-nginx='cd $HOME/Dev/laradock && docker-compose build --no-cache nginx'
alias d-b-jenkins='cd $HOME/Dev/laradock && docker-compose build --no-cache jenkins'
alias d-b-force='cd $HOME/Dev/laradock && docker-compose up -d --build --force-recreate --renew-anon-volumes postgres'

## Bash
alias d-e-work='docker container exec -it laradock_workspace_1 bash'
alias d-e-mysql='cd $HOME/Dev/laradock && docker-compose exec mysql bash'
alias d-e-jenkins='cd $HOME/Dev/laradock && docker-compose exec jenkins bash'
alias d-e-postgres='cd $HOME/Dev/laradock && docker-compose exec postgres bash'
alias d-e-mssql='docker container exec -it laradock_mssql_1 bash'
alias d-e-php='cd $HOME/Dev/laradock && docker-compose exec php-fpm bash'
alias d-e-nginx='cd $HOME/Dev/laradock && docker-compose exec nginx bash'

alias d-remove-imagens='docker rmi $(docker images -q)'
alias d-ferra-tudo='docker system prune -a'

## Show ips Containers
function d-ip() {
  docker inspect --format='{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
}

## Limpa imagens órfãs
dclean() {
    processes=`docker ps -q -f status=exited`
    if [ -n "$processes" ]; then
      docker rm $processes
    fi

    images=`docker images -q -f dangling=true`
    if [ -n "$images" ]; then
      docker rmi $images
    fi
}

# remove laravel* containers
# remove laravel_* images
dcleanlaradockfunction()
{
	echo 'Removing ALL containers associated with laradock'
	docker ps -a | awk '{ print $1,$2 }' | grep laradock | awk '{print $1}' | xargs -I {} docker rm {}

	# remove ALL images associated with laradock_
	# does NOT delete laradock/* which are hub images
	echo 'Removing ALL images associated with laradock_'
	docker images | awk '{print $1,$2,$3}' | grep laradock_ | awk '{print $3}' | xargs -I {} docker rmi {}

	echo 'Listing all laradock docker hub images...'
	docker images | grep laradock

	echo 'dcleanlaradock completed'
}
# associate the above function with an alias
# so can recall/lookup by typing 'alias'
alias dcleanlaradock=dcleanlaradockfunction

updatebrew() {
  set -x;
  brew update;
  brew cleanup;
  brew cask upgrade --greedy;
}

# -------
# Laravel Aliases
# -------
alias novo-laravel='cd $HOME/Dev/www && composer create-project --prefer-dist laravel/laravel'

novo-site-laravel () {
    cd ~/Dev/laradock/nginx/sites/
    cp laravel.conf.example ./$1.conf && subl $1.conf
    cd ~/Dev/www
    composer create-project --prefer-dist laravel/laravel $1
    cd ~/Dev/www/$1 
}

novo-site () {
    cd ~/Dev/laradock/nginx/sites/
    cp laravel.conf.example ./$1.conf && subl $1.conf
    cd ~/Dev/www/$1 
}

alias pa='php artisan'
alias pakey='php artisan key:generate'
alias papass='php artisan passport:install'
alias palink='php artisan storage:link'
alias par:l='php artisan route:list'
alias pam='php artisan migrate'
alias pam:r='php artisan migrate:refresh'
alias pam:rs='php artisan migrate:refresh --seed'
alias cu='composer update'
alias ci='composer install'
alias cda='composer dump-autoload -o'
alias lara-clear='php artisan cache:clear && php artisan view:clear && php artisan config:cache && php artisan config:clear && php artisan route:cache && php artisan route:clear'

alias perm1='chmod -R 755 storage bootstrap/cache'
alias perm2='sudo chown -R joaopinheiro:www-data'

## SHOW REDIRECTS DOMAIN
redirect() {
  echo
  for domain in $@; do
  echo --------------------
  echo $domain
  echo --------------------
  curl -sILk $domain | egrep 'HTTP|Loc' | sed 's/Loc/ -> Loc/g'
  echo
  done
}

jteste() {
  echo -e "\033[1;31m Vermelho \033[0m"
    if [ -n "$1" ]; then
      if [ -n "$2" ]; then
          echo "Param $1/$2"
      else
          echo "Sem Param";
      fi
    else
        echo "Sem Param";
    fi
}

cores() {
  echo -e "\033[1;31m Vermelho \033[0m"
  echo -e "\033[1;32m Verde \033[0m"
  echo -e "\033[1;33m Amarelo \033[0m"
  echo -e "\033[1;34m Roxo \033[0m"
  echo -e "\033[1;35m Rosa \033[0m"
  echo -e "\033[1;36m Azul \033[0m"

  echo -e "\033[1;40m Amarelo \033[0m"
  echo -e "\033[1;41m Amarelo \033[0m"
  echo -e "\033[1;42m Amarelo \033[0m"
  echo -e "\033[1;43m Amarelo \033[0m"

}

# Directories
alias ll='ls -FGlAhp'
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

alias df="df -h"
alias diskusage="df"
alias fu="du -ch"
alias folderusage="fu"
alias tfu="du -sh"
alias totalfolderusage="tfu"

# ----------------------
# Git Aliases
# ----------------------
alias gecho='echo "# projeto" >> README.md'
alias gi='git init'
alias gr='git add README.md'
alias gcm='git commit -m'
alias gar='git remote add origin'
alias gpom='git push -u origin master'
alias 🍺="git checkout -b drunk"
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gd='git diff'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'
alias gs='echo ""; echo "*********************************************"; echo -e " NÃO SE ESQUEÇA DE DAR UM PULL ANTES DE COMITAR"; echo "*********************************************"; echo ""; git status'
