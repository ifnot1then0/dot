#           _
#          | |
#   _______| |__  _ __ ___
#  |_  / __| '_ \| '__/ __|
#   / /\__ \ | | | | | (__
#  /___|___/_| |_|_|  \___|
#
#

### Bash-Insulter:
if [ -f $HOME/.config/bash-insulter/bash.command-not-found ]; then
   source $HOME/.config/bash-insulter/bash.command-not-found
fi

### Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

### Add a command or source you want loaded on every new prompt
precmd() {
	source /$HOME/.config/shell/aliasrc
}

### History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

### Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

### Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

### vi mode
bindkey -v
export KEYTIMEOUT=1

### Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

### Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

### Set your language environment
export LANG=en_US.UTF-8

### Set colors for the terminal
export TERM="xterm-256color"

ZSH_DISABLE_COMPFIX=true
COMPLETION_WAITING_DOTS=true
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true

### Color palette: Paster this command in your terminal:
# for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"

### LEFT PROMPT
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir vcs)
POWERLEVEL9K_CONTEXT_TEMPLATE="%n"

### RIGHT PROMPT
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(host public_ip vi_mode status)
POWERLEVEL9K_HOST_BACKGROUND="183" #Purple
POWERLEVEL9K_HOST_FOREGROUND="236" #Grey
POWERLEVEL9K_SSH_FOREGROUND="000" #Black
POWERLEVEL9K_SSH_BACKGROUND="183" #Purple
POWERLEVEL9K_PUBLIC_IP_FOREGROUND="114" #Green
POWERLEVEL9K_PUBLIC_IP_BACKGROUND="236" #Grey
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="110" #Blue
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="000" #Black
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="114" #Green
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND="000" #Black
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_STATUS_CROSS=true
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="000" #Black
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="001" #Red
ZLE_RPROMPT_INDENT=0

### ROOT
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="001" #Red
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="000" #Black

### SUDO
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND="001" #Red
POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND="000" #Black

### USER
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="114" #Green
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="236" #Grey

### REMOTE
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND="236" #Grey
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND="183" #Purple

### HOME DIR
# POWERLEVEL9K_DIR_HOME_BACKGROUND="110" #Blue
POWERLEVEL9K_DIR_HOME_BACKGROUND="110" #Blue
POWERLEVEL9K_DIR_HOME_FOREGROUND="000" #Black

### SUBFOLDERS
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="110" #Blue
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="000" #Black

### OUSIDE OF $HOME DIR
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="183" #Purple
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="000" #Black

### DIR /etc
POWERLEVEL9K_DIR_ETC_BACKGROUND="150" #Green
POWERLEVEL9K_DIR_ETC_FOREGROUND="000" #Black

### GIT REPO INFO
# POWERLEVEL9K_VCS_CLEAN_BACKGROUND="000" #Black
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="236" #Grey
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="110" #Blue
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="236" #Grey
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="114" #Green
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="236" #Grey
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="110" #Blue

### SHORTEN DIR LENGTH - ALL USERS
POWERLEVEL9K_SHORTEN_DIR_LENGTH=20

### zsh theme location
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

### zsh auto suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

### Load fast syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

### ipinfo
ipinfo myip | grep -E -w -i "City|Country|Timezone"
