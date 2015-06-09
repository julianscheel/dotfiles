gpg-connect-agent /bye
set -gx SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh

if test $TERM = xterm
    set -gx TERM xterm-256color
end

set -gx EDITOR vim
set -gx VGL_FPS 60
set -gx VGL_SPOIL 0
set -gx PRIMUS_SYNC 1
set -gx RANGER_LOAD_DEFAULT_RC FALSE

# Prevent wine from creating stuff everywhere
set -gx WINEDLLOVERRIDES winemenubuilder.exe=d
