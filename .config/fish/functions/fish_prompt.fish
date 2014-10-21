function fish_prompt
    and set retc blue; or set retc red

    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end
    set __fish_prompt_tty (tty|cut -c6-)
    set __fish_prompt_text "-($USER@$__fish_prompt_hostname:$__fish_prompt_tty)--()-"
    set __fish_prompt_width (echo -n $__fish_prompt_text|wc -c)
    set __fish_prompt_dirwidth (math $COLUMNS - $__fish_prompt_width - 4)
    set __fish_prompt_curdir (pwd|sed "s=$HOME=~=;s=^.*\(.\{$__fish_prompt_dirwidth\}\)\$=...\\1=")
    set __fish_prompt_curdir_width (echo -n $__fish_prompt_curdir|wc -c)
    set __fish_prompt_fillerwidth (math $COLUMNS - $__fish_prompt_curdir_width - $__fish_prompt_width - 1)
    if test $__fish_prompt_fillerwidth -gt 0
        set __fish_prompt_filler (echo -n '-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'|cut -c1-$__fish_prompt_fillerwidth)
    end

    set_color $retc
    echo -n '-('
    
    if [ $USER = root ]
        set_color -o red
    else
        set_color -o yellow
    end
    echo -n $USER
    set_color -o blue
    echo -n @
    if [ -z "$SSH_CLIENT" ]
        set_color -o yellow
    else
        set_color -o cyan
    end
    echo -n $__fish_prompt_hostname
    set_color -o blue
    echo -n :
    set_color -o white
    echo -n $__fish_prompt_tty
    set_color $retc
    echo -n ')-'

    set_color yellow
    if test $__fish_prompt_fillerwidth -gt 0
        echo -n $__fish_prompt_filler
    end
    set_color $retc
    echo -n '-('

    set_color yellow
    echo -n $__fish_prompt_curdir

    set_color $retc
    echo -n ')-'

    echo
    set_color $retc
    echo -n '-('
    set_color yellow
    echo -n (date +%H:%M)

    set_color $retc
    echo -n ':'

    set_color -o white

    if [ $USER = root ]
        echo -n '#'
    else
        echo -n '$'
    end

    set_color $retc
    echo -n ')- '
end

function fish_right_prompt
    and set retc blue; or set retc red

    if git status >/dev/null ^/dev/null
	set_color $retc
	echo -n '-('

        set_color green
        if not test (git status | tail -1) = "nothing to commit, working directory clean"
            set_color red -o
        end
        echo -n (git branch | grep '*' | cut -c3-)

	set_color $retc
	echo -n ')- '
    end

end
