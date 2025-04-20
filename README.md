Simple neovim configuration, based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim/).

Made it to fully understand what goes into kickstart, and to better understand neovim.

Tweaked some things for my needs, probably not universal config.

## Requirements
- git
- make
- gcc
- ripgrep
- nerdfont
- npm
- python

on linux:
- clipboard tool
- unzip

on windows:
- if using pwsh:
    - NO_COLOR env variable
- pwsh(powershell 7), just do it

- TODO: add the rest, as I've probably missed something

## Notes
All of the features have been tested on Windows.
Linux/WSL was only tested to some extend.

## Installation (from kickstart.nvim)
Windows:
    cmd: 
        `git clone https://github.com/nvim-lua/kickstart.nvim.git "%localappdata%\nvim"`
    pwsh: 
        'git clone https://github.com/nvim-lua/kickstart.nvim.git "${env:LOCALAPPDATA}\nvim"'
Linux:
    `git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim`

