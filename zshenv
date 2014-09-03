
if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi

