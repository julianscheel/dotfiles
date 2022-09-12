set fish_key_bindings fish_vi_key_bindings

set -x VISUAL vim

set -x GPG_TTY (tty)
set -x XZ_DEFAULTS "-T 0"

alias parents="pstree -h -s %self"
alias bell='echo \a'
alias vim=nvim

function cdc --wraps "mkdir" --description 'Create directory and change into it'
    mkdir $argv[1]; and cd $argv[1]
end

function wlscreenshot --wraps "grim" --description 'Capture screnshot of wayland window'
    grim -g (swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp) $argv[1]
end

# Git convenience
alias g="git"
alias gcp="git cherry-pick"
alias gbs="git bisect"
alias grb="git rebase"
alias gco="git checkout"
alias gvm="vim +/HEAD (git diff --name-only | uniq)"
alias gam="git add (git diff --name-only | uniq)"
alias grh="git reset --hard @{upstream}"

alias gbd="git branch -d"
function gbdr --wraps "git branch -d" --description 'Delete git remote branch'
    git push origin :$argv[1]
end

function gbd! --wraps "git branch -d" --description 'Delete git local and remote branch'
    gbd $argv[1]
    gbdr $argv[1]
end

# Systemd
alias sc="systemctl"

# Project navigation
alias p="cd /nas/projects"
alias b="cd /nas/business\ administration/projects"
alias p2="p; cd 2002-stream-unlimited"
alias b2="b; cd 2002-stream-unlimited"
function p2x --description 'goto stream-unlimited project (fuzzy match)'
    p2
    cd (ls -1 . | grep $argv[1] | head -n1)
end

function px --description 'goto project (fuzzy match)'
    p
    cd (ls -1 . | grep $argv[1] | head -n1)
end

function bx --description 'goto business project (fuzzy match)'
    b
    cd (ls -1 . | grep $argv[1] | head -n1)
end

function b2x --description 'goto business stream-unlimited project (fuzzy match)'
    b2
    cd (ls -1 . | grep $argv[1] | head -n1)
end

alias kapa="open /nas/projects/9000-jusst-internal/02-project-management/resource-planning/(date +%Y)/(date +%yW%V)-resource-planning.pdf"

# Docker/StreamSDK development
alias streamsdk-build-legacy="/home/julian/dev/su/streamsdk-dev-tools/docker/run-legacy -s /home/julian/dev/su/"

# Bitwarden
alias bwunlock "bw unlock | grep export | cut -c 3- | source"
function bwcp --description 'copy bitwarden password'
    if test "$XDG_SESSION_TYPE" = "x11"
        bw get password $argv[1] | xclip -selection clipboard
    else
        bw get password $argv[1] | wl-copy
    end
end

set -l envfile "$HOME/.gnome-keyring.env"
gnome-keyring-daemon --start --components=gpg,ssh,secrets > $envfile
set var_set (cat "$envfile" |  sed -e 's/^\(.*\)/set -x \\1/' -e 's/=/ /' -e 's/\(.*\)$/\1;/')
eval $var_set

# Fix del key in st
switch $TERMINAL
	case 'st'
		#tput smkx
		function fish_enable_keypad_transmit --on-event fish_postexec
			tput smkx
		end

		function fish_disable_keypad_transmit --on-event fish_preexec
			tput rmkx
		end
end

# Dart
set -gx PATH $PATH $HOME/.pub-cache/bin

# Rust
set -gx PATH $PATH $HOME/.cargo/bin

# doc-templates
set -gx PATH $PATH $HOME/git/doc-templates

# lease viewer
set -gx LEASES_URL http://unifi:8082/leases

alias nsdk-run "/home/julian/dev/su/streamsdk-dev-tools/docker/run -s /home/julian/dev/su/"
alias nsdk-run-19.04 "/home/julian/dev/su/streamsdk-dev-tools/docker/run-19.04 -s /home/julian/dev/su/"
alias nsdk-run-20.02 "/home/julian/dev/su/streamsdk-dev-tools/docker/run-20.02 -s /home/julian/dev/su/"
alias nsdk-run-20.03 "/home/julian/dev/su/streamsdk-dev-tools/docker/run-20.03 -s /home/julian/dev/su/"
alias nsdk-run-21.01 "/home/julian/dev/su/streamsdk-dev-tools/docker/run-21.01 -s /home/julian/dev/su/"
alias nsdk-run-21.02 "/home/julian/dev/su/streamsdk-dev-tools/docker/run-21.02 -s /home/julian/dev/su/"
alias nsdk-run-21.03 "/home/julian/dev/su/streamsdk-dev-tools/docker/run-21.03 -s /home/julian/dev/su/"
alias nsdk-run-22.01 "/home/julian/dev/su/streamsdk-dev-tools/docker/run-22.01 -s /home/julian/dev/su/"
alias nsdk-run-22.02 "/home/julian/dev/su/streamsdk-dev-tools/docker/run-22.02 -s /home/julian/dev/su/"
alias nsdk-run-legacy "/home/julian/dev/su/streamsdk-dev-tools/docker/run-legacy -s /home/julian/dev/su/"

# fzf
#fzf_key_bindings
set -x FZF_DEFAULT_COMMAND "fd --type f"
#set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
#set -x FZF_DEFAULT_OPTS "--preview 'bat --style=numbers --color=always {} | head -500'"

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Env setup aliases
alias _xmos "pushd /opt/XMOS/XTC/15.1.4/; bass source SetEnv; popd"
alias _flutter "source ~/env/flutter.fish"
alias _flutter-1.2 "source ~/env/flutter-1.2.fish"
