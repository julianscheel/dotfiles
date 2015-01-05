function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    set_color $fish_color_user
    echo -n -s "$USER"

    set_color normal
    echo -n -s @

    set_color $fish_color_host
    echo -n -s "$__fish_prompt_hostname"

    set_color normal
    echo -n -s ' '

    set_color $fish_color_cwd
    echo -n -s (prompt_pwd) (__fish_git_prompt)

    if test $last_status -ne 0
        set_color normal
        echo -n -s ' '

        set_color $fish_color_status
        echo -n -s "[$last_status]"
    end

    set_color normal
    echo -n -s '> '
end
