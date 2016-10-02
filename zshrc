# Path to my oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Themes from ~/.oh-my-zsh/themes/
ZSH_THEME="powerlevel9k/powerlevel9k"

# POWERLEVEL9K
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_STATUS_BACKGROUND='blue'

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
DISABLE_LS_COLORS="true"

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

plugins=(git brew history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
DEFAULT_USER=`whoami`
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Bind UP and DOWN arrow keys for history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# report time a command took if it's longer than n seconds
REPORTTIME=5

# history
HISTSIZE=100000
SAVEHIST=100000

setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.

# iTerm shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

###############################################################################
# Aliases                                                                     #
###############################################################################

# general/misc/stuff
alias zshcfg="vim ~/.zshrc"
alias zshrld="source ~/.zshrc"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias backupAtom='apm list --installed --bare > ~/.dotfiles/atom/packages.list'
alias restoreAtom='apm install --packages-file ~/.dotfiles/atom/packages.list'
alias please="sudo $(fc -ln -1)" # sudo !!
eval "$(hub alias -s)" # wrap git into hub
eval "$(thefuck --alias FUCK)" # alias for thefuck

# functions
function bak() { cp $1 $1.bak; }
function mcd() { mkdir -p "$1" && cd "$1"; } # mkdir && cd

# ls
alias l='ls -lAhG' # shows everything (default zsh alias + highlighting)
alias ls='ls -G' # always highlight directories
alias lsd='ls -Gal | grep ^d' # list all directories

# getting out of the current dir quickly
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
