function __snippet_init
    # Set default $snippets_root if not defined.
    if test "$snippets_root" = ''
        set -gx snippets_root $HOME/.snippets.d
        test -d $snippets_root || mkdir -p $snippets_root

        # Make a sample snippet file if $snippets_root is empty.
        if count (ls $snippets_root) == 0
            echo "vi $snippets_root/snippets        # Select me and edit snippets" > $snippets_root/snippets
        end
    end

    # Set default project snippets directory name if not defined.
    if test "$snippet_snippets_root" = ''
        set -gx project_snippets_root .snippets.d
    end
end
