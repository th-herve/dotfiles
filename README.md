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
### change shell to zsh
```bash
  # list the available shell
  cat /etc/shells
  chsh # enter password and full path to shell: /usr/bin/zsh
```
### Install the other programs

```bash
sudo pacman -S neovim kitty qtile dmenu rofi tmux zsh exa fzf

# for ubuntu install nvim with .deb to have the lastest version
sudo apt install kitty qtile dmenu rofi tmux zsh exa fzf

# install nerd fonts
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip && sudo unzip FiraCode.zip -d /usr/share/fonts && rm -f FiraCode.zip

# install node, source: https://www.theodinproject.com/lessons/foundations-installing-node-js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && nvm install --lts && nvm use --lts

# install tpm tmux pluggin manager

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# then in a tmux session run: prefix + I
```
