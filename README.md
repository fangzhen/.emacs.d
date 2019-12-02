# A reasonable Emacs config

This my emacs configuration, running currently on Linux and emacs 26.

The config is originally forked from https://github.com/purcell/emacs.d.git,
but was heavily modified since then and won't sync with it any more.
Thanks very much!

I'll try to minimize the whole config by cleanup configurations and keep
track with latest emacs version without much concern on compatibility.


## Installation

To install, clone this repo to `~/.emacs.d`, i.e. ensure that the
`init.el` contained in this repo ends up at `~/.emacs.d/init.el`:

```
git clone https://github.com/fangzhen/emacs.d.git ~/.emacs.d
```

Upon starting up Emacs for the first time, further third-party
packages will be automatically downloaded and installed.

## Updates

Update the config with `git pull`. You'll probably also want/need to update
the third-party packages regularly too:

<kbd>M-x package-list-packages</kbd>, then <kbd>U</kbd> followed by <kbd>x</kbd>.

## Adding your own customization

To add your own customization, use <kbd>M-x customize</kbd> and/or
create a file `~/.emacs.d/lisp/init-local.el` which looks like this:

```el
... your code here ...

(provide 'init-local)
```

## Programming Language support

- Use LSP if possible
- Use company for completion
- Use ggtags as an alternative for LSP. check `toggle-ggtags-project-wide`

## Detailed configs and tweaks
Check for codes and comments in lisp/
