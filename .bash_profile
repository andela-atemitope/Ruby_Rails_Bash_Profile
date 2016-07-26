# Path to your oh-my-zsh installation.
export ZSH=/Users/Temitope/.oh-my-zsh

#PATH for rbenv
export PATH="$HOME/.rbenv/shims:$PATH"



# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function mcd() {
  mkdir $1 && cd $1
}

alias copy="cp"

function hbps() {
  mcd $1 && touch 'index.html' && mcd assets && mkdir js && mkdir css && mkdir images && cd css && touch main.scss && touch main.css && cd .. && cd .. && echo "<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.1.1/normalize.min.css"
      rel="stylesheet">
  <link rel="stylesheet" href="./assets/css/main.css" type="text/css">
  <title>this</title>
</head>
  <body>
    <footer>
    </footer>
  </body>
</html>">> 'index.html' && subl . && sass --watch assets/css/main.scss:assets/css/main.css
}

function hbpa() {
  mcd $1 && touch 'index.html' && mcd assets && mkdir js && mkdir css && mkdir images && cd css && touch main.scss && touch main.css && cd .. && cd .. && echo "<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.1.1/normalize.min.css"
      rel="stylesheet">
  <link rel="stylesheet" href="./assets/css/main.css" type="text/css">
  <title>this</title>
</head>
  <body>
    <footer>
    </footer>
  </body>
</html>">> 'index.html' && atom . && sass --watch assets/css/main.scss:assets/css/main.css
}

function gca() {
  git add -A
}


function gs() {
  git status
}


function gpom() {
  git push origin master
}


function gap() {
  git add -p
}

function gau() {
  git add -u
}

function mcdt() {
  mkdir $1 && cd $1 && touch $2
}

ZSH_THEME=pygmalion
# Use sublimetext for editing config files
alias zshconfig="subl ~/.zshrc"
alias envconfig="subl ~/Projects/config/env.sh"
plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"




alias gp='git push'
alias sw='sass --watch assets/css/main.scss:assets/css/main.css'
alias migrate='bundle exec rake db:migrate && bundle exec rake db:migrate RAILS_ENV=production && bundle exec rake db:migrate RAILS_ENV=test '
alias rs='bundle exec rake spec'
alias rt='bundle exec rake test'
alias pri="/Users/Temitope/documents/Private"
alias ext="/Users/Temitope/documents/Private/extra"
alias shokai="/Users/Temitope/documents/private/project/shokai"
alias fj="/Users/Temitope/documents/private/fruitjuice"
alias util= "/Users/Temitope/documents/Private/utilities"
alias babel_inst= "npm install --save-dev babel-core@6.3.13 babel-loader@6.2.0 babel-preset-es2015@6.3.13 babel-preset-react@6.3.13"
# <--- Version Control ---->
function gcp() {
  git add .
  git commit -m $1
  git push origin master
}
# <----- Rails ----->
function rails_new() {
  rails new $1
  cd $1
  git init
  git add .
  git commit -m 'Initial commit'
  subl .;
}
function rails_pg() {
  rails new $1 -T -B --database=postgresql
  cd $1
  # configure postgres
  echo /config/database.yml >> .gitignore
  mv config/database.yml config/database.example.yml
  sed "s/username: "$1"/username: /g" config/database.example.yml > config/database.yml
  rake db:create
  add_rails_gems
  cd .. && cd $1
  bundle
  cd .. && cd $1
  rails generate rspec:install
  # save progress
  git init
  git add .
  git commit -m 'initial commit'
  subl .
}
alias migrate_db="rake db:migrate && rake db:migrate RAILS_ENV=test && rake db:migrate RAILS_ENV=production"
function rails_r() {
  rails new $1 -T -B
  cd $1
​
  add_rails_gems
​
  cd .. && cd $1
  bundle
  cd .. && cd $1
  rails generate rspec:install
​
  # save progress
  git init
  git add .
  git commit -m 'initial commit'
​
  subl .
}
function add_rails_gems() {
​
  echo "
#gem 'acts-as-taggable-on'
#gem 'carrierwave'
#gem 'devise'
#gem 'kaminari'
#gem 'ransack'
#gem 'simple_form'
#gem 'state_machine'
#gem 'stringex'
​
group :test, :development do
  gem 'capybara'
  #gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'pry-rails'
  #gem 'quiet_assets'
  gem 'rspec-rails'
  #gem 'shoulda-matchers'
  #gem 'valid_attribute'
end
​
" >> Gemfile
​
}
# <--- Heroku ----->

function heroku(){
  heroku create
  git push heroku master
  heroku open
}
