# dotfiles

### Install chezmoi and git (and neovim if not on debian base)

```bash
# On Arch
sudo pacman -S chezmoi neovim git

# On Debian/Ubuntu
sudo apt install chezmoi git
sh -c "$(curl -fsLS get.chezmoi.io)"
```
### Clone the config

```bash
# To clone the main branch
chezmoi init --apply th-herve
# or for a specific branch
chezmoi init --apply th-herve --branch specific-branch
```
### Install the others programs

```bash
sudo pacman -S neovim kitty qtile dmenu rofi tmux

# for ubuntu install nvim with .deb to have the last version
sudo apt install kitty qtile dmenu rofi tmux
```

## Install vim plug

https://github.com/junegunn/vim-plug
