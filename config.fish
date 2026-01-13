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
        echo -n "@"
        set_color blue
        echo -n (prompt_hostname)
        set_color grey
        echo -n ": "
        set_color cyan
        echo -n (prompt_pwd)
        set_color yellow
        fish_vcs_prompt
        echo "" 
        set_color normal
        echo -n "~> "
        set_color normal
    end
end
