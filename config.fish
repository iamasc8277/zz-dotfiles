if status is-interactive
    set -U fish_greeting "🐟 $version"

    if type -q mise
        mise activate fish | source
    else if test -x ~/.local/bin/mise
        ~/.local/bin/mise activate fish | source
    end
    if test -f $HOME/custom.fish
        source $HOME/custom.fish
    end

    function add_newline_before_prompt --on-event fish_prompt
        echo ""
    end
end
