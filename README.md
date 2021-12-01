# nvim-dotfiles
Neovim dotfiles

## Installation

Firstly, a recent version of Neovim is required:

```sh
cd ~/bin
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage
mv nvim.appimage nvim
```

Next, `vim-plug` must be installed:

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Then, this repo can be cloned to the config directory:

```sh
git clone https://github.com/ewpratten/nvim-dotfiles ~/.config/nvim
```

Some plugins also require Node:

```sh
# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
# Reload your environment
# For me: zshreload

# Install Node
nvm install v12
```

Finally, install all plugins in neovim with:

```text
:PlugInstall
:Copilot setup
:CocInstall coc-rust-analyzer
```
