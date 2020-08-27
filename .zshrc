alias ls='ls --color=auto'

export PATH=$PATH:$HOME/bin:$HOME/.npm-global/bin

# .zshrc interactive configuration file for zsh
# thanks to klapmuetz, caphuso, Mikachu, zshwiki.org.
# first revision: 24mar2007  +chris+

# == OPTIONS

setopt NO_BEEP
setopt C_BASES
setopt OCTAL_ZEROES
setopt PRINT_EIGHT_BIT
setopt SH_NULLCMD
setopt AUTO_CONTINUE
setopt NO_BG_NICE
setopt PATH_DIRS
setopt NO_NOMATCH
setopt EXTENDED_GLOB
disable -p '^'

setopt LIST_PACKED
setopt BASH_AUTO_LIST
setopt NO_AUTO_MENU
setopt NO_CORRECT
setopt NO_ALWAYS_LAST_PROMPT
setopt NO_FLOW_CONTROL

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

SAVEHIST=9000
HISTSIZE=9000
HISTFILE=~/.zsh_history

LISTMAX=0
REPORTTIME=60
TIMEFMT="%J  %U user %S system %P cpu %MM memory %*E total"
MAILCHECK=0

# == MISC

umask 002

# This needs to run before compinit installs keybindings.
# 12mar2013  +chris+
bindkey -e

# == PROMPT

# gitpwd - print %~, limited to $NDIR segments, with inline git branch
NDIRS=2
gitpwd() {
  local -a segs splitprefix; local prefix branch
  segs=("${(Oas:/:)${(D)PWD}}")
  segs=("${(@)segs/(#b)(?(#c10))??*(?(#c5))/${(j:\u2026:)match}}")

  if gitprefix=$(git rev-parse --show-prefix 2>/dev/null); then
    splitprefix=("${(s:/:)gitprefix}")
    if ! branch=$(git symbolic-ref -q --short HEAD); then
      branch=$(git name-rev --name-only HEAD 2>/dev/null)
      [[ $branch = *\~* ]] || branch+="~0"    # distinguish detached HEAD
    fi
    if (( $#splitprefix > NDIRS )); then
      print -n "${segs[$#splitprefix]}@$branch "
    else
      segs[$#splitprefix]+=@$branch
    fi
  fi

  (( $#segs == NDIRS+1 )) && [[ $segs[-1] == "" ]] && print -n /
  print "${(j:/:)${(@Oa)segs[1,NDIRS]}}"
}

cnprompt6() {
  case "$TERM" in
    xterm*|rxvt*)
      precmd() { [[ -t 1 ]] && print -Pn "\e]0;%m: %~\a" }
      preexec() { [[ -t 1 ]] && print -n "\e]0;$HOST: ${(q)2//[$'\t\n\r']/ }\a" }
  esac
  setopt PROMPT_SUBST
  nbsp=$'\u00A0'
  PS1='%B%m${TENV:+ [$TENV]}%(?.. %??)%(1j. %j&.)%b $(gitpwd)%B%(!.%F{red}.%F{yellow})%#${SSH_CONNECTION:+%#}$nbsp%b%f'
  RPROMPT=''
}

cnprompt6

# == COMPLETION

zmodload zsh/complist
autoload -Uz compinit && compinit

zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' special-dirs ..
zstyle ':completion:*' accept-exact-dirs true
zstyle ':completion:*' use-ip true
zstyle ':completion::*' insert-tab pending=1
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' rehash true

# Colors, like ls(1).
# 25mar2007  +chris+
# 25feb2011  +chris+
# 17nov2017  +leah+  try disabling
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32'
LS_COLORS=
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:functions'           ignored-patterns '_*'
zstyle ':completion:*:*:*:*:processes*'    force-list always
zstyle ':completion:*:*:kill:*:processes'  insert-ids single
zstyle ':completion:*:*:kill:*:processes'  sort false
zstyle ':completion:*:*:kill:*:processes'  command 'ps -u "$USER"'
zstyle ':completion:*:processes-names'     command "ps -eo cmd= | sed 's:\([^ ]*\).*:\1:;s:\(/[^ ]*/\)::;/^\[/d'"
zstyle ':completion:*:evince::' \
  file-patterns '*.(#i)(dvi|djvu|tiff|pdf|ps|xps)(|.bz2|.gz|.xz|.z) *(-/)' '*'
compdef pkill=killall
compdef ping6=ping
compdef _gnu_generic curl emacs emacsclient file head mv paste
compdef _gnu_generic tail touch scrot shred watch wc zsh

# Don't complete the same twice for kill/diff.
# 25nov2010  +chris+
zstyle ':completion:*:(kill|diff):*'       ignore-line yes

# Don't complete backup files as commands.
# 29sep2012  +chris+
zstyle ':completion:*:complete:-command-::*' ignored-patterns '*\~'

# Cycle through history completion (M-/, M-,).
# 12mar2013  +chris+
zstyle ':completion:history-words:*:history-words' stop yes
zstyle ':completion:history-words:*:history-words' list no
zstyle ':completion:history-words:*' remove-all-dups yes

# == ZLE

# Emacs keybindings have been set above.

# Disable bracketed paste.
# 31aug2015  +chris+
unset zle_bracketed_paste

# This is even better than copy-prev-shell-word, can be called repeatedly.
# 12mar2013  +chris+
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[m" copy-earlier-word

# Remove prompt on line paste (cf. last printed char in cnprompt6).
# 09mar2013  +chris+
bindkey -s $nbsp '^u'

# Shortcut for ' inside ' quoting
# 14mar2016  +chris+
bindkey -s "\C-x'" \''\\'\'\'

# Expand to two last commands
# 09nov2017  +leah+
bindkey -s "\C-x2" '!-2\t ; !-1\t'

# Standard keybindings
# 07apr2011  +chris+
# 04jan2013  +chris+  page-up/down for menu-select
# 14jan2016  +chris+  explicit binds for menu-select
[[ -n $terminfo[khome] ]] && bindkey $terminfo[khome] beginning-of-line
[[ -n $terminfo[kend]  ]] && bindkey $terminfo[kend]  end-of-line
[[ -n $terminfo[kdch1] ]] && bindkey $terminfo[kdch1] delete-char
[[ -n $terminfo[kpp]   ]] && bindkey $terminfo[kpp] backward-word
[[ -n $terminfo[knp]   ]] && bindkey $terminfo[knp] forward-word
[[ -n $terminfo[kpp]   ]] && bindkey -M menuselect $terminfo[kpp] backward-word
[[ -n $terminfo[knp]   ]] && bindkey -M menuselect $terminfo[knp] forward-word

# Move by physical lines, like gj/gk in vim
# 09apr2013  +chris+
_physical_up_line()   { zle backward-char -n $COLUMNS }
_physical_down_line() { zle forward-char  -n $COLUMNS }
zle -N physical-up-line _physical_up_line
zle -N physical-down-line _physical_down_line
bindkey "\e\e[A" physical-up-line
bindkey "\e\e[B" physical-down-line

# M-DEL should stop at /.
# 25mar2007  +chris+
# 28feb2011  +chris+
WORDCHARS="*?_-.[]~&;$%^+"

# backward-kill-default-word (with $WORDCHARS from zsh -f and :)
# 26jun2012  +chris+
_backward_kill_default_word() {
  WORDCHARS='*?_-.[]~=/&:;!#$%^(){}<>' zle backward-kill-word
}
zle -N backward-kill-default-word _backward_kill_default_word
bindkey '\e=' backward-kill-default-word   # = is next to backspace

# transpose-words acts on shell words
# 03mar2014  +chris+
autoload -Uz transpose-words-match
zstyle ':zle:transpose-words' word-style shell
zle -N transpose-words transpose-words-match

# History search with globs.
# 21sep2011  +chris+
# 05jun2012  +chris+  and keeping the rest of the line
# 22apr2016  +chris+  space for *
autoload -Uz narrow-to-region
_history-incremental-preserving-pattern-search-backward() {
  local state
  MARK=CURSOR  # magick, else multiple ^R don't work
  narrow-to-region -p "$LBUFFER${BUFFER:+>>}" -P "${BUFFER:+<<}$RBUFFER" -S state
  zle end-of-history
  zle history-incremental-pattern-search-backward
  narrow-to-region -R state
}
zle -N _history-incremental-preserving-pattern-search-backward
bindkey "^R" _history-incremental-preserving-pattern-search-backward
bindkey -M isearch "^R" history-incremental-pattern-search-backward
bindkey -M isearch -s ' ' '*'
bindkey -M isearch -s '  ' '[[:blank:]]'
bindkey "^S" history-incremental-pattern-search-forward

# Quote stuff that looks like URLs automatically.
# 19jul2008  +chris+
# 02dec2014  +chris+
autoload -U url-quote-magic
zstyle ':urlglobber' url-other-schema ftp git gopher http https magnet
zstyle ':url-quote-magic:*' url-metas '*?[]^(|)~#='  # dropped { }
zle -N self-insert url-quote-magic

# Edit command line with $VISUAL.
# 26jul2010  +chris+
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Force file name completion on C-x TAB, Shift-TAB.
# 23dec2010  +chris+
# 28may2016  +chris+  also complete words already on the command line
autoload -Uz match-words-by-style
_args() {
  local -a ign
  match-words-by-style
  [[ -z "$matched_words[3]" ]] && ign=("$matched_words[2]$matched_words[5]")
  compadd -F ign -- ${(Q)${(z)BUFFER}}
}
zle -C complete-files complete-word _generic
zstyle ':completion:complete-files:*' completer _files _args
zstyle ':completion:complete-files:*' force-list always
bindkey "^X^I" complete-files
bindkey "^[[Z" complete-files

# Force menu on C-f.
# 29dec2010  +chris+
# 21sep2011  +chris+
# 04jan2013  +chris+  rewritten using menu-select
zle -C complete-menu menu-select _generic
_complete_menu() {
  setopt localoptions alwayslastprompt
  zle complete-menu
}
zle -N _complete_menu
bindkey '^O' _complete_menu
bindkey -M menuselect '^O' accept-and-infer-next-history
bindkey -M menuselect '/'  accept-and-infer-next-history
bindkey -M menuselect '^?' undo
bindkey -M menuselect ' ' accept-and-hold
bindkey -M menuselect '*' history-incremental-search-forward

# Move to where the arguments belong.
# 24dec2010  +chris+
after-first-word() {
  zle beginning-of-line
  zle forward-word
}
zle -N after-first-word
bindkey "^X1" after-first-word

# Scroll up in tmux on PageUp.
# 14jan2016  +chris+
_tmux_copy_mode() { tmux copy-mode -eu }
zle -N _tmux_copy_mode
[[ $TMUX_PANE && -n $terminfo[kpp] ]] && bindkey $terminfo[kpp] _tmux_copy_mode

# fg editor on ^Z
# 27sep2011  +chris+
# 17feb2012  +chris+
foreground-vi() { fg %vi }
zle -N foreground-vi
bindkey '^Z' foreground-vi

# Allow to recover from C-c or failed history expansion (thx Mikachu).
# 26may2012  +chris+
_recover_line_or_else() {
  if [[ -z $BUFFER && $CONTEXT = start && $zsh_eval_context = shfunc
        && -n $ZLE_LINE_ABORTED
        && $ZLE_LINE_ABORTED != $history[$((HISTCMD-1))] ]]; then
    LBUFFER+=$ZLE_LINE_ABORTED
    unset ZLE_LINE_ABORTED
  else
    zle .$WIDGET
  fi
}
zle -N up-line-or-history _recover_line_or_else
_zle_line_finish() { ZLE_LINE_ABORTED=$BUFFER }
zle -N zle-line-finish _zle_line_finish

# Inject mkdir call to create the dirname of the current argument.
# 10mar2015  +chris+
autoload -Uz modify-current-argument
_mkdir_arg() {
  local arg=
  modify-current-argument '${arg:=$ARG}'
  zle push-line
  LBUFFER="    mkdir -p $arg:h"
  RBUFFER=
}
zle -N mkdir-arg _mkdir_arg
bindkey '^[M' mkdir-arg

# OPAM configuration
. /home/regen/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GNUPG
GNUPGHOME=~/.gnupg
GPG_TTY=$(tty)
export GPG_TTY
