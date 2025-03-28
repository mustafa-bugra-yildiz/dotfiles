# Why Neovim?
Below, you will find an incomplete list of editors I have used:

Old:
- Plain vi
- Vim
- NeoVim
- Emacs
- Notepad++

Weird but cool:
- Kakoune
- Helix

Fast but ugly:
- Sublime Text 4
- Zed

Slow but ok:
- JetBrains X (almost all of them)
- Visual Studio Code
- Cursor

Stupid:
- Visual Studio

Almost all them lacked something. My requirements were simple:

## __Works OOTB__
I couldn't care less about setting things up.

Elimination:
- Plain vi
- Vim
- NeoVim
- Emacs
- Notepad++
- Kakoune

## __Simple UI__
I want it as complicated as I care.

Elimination:
- Visual Studio
- JetBrains X

## __Fast__
On a good enough hardware this doesn't matter, but I am very sensitive
to latency for some reason.

Elimination:
- Visual Studio Code
- Cursor

## __Extensible__
I need good extensions.

Elimination:
- Helix
- Sublime Text 4
- Zed

## Conclusion
You may have noticed that after all this, I am left with nothing.
That is, everything sucks. I just make sure my Neovim config doesn't
bother me much.

## Setup

```sh
command -v nvim >/dev/null || {
  echo "Installing neovim."
  brew install neovim
}

[ ! -d ~/.config/nvim ] && cp -r nvim ~/.config/nvim
[   -d ~/.config/nvim ] && {
  echo "sync: neovim"
  rm -rf nvim
  cp -r ~/.config/nvim nvim
}
```
