# Dotfiles managed with chezmoi

### Installation
```bash
brew bundle install --file="~/.config/homebrew/Brewfile"
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
