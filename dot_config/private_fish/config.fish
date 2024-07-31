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


~/.local/bin/mise activate fish | source

# add .cargo/bin to path
if test -d ~/.cargo/bin
    if not contains -- ~/.cargo/bin $PATH
        set -p PATH ~/.cargo/bin
    end
end

set -x EDITOR nvim
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gcr/ssh

set -gx PNPM_HOME "/home/becelli/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

function envsource
    set -l envfile "$argv"
    if not test -f "$envfile"
        echo "❌ Unable to load $envfile"
        return 1
    end

    set -l env_vars

    while read -l line
        if not string match -qr '^#|^$' "$line" # Skip empty lines and comments
            if string match -qr '=' "$line" # Check for key-value pairs
                set -l item (string split -m 1 '=' "$line")
                set -l key "$item[1]"
                set -l raw_value "$item[2]"

                # Escape special characters in the value
                set -l escaped_value (string escape -- "$raw_value")
                set env_vars $env_vars "$key=$escaped_value"
            else
                eval $line # Execute simple commands
            end
        end
    end <"$envfile"

    # Sort environment variables alphabetically by key
    set env_vars (printf "%s\n" $env_vars | sort)

    # Export sorted variables and print them
    for var in $env_vars
        set -l key (string split -m 1 '=' $var)[1]
        set -l value (string split -m 1 '=' $var)[2]
        eval set -gx $key "$value"
        echo "✅ Exported: $key"
    end
end
