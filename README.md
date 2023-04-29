# Neovim Config
This is my personal Neovim config for web development.
- [Neovim install from source](#neovim-install-from-source) 
- [Neovim config](#neovim-config)
- [Custom Shortcuts](#custom-shortcuts)

## Requirements
1. Neovim >= 0.8

## Neovim install from source
### Ubuntu
Install build tools
```sh
sudo apt-get install ninja-build gettext cmake unzip curl
```

Clone neovim from repository
```sh
git clone https://github.com/neovim/neovim
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
```sh
git clone https://github.com/schillermann/nvim-config.git ~/.config/nvim
```

## Custom Shortcuts
### Window
Split window horizontal `:split` or vertical `:vspilt`.
#### Navigation
- `Ctrl-h` Jump to left window
- `Ctrl-j` Jump to bottom window
- `Ctrl-k` Jump to top window
- `Ctrl-l` Jump to right window
#### Resize
- `Ctrl-↑` Height increase
- `Ctrl-↓` Height decrease
- `Ctrl-→` Width increase
- `Ctrl-←` Width decrease

### Buffer
#### Navigation
Navigate between open files
- `Shift-l` Height increase
- `Shift-h` Height decrease

## Command overview
Display command list index for visual mode.
```sh
:help visual-index
```
There are more modes like normal, insert, etc. For further information please visit [Neovim mode index doc](https://neovim.io/doc/user/vimindex.html).
