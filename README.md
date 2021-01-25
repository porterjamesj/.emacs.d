## Emacs configuration

## Usage notes

### Selecting

- To just use what you typed even if it's not a match according to
  selectrum (e.g. for making new files and directories with similar
  names to existing ones), just up `<up>` after you type it, and you
  can select it like any other candidate.

### Straight

- Use `M-x straight-pull-package` to upgrade a package,including
  repositories like MELPA. (There's also `straight-pull-all`)
- Use `M-x straight-get-recipe` to get whatever straight is going to
  use for a package copied to the clipboard
- The straight lockfile is `straight/versions/default.el`
- Use `M-x straight-freeze versions` to write the lockfile, `M-x
  straight-thaw-versions` to restore what's being used to the versions
  in the lockfile

### Magit

- When creating a new branch, you almost always want to use `b s`
  ("new spinoff") rather than `b c` or `b n`, since `b s` assumes you
  want to base your new branch off of the current branch

### Markdown

- Use `C-;` to interactively correct the next misspelled word
