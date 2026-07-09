function ls

    if not set -q LS_COLORS
        and type -q dircolors
        set -gx LS_COLORS (command dircolors -b | string match -r "(?<=LS_COLORS=')[^']+")
    end

    command ls --color=auto $argv
end
