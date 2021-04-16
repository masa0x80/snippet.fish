function __snippet_fill_in
    set -l cmd (string trim (__snippet_fetch $argv))
    set -l variables

    # Set to `$variables`, only variables that appear for the first time
    for v in (string collect (echo $cmd | grep -o '$[a-zA-Z0-9_]*'))
        contains $v $variables || set -a variables $v
    end

    test (count $variables) != 0 && set_color yellow; echo $cmd
    for v in $variables
        set -l default (eval echo $v)
        set -l variable_name (echo (string sub --start=2 $v))
        set -l tmp_variable_name "__sni_$variable_name"

        # Replace environment variables with those used internally
        set cmd (echo $cmd | sed -e "s/$v/\$$tmp_variable_name/g")

        # Declare internal variables
        set -l set_statement (echo "set $tmp_variable_name '$default'")
        eval "$set_statement"

        # Fetch values interactively
        set -l input (read -c "$default" -p 'set_color grey; echo "$v> "')

        # Store the fetched value in an internal variable
        if test "$input" != ''
          set -l set_statement (echo "set $tmp_variable_name '$input'")
          eval "$set_statement"
        end
    end

    # Escape before `eval`
    # (Don't escape $ because we want to expand the variable)
    set cmd (echo $cmd | sed -e "s|'|\\\\'|g" -e 's|\"|\\\\"|g' -e 's|;|\\\\;|g' -e 's|&|\\\\&|g' -e 's,|,\\\\|,g' -e 's|>|\\\\>|g' -e 's|<|\\\\<|g')

    # Expand internal variables
    set cmd (eval "echo $cmd")
    commandline "$cmd"
end
