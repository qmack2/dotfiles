# My Personal Config

## Screenshots
Desktop Screenshot
![](/screenshots/qtile/desktop.png)
LaTeX Workspace Screenshot
![](/screenshots/qtile/latex.png)
Alacritty and Macchina Screenshot
![](/screenshots/qtile/terminal.png)

## Installation
Clone this repository and add the folders in `.config` to your local `.config` folder

# Dependencies
## Alacritty
Install Alacritty via:
```bash
sudo pacman -S alacritty
```

In Alacritty, we need Sauce Code Pro Nerd Font. Install it with:
```bash
yay -S nerd-fonts-source-code-pro
```
or from [nerdfonts.com](https://www.nerdfonts.com/font-downloads)

## Dunst
Just install dunst via
```bash
sudo pacman -S dunst
```
## Fish
Make surve neovim and zathura are installed.
```bash
sudo pacman -S neovim zathura zathura-pdf-poppler
```

Install exa as ls alternative:
```bash
sudo pacman -S exa
```

Install shell colorscripts and macchina
```bash
yay -S shell-color-scripts macchina
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

## Qtile
Make sure all autostart applications are installed:
```bash
sudo pacman -S picom light-locker dunst xwallpaper network-manager-applet volumeicon lxsession
```

And then install the SF-Pro font from [here](https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts). Use a [font installation guide](https://medium.com/source-words/how-to-manually-install-update-and-uninstall-fonts-on-linux-a8d09a3853b0) if needed.

And then finally install Qtile and other dependencies:
```bash
sudo pacman -S qtile mypy
```

## Misc
I use autorandr to configure a docked and mobile display. Install it using:
```bash
sudo pacman -S autorandr
```
