set fish_key_bindings fish_vi_key_bindings

#envoy -l; or envoy -a /home/julian/.ssh/id_dsa
envoy -pf | source
set -x VISUAL vim

set -x GPG_TTY (tty)

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
