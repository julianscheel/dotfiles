gpg-connect-agent /bye
set -gx SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh

set -gx EDITOR vim
set -gx VGL_FPS 60
set -gx VGL_SPOIL 0
set -gx PRIMUS_SYNC 1

# Prevent wine from creating stuff everywhere
set -gx WINEDLLOVERRIDES winemenubuilder.exe=d