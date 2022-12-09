# My Personal Dotfiles
Dotfiles for window managers AwesomeWM, Qtile, and XMonad. Go to the
configuration directories of each window manager to see screenshots.

# Installation
Detailed install instructions can be found in the configuration directories of each
window manager.

# Dependencies
## Kitty
Install Kitty with:
```bash
sudo pacman -S kitty
```

## Alacritty
Install Alacritty via:
```bash
sudo pacman -S alacritty
```

## dmenu
Install dmenu with:
```sh
sudo pacman -S dmenu
```

Then after cloning this repository, cd into dmenu_*one-of-the-colorschemes* and
run:
```sh
sudo make install
```

## Fish
Make sure neovim and zathura are installed.
```bash
sudo pacman -S neovim zathura zathura-pdf-poppler
```

Install exa as ls alternative:
```bash
sudo pacman -S exa
```

Install the starship prompt.
```sh
curl -sS https://starship.rs/install.sh | sh
```

## Neovim
Make sure vim-plug is installed for neovim. [Installation guide](https://github.com/junegunn/vim-plug).

Then run `:PlugInstall`. 

Make sure you run the `:CheckHealth` command and install any missing required dependencies.

Finally, we need the texlab language server. It can be found and installed [here](https://github.com/latex-lsp/texlab). Or, use the following install script:
```sh
cargo install --git https://github.com/latex-lsp/texlab.git --locked
```

## Fonts
Install the Rubik font from your package manager, or from [here](https://fonts.google.com/specimen/Rubik?query=rubik&category=Sans+Serif). Use a [font installation guide](https://medium.com/source-words/how-to-manually-install-update-and-uninstall-fonts-on-linux-a8d09a3853b0) if needed.


Install Jetbrains Mono Nerd Font from [nerdfonts.com](https://www.nerdfonts.com/font-downloads) or from your package manager if applicable.

## Misc
I use autorandr to configure a docked and mobile display. Install it using:
```bash
sudo pacman -S autorandr
```

