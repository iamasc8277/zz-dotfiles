if status is-interactive
    set -U fish_greeting
    
    if type -q mise
        mise activate fish | source
    else if test -x ~/.local/bin/mise
        ~/.local/bin/mise activate fish | source
    end
    if test -f $HOME/custom.fish
        source $HOME/custom.fish
    end

    set -g fish_prompt_pwd_dir_length 0

    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_showstashstate 1
    set -g __fish_git_prompt_showupstream "verbose"
    set -g __fish_git_prompt_showcolorhints 1
    set -g __fish_git_prompt_use_informative_chars 1

    set -g __fish_git_prompt_char_dirtystate ' ✗'
    set -g __fish_git_prompt_char_untrackedfiles ' ?'
    set -g __fish_git_prompt_char_upstream_ahead ' ↑'
    set -g __fish_git_prompt_char_upstream_behind ' ↓'
    set -g __fish_git_prompt_char_stateseparator ''

    function fish_prompt
        set -l last_status $status
        if not set -q __fish_prompt_initialized
            set -g __fish_prompt_initialized 1
        else
            echo ""
        end
        if test $last_status -ne 0
            set_color red
            echo "❌ $last_status"
            echo ""
        end
        set_color normal
        echo -n "🐟 "
        set_color green
        echo -n $USER
        set_color grey
        echo -n " on "
        set_color blue
        echo -n (prompt_hostname)
        set_color grey
        echo -n " at "
        set_color cyan
        echo -n (prompt_pwd)
        set_color yellow
        fish_git_prompt
        echo "" 
        set_color normal
        echo -n "╰❯ "
        set_color normal
    end
end
