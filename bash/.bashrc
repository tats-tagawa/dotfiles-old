# Add bash aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Bash prompt 
export PS1="\u@\h:\W\\$ "

# Paths
export PATH="/usr/local/bin:$PATH"

# Colorized less
export LESS_TERMCAP_mb=$(printf '\e[01;35m') # enter blinking mode
export LESS_TERMCAP_md=$(printf '\e[01;31m') # enter double-bright mode
export LESS_TERMCAP_me=$(printf '\e[0m')     # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m')     # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode
export LESS_TERMCAP_ue=$(printf '\e[0m')     # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;32m') # enter underline mode

# History Config
# From http://unix.stackexchange.com/a/1292
export HISTTIMEFORMAT="%m/%d %T » "       # Time Stamp in History
export HISTCONTROL=ignoredups             # Avoid Duplicates
export HISTSIZE=100000                    # big big history
export HISTFILESIZE=100000                # big big history
shopt -s histappend                       # Append to file, not overwrite

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"