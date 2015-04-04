gpg-connect-agent /bye
set -gx SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh

if test $TERM = xterm
    set -gx TERM xterm-256color
end

set -gx NVIM_TUI_ENABLE_TRUE_COLOR 1

set -gx EDITOR nvim
set -gx VGL_FPS 60
set -gx VGL_SPOIL 0
set -gx PRIMUS_SYNC 1

# Prevent wine from creating stuff everywhere
set -gx WINEDLLOVERRIDES winemenubuilder.exe=d
