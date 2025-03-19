# Why Zed?
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

So far so good.

## __Fast__
On a good enough hardware this doesn't matter, but I am very sensitive
to latency for some reason.

Elimination:
- Visual Studio Code
- Cursor

## __Online__
I should be able to work with my friends, live.

Elimination:
- Helix
- Sublime Text 4

# Conclusion
I use Zed because everything else sucks.
Not because it is amazing.

# Setup

```sh
echo "Installing zed."
command -v zed>/dev/null || brew install zed

[ ! -d ~/.config/zed ] && {
  echo "New setup found, copying settings."
  mkdir -p ~/.config
  cp -r ~/.config/zed
}

# Sync
[ -f ~/.config/zed/settings.json ] && {
  echo "Sync zed/settings.json"
  cp ~/.config/zed/settings.json config/zed/settings.json
}
```
