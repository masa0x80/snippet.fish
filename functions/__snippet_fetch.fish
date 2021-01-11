function __snippet_fetch
    __snippet_list | fzf +m --prompt='Snippets> ' --query "$argv" | cut -d '#' -f 1
end
