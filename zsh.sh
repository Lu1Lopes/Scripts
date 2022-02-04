#!/bin/bash

sudo apt install zsh -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Tornando o Zsh padrao (Tirando o bash)
# sudo nano /etc/passwd
# Bash:
# usuario:x:1000:1000:usuario:/home/usuario:/usr/bin/bash
# zsh:
# usuario:x:1000:1000:usuario:/home/usuario:/usr/bin/zsh

## Alterando o tema do Oh My zsh:
# sudo nano ~/.zshrc
## Altere: ZSH_THEME = “robbyrussell”