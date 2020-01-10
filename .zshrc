#
#zplug "modules/prompt", from:prezto
#
## Run a command after a plugin is installed/updated
## Provided, it requires to set the variable like the following:
## ZPLUG_SUDO_PASSWORD="********"
#zplug "mollifier/anyframe", at:4c23cb60
#
## Can manage gist file just like other packages
#zplug "b4b4r07/79ee61f7c140c63d2786", \
#    from:gist, \
#    as:command, \
#    use:get_last_pane_path.sh
#
#
## Group dependencies
## Load "emoji-cli" if "jq" is installed in this example
#zplug "stedolan/jq", \
#    from:gh-r, \
#    as:command, \
#    rename-to:jq
#zplug "b4b4r07/emoji-cli", \
#    on:"stedolan/jq"
# zplug "bhilburn/powerlevel9k", as:theme, defer:2
#zplug 'themes/agnoster', from:oh-my-zsh

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
# zplug
source ~/.zplug/init.zsh
# Rename a command with the string captured with `use` tag
zplug "plugins/git",   from:oh-my-zsh
zplug "b4b4r07/httpstat", \
    as:command, \
    use:'(*).sh', \
    rename-to:'$1'
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# theme (https://github.com/sindresorhus/pure#zplug)　好みのスキーマをいれてくだされ。
zplug "mafredri/zsh-async"
zplug "jhawthorn/fzy", \
    as:command, \
    rename-to:fzy, \
    hook-build:"make && sudo make install"
zplug "tcnksm/docker-alias", use:zshrc
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

export ENHANCD_FILTER=fzf
zplug "b4b4r07/enhancd", use:init.sh

# zplug 'dracula/zsh', as:theme
zplug "themes/ys", from:oh-my-zsh, as:theme

#zplug "sindresorhus/pure"
# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting"
# history関係
#zplug "zsh-users/zsh-history-substring-search"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load --verbose

export PATH=$PATH:"/lib/pytho2.7/site-packages"
export PATH=$PATH:"/lib/pytho2.7/"
export PATH="$PATH:./node_modules/.bin"
export DISABLE_AUTO_TITLE=true
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export CARGO_PATH=$HOME/.cargo/bin
export PATH=$PATH:$CARGO_PATH
export TERM=xterm-256color

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# Configure android emulator to run directly in terminal.
function emulator { ( cd "$(dirname "$(whence -p emulator)")" && ./emulator "$@"; ) }
# Set alias to shorten command and also fix the side-effect
alias emu="$ANDROID_HOME/tools/emulator"

export UPDATE_ZSH_DAYS=13

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"


export LANG=en_US.UTF-8

alias noexec="chmod -R -x+X -maxdepth 1 *"
# alias server="python -m SimpleHTTPServer"
# alias ls="ls -a | fzf"
# eval `dircolors ~/dircolors.256dark`
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# PS1="$PS1"'$([ -n "$TMUX"  ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'


export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND='ls -a'
export FZF_ALT_C_COMMAND='z -et | awk '"'"'{ print $2 }'"'"' '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias jest='nocorrect jest'
alias ggpf='git push origin $(git_current_branch) -f'

#function that retrieves the current branch name
git_current_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# (wal -i ~/wall.png &)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
