# Git Setup

This repository contains configuration files and scripts to set up your Git environment using symbolic links and custom configuration files.

> ⚠️ **Warning**: This setup requires a couple of sentive files that are not present in this repository, see the `include` and `includeIf` in the [gitconfig](./gitconfig) file.

## Setup Instructions

### .gitconfig

The setup creates a symbolic link from the repository’s [gitconfig](./gitconfig) file to your home directory

```bash
~/.gitconfig
```

This file is responsible for including additional configurations from two external sources:


| File                           | Description       |
| ------------------------------ | ----------------- |
| `~/.config/git/gitconfig-me`   | Personal settings |
| `~/.config/git/gitconfig-mbag` | Company settings  |

Each of these files (`gitconfig-*`) includes user specific information such as name, email, and signing key. Example:

```ini
[user]
    name = Luis Mendes
    email = lmmendes@example.com
    signingkey = ~/.ssh/id_ed25519.pub
```

### Git Aliases

The Git aliases are defined in the [alias](./alias) file and loaded via `.gitconfig`.

This file should be stored at:

```bash
~/.config/git/alias
```


### Global .gitignore

The global [.gitignore](./gitignore) file is located at gitignore and should be symlinked to:

```bash
~/.config/git/gitignore
```

This file is then referenced in `.gitconfig`.


> **Note**: The global `.gitignore` only contains `.DS_Store`. Each repository should maintain its own `.gitignore`. Keeping the global ignore minimal helps avoid conflicts and confusion when collaborating on different projects.


## Usage

To set up everything automatically, run:

```bash
./run.sh # make git
```
