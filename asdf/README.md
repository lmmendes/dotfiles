# asdf - one package manager to rule all

This folder contains scripts and configurations related to the [`asdf`](https://asdf-vm.com/) version manager.

## Installed Plugins

The following `asdf` plugins are installed:

| Language/Tool | Plugin Name | Notes                                                                               |
| ------------- | ----------- | ----------------------------------------------------------------------------------- |
| Java          | `java`      | Use `asdf install java` to manage JDKs from multiple vendors                        |
| Maven         | `maven`     | Java build tool                                                                     |
| Python        | `python`    | For Python versions across projects                                                 |
| Node.js       | `nodejs`    | Supports LTS and current versions                                                   |
| Go            | `golang`    | Used for Go development                                                             |
| Ruby          | `ruby`      | Supports multiple Ruby versions                                                     |
| Terraform     | `terraform` | Infrastructure as code                                                              |
| uv            | `uv`        | Ultra-fast Python package manager ([astral-sh/uv](https://github.com/astral-sh/uv)) |

## Usage

To install the configured tool versions:

```bash
./run.sh # make brew
```
