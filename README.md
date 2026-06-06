# bcanozgur/homebrew-tap

Homebrew tap for [QuotaWarmer](https://github.com/bcanozgur/quota-warmer) — a macOS
menu bar app that warms up Claude Code and Codex CLI 5-hour quota windows.

## Install

```sh
brew install --cask bcanozgur/tap/quotawarmer
```

QuotaWarmer is ad-hoc signed but **not Apple-notarized**, so macOS Gatekeeper
quarantines it on download. After installing, clear the quarantine once:

```sh
xattr -dr com.apple.quarantine "/Applications/QuotaWarmer.app"
```

…or right-click **QuotaWarmer.app** in Applications and choose **Open** the first time.

## Update

```sh
brew update
brew upgrade --cask quotawarmer
```

## Uninstall

```sh
brew uninstall --cask quotawarmer       # remove the app
brew uninstall --zap --cask quotawarmer # also remove preferences/caches
```
