#!/bin/bash

echo "[*] Starting auto-zsh-config setup..."

# Update and install essentials
sudo apt update && sudo apt full-upgrade -y
sudo apt install -y zsh git curl unzip net-tools seclists ffuf gobuster sqlmap wafw00f nikto tcpdump python3 python3-pip

# Create CTF directory structure
mkdir -p ~/Desktop/CTF/{Wordlists,Tools,Payloads,Scripts,Notes,Challenges/{Web,Pwn,Crypto,Forensics,OSINT}}

# Copy wordlists
cp /usr/share/wordlists/rockyou.txt.gz ~/Desktop/CTF/Wordlists/
gunzip ~/Desktop/CTF/Wordlists/rockyou.txt.gz
cp -r /usr/share/seclists ~/Desktop/CTF/Wordlists/seclists

# Install Oh-My-Zsh silently
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Add plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Add Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Apply config
cp .zshrc ~/.zshrc
cp .zsh_custom ~/.zsh_custom
echo "[+] Done. Restart terminal or run 'zsh'."
