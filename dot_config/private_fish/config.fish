set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT 1
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Starship Prompt
if status --is-interactive
    if test -f /usr/local/bin/starship
        source ('/usr/local/bin/starship' init fish --print-full-init | psub)
    else if test -f /usr/bin/starship
        source ('/usr/bin/starship' init fish --print-full-init | psub)
    end
end

# Fish command history. Show in reverse chronological order.
function history
    builtin history --show-time='%F %T $ ' --reverse
end

alias ls='exa -l --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons' # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.="exa -a | egrep '^\.'" # show only dotfiles

# Replace some more things with better alternatives
alias cat='bat --style header --style snip --style changes --style header'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ME
#alias rungcc="gcc main.c -lm -o gcc && ./gcc"
#alias runclang="clang main.c -lm -o clang && ./clang"
#alias runmingw="x86_64-w64-mingw32-gcc main.c -lm -o mingw.exe && wine ./mingw.exe"
#alias compress70="mogrify -path . *.jpg -resize 900 -quality 70 *.jpg"
#alias compress70png="mogrify -path . *.png -resize 900 -quality 70 *.jpg"
#alias compress100="mogrify -path . *.jpg -resize 1200 -quality 100 *.jpg"

set -x ANDROID_HOME ~/Android/Sdk
set -p PATH $ANDROID_HOME/platform-tools
set -p PATH $ANDROID_HOME/emulator
set -p PATH $ANDROID_HOME/tools
set -p PATH $ANDROID_HOME/tools/bin
set -x NDK_HOME /opt/android-ndk


source ~/.asdf/asdf.fish

# add .cargo/bin to path
if test -d ~/.cargo/bin
    if not contains -- ~/.cargo/bin $PATH
        set -p PATH ~/.cargo/bin
    end
end

source "/home/becelli/.asdf/installs/rust/1.77.1/env.fish"
