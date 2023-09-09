# dotfiles

### Install chezmoi and others

```bash 
sudo pacman -S chezmoi neovim git

sudo apt install chezmoi
```
### Clone the config

```bash
chezmoi init --apply th-herve
// or
chezmoi init --apply th-herve --branch specific-branch
```
### Install the programs

```bash
sudo pacman -S neovim kitty qtile neofetch dmenu rofi

# for ubuntu install nvim with .deb to have last version
sudo apt install kitty qtile neofetch dmenu rofi
```

## Install vim plug

https://github.com/junegunn/vim-plug
