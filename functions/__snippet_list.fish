function __snippet_list
    # Merge snippet files and give them a nice format.
    # List files, exclude dotfiles, remove comment lines,
    # and set the file name as a hashtag.
    find $snippets_root -type f | grep -E -v '\/\.[^\/]*$' | xargs grep -H -E '^\b*[^#]' | sed -e 's|:| |' \
      | awk -v pattern="$snippets_root/" ''' \
      {
        sub(pattern, "", $1)
        for (i = 2; i <= NF; i++) {
            if ($i ~ /^#/) sub(/^#/, "\t\t#", $i)
            printf "%s ", $i
        }
        print "\t#"$1
      }'''
end
