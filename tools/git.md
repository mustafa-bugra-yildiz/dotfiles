# Why Git?

Everything else sucks. I tried:

- Jujutsu
- Mercurial
- Darcs

Jujutsu is a nice CLI for git. Mercurial is used nowhere except for Meta.
So, git it is.

## Setup

```sh
[ ! -f ~/.gitconfig ] && cp gitconfig ~/.gitconfig
[   -f ~/.gitconfig ] && {
  echo "sync: git"
  rm gitconfig
  cp ~/.gitconfig gitconfig
}
```
