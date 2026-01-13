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
    set -g fish_color_autosuggestion cyan
    set -g fish_color_command green
    set -g fish_color_param normal
    set -g fish_color_option normal

    function fish_prompt
        set -l last_status $status
        if not set -q __fish_prompt_initialized
            set -g __fish_prompt_initialized 1
        else
            echo ""
        end
        if test $last_status -ne 0
            set_color red
            echo "⨯ [$last_status]"
            echo ""
        end
        set_color cyan
        echo -n "🐟 "
        echo -n $USER
        echo -n "@"
        echo -n (prompt_hostname)
        echo -n " > "
        echo -n (prompt_pwd)
        fish_vcs_prompt
        echo "" 
        set_color cyan
        echo -n "~> "
        set_color normal
    end
end
