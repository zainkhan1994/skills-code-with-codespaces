#!/bin/bash

# 🚀 Spaceman Dev Environment — Post-Create Setup
sudo apt-get update
sudo apt-get install -y cowsay figlet lolcat
echo "export PATH=\$PATH:/usr/games" >> ~/.bashrc
echo "export PATH=\$PATH:/usr/games" >> ~/.zshrc

# Print a spaceman launch message on first load
# The || fallbacks ensure the script succeeds even if a package failed to install
figlet "LAUNCH!" | lolcat || figlet "LAUNCH!"
cowsay -f tux "Welcome aboard, Spaceman! Your Codespace has reached orbit. 🚀" || echo "Welcome aboard, Spaceman! Your Codespace has reached orbit. 🚀"
