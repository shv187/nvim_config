Simple neovim configuration, based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim/).

Made it to fully understand what goes into kickstart, and to better understand neovim.

Tweaked some things for my needs, probably not universal config.

## Requirements
- `git`
- `make`
- `gcc`
- `ripgrep`
- some `nerdfont`
- `npm`
- `python`

on linux:
- `clipboard tool`
- `unzip`

on windows:
- if using `pwsh`:
    - `NO_COLOR` env variable
- `pwsh`(powershell 7), just do it

- TODO: add the rest, as I've probably missed something

## Notes
All of the features have been tested on Windows.
Linux/WSL was only tested to some extend.

## Installation (from kickstart.nvim)
<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/shv187/nvim_config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```
git clone https://github.com/shv187/nvim_config.git "%localappdata%\nvim"
```

If you're using `powershell.exe`

```
git clone https://github.com/shv187/nvim_config.git "${env:LOCALAPPDATA}\nvim"
```

</details>
