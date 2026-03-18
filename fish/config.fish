set fish_key_bindings fish_vi_key_bindings
fish_helix_key_bindings

set -x GPG_TTY (tty)
set -x XZ_DEFAULTS "-T 0"

alias parents="pstree -h -s %self"
alias bell='echo \a'
alias vim=nvim

# Sync helix and hx aliases based on what is installed
if type -q helix; and not type -q hx
    alias hx='helix'
else if type -q hx; and not type -q helix
    alias helix='hx'
end

alias ls='eza -b --hyperlink'
alias tree='eza -b --hyperlink --tree'

# Silence fish greeting
set fish_greeting

function cdc --wraps mkdir --description 'Create directory and change into it'
    mkdir $argv[1]; and cd $argv[1]
end

function wlscreenshot --wraps grim --description 'Capture screnshot of wayland window'
    grim -g (swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp) $argv[1]
end

function deccanlog --description 'View a deccan log export in systemd json format'
    fx $argv[1] 'x => `${new Date(x.__REALTIME_TIMESTAMP / 1e3)} ${x._COMM} [${x._PID}]: ${x.MESSAGE}`'
end

# Git convenience
alias g="git"
alias gbs="git bisect"

alias grb="git rebase"
alias grm="git rebase master"
alias grc="git rebase --continue"

alias gr="git commit"
alias ga="git commit --amend"
alias gas="git commit --amend -s"

alias gdc="git diff --cached"

alias gsw="git switch"
alias grs="git restore"

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
alias streamsdk-build-legacy="$HOME/dev/su/streamsdk-dev-tools/docker/run-legacy -s $HOME/dev/su/"

# Bitwarden
function bwcp --description 'copy bitwarden password'
    argparse 'f/field=' -- $argv

    if set -ql _flag_field
        rbw get -f $_flag_field $argv[1] --clipboard
    else
        rbw get $argv[1] --clipboard
    end
end

# Fix del key in st
switch $TERMINAL
    case st
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
set -gx PATH $PATH /usr/lib/rustup/bin

# doc-templates
set -gx PATH $PATH $HOME/git/doc-templates

# lease viewer
set -gx LEASES_URL http://unifi:8082/leases

alias nsdk-run "$HOME/dev/su/streamsdk-dev-tools/docker/run -s $HOME/dev/su/"
alias nsdk-run-19.04 "$HOME/dev/su/streamsdk-dev-tools/docker/run-19.04 -s $HOME/dev/su/"
alias nsdk-run-20.02 "$HOME/dev/su/streamsdk-dev-tools/docker/run-20.02 -s $HOME/dev/su/"
alias nsdk-run-20.03 "$HOME/dev/su/streamsdk-dev-tools/docker/run-20.03 -s $HOME/dev/su/"
alias nsdk-run-21.01 "$HOME/dev/su/streamsdk-dev-tools/docker/run-21.01 -s $HOME/dev/su/"
alias nsdk-run-21.02 "$HOME/dev/su/streamsdk-dev-tools/docker/run-21.02 -s $HOME/dev/su/"
alias nsdk-run-21.03 "$HOME/dev/su/streamsdk-dev-tools/docker/run-21.03 -s $HOME/dev/su/"
alias nsdk-run-22.01 "$HOME/dev/su/streamsdk-dev-tools/docker/run-22.01 -s $HOME/dev/su/"
alias nsdk-run-22.02 "$HOME/dev/su/streamsdk-dev-tools/docker/run-22.02 -s $HOME/dev/su/"
alias nsdk-run-23.03 "$HOME/dev/su/streamsdk-dev-tools/docker/run-23.03 -s $HOME/dev/su/"
alias nsdk-run-legacy "$HOME/dev/su/streamsdk-dev-tools/docker/run-legacy -s $HOME/dev/su/"

# fzf
#fzf_key_bindings
set -x FZF_DEFAULT_COMMAND "fd --type f"
#set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
#set -x FZF_DEFAULT_OPTS "--preview 'bat --style=numbers --color=always {} | head -500'"

# zoxide
zoxide init fish | source

# setup theme
tinty init

# Env setup aliases
alias _xmos "pushd /opt/XMOS/XTC/15.3.1/; bass source SetEnv; popd"

# fvm flutter version managemant
set -x PATH "$PATH:$HOME/fvm/default/bin"

if type -q micromamba

    # >>> mamba initialize >>>
    # !! Contents within this block are managed by 'mamba init' !!
    set -gx MAMBA_EXE /usr/bin/micromamba
    set -gx MAMBA_ROOT_PREFIX $HOME/micromamba
    $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
    # <<< mamba initialize <<<

end
