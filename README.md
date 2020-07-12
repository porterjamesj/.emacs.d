## Emacs configuration

## Notes

- Use `M-x straight-pull-package` to upgrade a package,including repositories like MELPA. (There's also `straight-pull-all`)
- Use `M-x straight-get-recipe` to get whatever straight is going to use for a package copied to the clipboard
- The straight lockfile is `straight/versions/default.el`
- Use `M-x straight-freeze versions` to write the lockfile, `M-x straight-thaw-versions` to restore what's being used to the versions in the lockfile