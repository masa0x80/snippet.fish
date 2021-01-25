function __snippet_list
    set -l dirs $snippets_root

    # If you are in a project directory under git control,
    # add a project snippets directory to the search targets.
    set -l git_flag (git rev-parse --is-inside-work-tree 2>/dev/null)
    if test "$git_flag" = 'true'
        set -a dirs $project_snippets_root
    end

    # Merge snippet files and give them a nice format.
    # List files, exclude dotfiles, remove comment lines,
    # and set the file name as a hashtag.
    for dir in $dirs
        find $dir -type f | grep -E -v '\/\.[^\/]*$' | xargs grep -H -E '^\b*[^#]' | sed -e 's|:| |' \
          | awk -v pattern="$dir/" ''' \
          {
            sub(pattern, "", $1)
            for (i = 2; i <= NF; i++) {
                if ($i ~ /^#/) sub(/^#/, "\t\t#", $i)
                printf "%s ", $i
            }
            print "\t#"$1
          }'''
    end
end
