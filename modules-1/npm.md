---
description: The npm update module
---

# npm

{% hint style="info" %}
Node package manager is the default package manager for JavaScript.

Find out how to install the package manager [**here**](../pre-install.md#install-homebrew-cask-upgrade-brew-cu).
{% endhint %}

### Understanding the update command

The npm update module consists of three commands:

* npm install npm@latest -g : This upgrades npm itself. The -g flag means it updates the global npm \(i.e. for all users\).
* npm update : This updates the packages you have installed.
* npm prune: This prunes all unused packages to save space.

```text
# Node update commands.
{ echo "Node"; echo ""; npm install npm@latest -g; npm update; npm prune; } >> $LOG
catcher Node
line
```

To add different options to the module read the [**npm documentation**](https://docs.npmjs.com/). To disable this module comment out the code above.

