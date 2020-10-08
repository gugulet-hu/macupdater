---
description: Changing where the log file is stored and getting admin privileges
---

# Variables and Sudo

## Variables

### Log path

We set the path for the log file, which documents progress and errors during updates. If you would like to change the path where the log is stored 'export LOG=add/your/preferred/path/here'. 

```text
# Set the path to the log file
export LOG=~/Desktop/macupdater-log.txt
```

### Preparing for app creation

The path variable below makes the script work when we use ****[**Platypus**](../create-app.md) to convert the script into an app.

```text
# Export paths for appification.
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/$"
```

## Sudo rights

Before the updates we get sudo rights and ask for the password to ensure that the processes that follow runs smoothly. Without this some package managers throw up errors when trying to install packages.

```text
# Ask for the password up-front
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
```

