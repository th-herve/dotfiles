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
# laptop branch
chezmoi init --apply th-herve --laptop-main
```
### Install the other programs

```bash
sudo pacman -S neovim kitty qtile dmenu rofi tmux zsh exa

# for ubuntu install nvim with .deb to have the last version
sudo apt install kitty qtile dmenu rofi tmux zsh exa
```
