# Neovim Config
This is my personal Neovim config for web development.\
The goal is to keep this config clean and easy.

Credit goes to [neovim from scrach](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ) series.

- [Neovim install from source](#neovim-install-from-source) 
- [Neovim config](#neovim-config)
- [Custom Shortcuts](#custom-shortcuts)

## Requirements
1. Neovim >= 0.8

## Neovim install from source
### Ubuntu
Change to the directory, where you want to copy the source files of neovim and clone it from repository.
```sh
sudo apt install git && git clone https://github.com/neovim/neovim
```

Install build tools
```sh
sudo apt-get install ninja-build gettext cmake unzip curl g++
```

Build Neovim
```sh
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
```

Install Neovim
```sh
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
```
[Complete Neovim installation manual](https://github.com/neovim/neovim/wiki/Building-Neovim)

## Neovim config
### Github
```sh
git clone https://github.com/schillermann/nvim-config.git ~/.config/nvim
```
### Activate PHP intelephense LSP
Add your licence key into the following file `USER_FOLDER/intelephense/licence.txt`.

## Nerd Fonts
Pretty popular one is [Hack Fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack).
Download one of the ttf files you want.
Open it and click on install.
Now you have to set the font in the terminal.
Open in the terminal menu preferences and then your profile.
Go to tab text and activate custom font and select your installed font.

## Dependencies
```sh
npm install -g prettier
```

## Custom Shortcuts
- `Ctrl-p` Command Palette

### Auto-Completion
- `Tab` Next suggestion
- `Shift-Tab` Previous suggestion
- `Enter` Confirm suggestion
- `Ctrl-e` Abort suggestions

### Buffer
#### Navigate between open files
- `Tab` Next file
- `Tab-Shift` Previous file

### Code
#### Indent Code
- `>` indent block
- `<` indent block reverse
#### Move Code
- `Alt-k` Move up
- `Alt-j` Move down
#### Comment
- `Ctrl-v` `//` `Esc` Comment
- `Ctrl-v` `x` Uncomment
### LSP
- `Ctrl-o` Jump back
- `Ctrl-i` Jump forward
### Terminal
- `Esc` Toggle to normal mode

### Window
Split window horizontal `:split` or vertical `:vspilt`.
#### Window navigation
Jump between split windows
- `Ctrl-h` Left window
- `Ctrl-j` Bottom window
- `Ctrl-k` Top window
- `Ctrl-l` Right window
#### Window resize
Split window adjust size
- `Ctrl-↑` Height increase
- `Ctrl-↓` Height decrease
- `Ctrl-→` Width increase
- `Ctrl-←` Width decrease

## Command overview
Display command list index for visual mode.
```sh
:help visual-index
```
There are more modes like normal, insert, etc. For further information please visit [Neovim mode index doc](https://neovim.io/doc/user/vimindex.html).
