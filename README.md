# macOS .files

This repository contains my personal macOS dotfiles. I'm sharing them publicly to:

- Make it easier for me to reuse across machines
- Get feedback from others on the tools and configurations I'm using

> ⚠️ **Warning**: These dotfiles will not work out-of-the-box on your machine. Some files reference secrets or sensitive configuration stored elsewhere to avoid accidental publication.


## Makefile Targets Overview

| Target    | Description                          | How to Run     |
| --------- | ------------------------------------ | -------------- |
| `asdf`    | Sets up `asdf` version manager       | `make asdf`    |
| `brew`    | Installs packages using Homebrew     | `make brew`    |
| `zsh`     | Configures your Zsh shell            | `make zsh`     |
| `ssh`     | Sets up SSH-related configuration    | `make ssh`     |
| `git`     | Applies Git configurations           | `make git`     |
| `ghostty` | Sets up Ghostty terminal preferences | `make ghostty` |

> Each target runs the corresponding `run.sh` script located in its respective folder, after ensuring it has execute permissions.

## How to Use

1. Clone your dotfiles repository:

    ```bash
    git clone https://github.com/your-username/dotfiles.git
    cd dotfiles
    ```
2. Run the setup targets as needed. For example:

    ```bash
    make brew     # Install Homebrew packages
    make zsh      # Set up your Zsh environment
    ```

3. You can run individual parts selectively or chain them:

```bash
make brew asdf git
```

## Known Issues

- **[broken]** `asdf-alias` plugin no longer works

    I was using [asdf-alias](https://github.com/andrewthauer/asdf-alias) to manage multiple runtime versions. However, upgrading to asdf v0.16 broke compatibility. More details are available in [this GitHub issue](https://github.com/andrewthauer/asdf-alias/issues/13).
