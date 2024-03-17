# dotfiles

## Install chezmoi and git (and neovim if not on debian base)

```bash
# On Arch
sudo pacman -S chezmoi neovim git

# On Debian/Ubuntu
sudo apt install chezmoi git
sh -c "$(curl -fsLS get.chezmoi.io)"
```
## Clone the config

```bash
# To clone the main branch
chezmoi init --apply th-herve
# laptop branch
chezmoi init --apply th-herve --branch "laptop-main"
```
## Install the other programs

### basics

#### arch

Add dmenu or install it from source to patch it

```bash
sudo pacman -S neovim kitty rofi tmux zsh exa fzf
```

#### Ubuntu

Install nvim with .deb to have the lastest version.

```bash
sudo apt install kitty qtile rofi tmux zsh exa fzf
```

### install fonts

Fira Code

```bash
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip && sudo unzip FiraCode.zip -d /usr/share/fonts && rm -f FiraCode.zip
```
Font awsome

```bash
sudo wget https://use.fontawesome.com/releases/v6.5.1/fontawesome-free-6.5.1-desktop.zip && sudo unzip fontawesome-free-6.5.1-desktop.zip -d /usr/share/fonts && rm -f fontawesome-free-6.5.1-desktop.zip
```

### install node

source: https://www.theodinproject.com/lessons/foundations-installing-node-js

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | zsh && export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && nvm install --lts && nvm use --lts
```
If saying `zsh: command not found nvm`, run `bash` to change shell and then: `nvm install --lts && nvm use --lts`

### change shell to zsh

```bash
  # list the available shell
  cat /etc/shells
  chsh # enter password and full path to shell: /usr/bin/zsh
```

### install tpm, tmux pluggin manager

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Then in a tmux session run: prefix + I

#### Install zsh pluggins

```bash
zshPlugDir="$HOME/.config/zsh/plug/"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $zshPlugDir/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $zshPlugDir/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search $zshPlugDir/zsh-history-substring-search
```
