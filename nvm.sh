#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

bash # In order to install nvm lts we must open a new terminal

nvm install --lts

### Checking NVM and Node version:

node --version
npm --version

### To see all other NVM versions:

nvm ls-remote

### To Install some other version:

nvm install v15.6.0

### To see all version installed in the machine:

nvm ls

### Swtching to another version:

nvm use v14.15.4

### NVM on Zsh (.zsh)

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
