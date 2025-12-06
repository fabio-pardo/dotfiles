# Dotfiles managed with chezmoi

### Installation
```bash
brew bundle install --file="~/.config/homebrew/Brewfile"

# MCHub
nvm install node
npm install -g mcp-hub@latest

# VectorCode
pyenv install 3.13.1
pyenv local 3.13.1
uv tool install "vectorcode<1.0.0"
```

### Common commands

**Edit a config file:**
```bash
chezmoi edit <file>
```

**Apply changes:**
```bash
chezmoi apply
```

**See what would change (dry run):**
```bash
chezmoi diff
```

**Update dotfiles from source:**
```bash
chezmoi update
```

**Add a new file to chezmoi:**
```bash
chezmoi add <file>
```

**Check status:**
```bash
chezmoi status
```

**New generated Brewfile**
```bash
brew bundle dump --file=~/.config/homebrew/Brewfile --force
```
