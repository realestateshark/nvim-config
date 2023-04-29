# Neovim Config
This is my personal Neovim config for web development.
- [Neovim install from source](#neovim-install-from-source) 
- [Neovim config](neovim-config)

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
git clone https://github.com/schillermann/nvim.git ~/.config/nvim
```
