#envoy -l; or envoy -a /home/julian/.ssh/id_dsa
envoy -pf | source
set -x VISUAL vim

alias parents="pstree -h -s %self"
alias bell='echo \a'
alias gcp="git cherry-pick"

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
