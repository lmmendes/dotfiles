# Homebrew

This folder contains configurations and scripts to manage and install macOS software using [Homebrew](https://brew.sh/) a package manager for macOS.

## What It Installs

The [`Brewfile`](./Brewfile) is organized into sections and used to install:

- Command-Line Tools: `git`, `awscli`,  `kind`, `yq`, ...
- Desktop Applications: `zed`, `firefox`, `pbsidian`, ...
- VSCode Extensions: `GitHub Copilot`, `pylance`, ...
- Experimental & Lab Tools: `jj`, `bruno`, `zotero`

> At the bottom of the Brewfile you can find the **Labs** section, a curated list of tools I'm experimenting with. These might not be part of my daily workflow but are worth exploring.

## Usage

To apply this setup on a new machine:

```bash
./run.sh # make brew
```
