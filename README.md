## Emacs configuration

## Usage notes

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
