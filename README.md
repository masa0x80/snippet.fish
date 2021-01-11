# snippet: Snippets Selector

## Overview

`snippet` is a simple snippet selector for fish-shell.

## Installation

With [fresco]

```
fresco masa0x80/snippet.fish
```

With [fisherman]

```
fisher install masa0x80/snippet.fish
```

### Requirements

- fzf

## Usage

```
Usage: snippet [options] [QUERY]

Options:
  -l, --list    Show all snippets
  -h, --help    Show this help message and exit
```

## Tips

With the following settings, you can use `\cg\t` to invoke `snippet`.

```
bind \cg\t snippet
```

With the following settings,
you can change `$snippet_root` which is root directory to store snippets files.

```
set -gx snippets_root /path/to/dir
```

You can also set multiple directories.

```
set -gx snippets_root /path/to/dir1 /path/to/dir2
```

## License

MIT
