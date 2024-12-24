# dotfiles

## Install stow, git and neovim

```bash
sudo pacman -S stow neovim git
```
> `!!` On debian based distro, install neovim with the .deb from github to have the latest version.

## Clone and apply the config

1. git clone this repo
2. cd into it
3. copy the '.stowrc' into the ~ directory
4. modify the .stowrc in the ~ dir if needed:

```bash
# path of the directory with the config files
--dir=~/dotfiles/
# path of the directory where to set the config file symlink
--target=~
```
If no .stowrc is set, by default it uses the current dir for '--dir' and its parent as the target.

5. apply the config with the `stow .` command. (remove it with stow -D .)

## Install the other programs

Add dmenu or install it from source to patch it

```bash
sudo pacman -S kitty rofi tmux zsh exa fzf
```
> Add sxhkd and rofi if needed
> Get greenclip from its github page

### install fonts

Fira Code

```bash
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip && sudo unzip FiraCode.zip -d /usr/share/fonts && rm -f FiraCode.zip
```
Font awesome

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
