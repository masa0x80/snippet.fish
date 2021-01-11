function snippet
    argparse -n snippet 'l/list' 'h/help' -- $argv || return

    set -l buffer $argv
    test "$buffer" = '' && set buffer (commandline)

    __snippet_init

    if set -q _flag_list
        __snippet_list
    else if set -q _flag_help
        __snippet_help
    else
        __snippet_fill_in $buffer
    end
end
