# SSH Configuration

> ⚠️ **Warning**: This setup depends on several sensitive files that are not included in this repository. See the Include statements in the [config](./config) file for details.

The main SSH configuration is defined in the [config](./config) file. This file uses `Include` directives to load additional configuration files from your local machine.

Each included file corresponds to a specific project or context, and defines SSH settings for related hosts. Here's an example of one such file:

```
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
  IdentitiesOnly yes
```

This structure helps me keep the SSH config modular and easier to manage across personal, work, and project-specific setups.
