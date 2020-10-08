---
description: The Homebrew update module
---

# Brew

{% hint style="info" %}
Homebrew is a package manager for command-line interface packages and applications on macOS. Find out how to install the package manager [**here**](../pre-install.md#install-homebrew-brew).
{% endhint %}

### Understanding the update command

The brew update module is made up of four main parts

* trash -rf $\(brew --cache\) : This deletes the brew cache.
* brew update : This fetches a list of recently updated apps and packages.
* brew upgrade : This runs an update of apps and packages that are installed on your system.
* brew cleanup : This cleans up the brew folder after updates.

```text
# Brew update commands.
{ trash -rf $(brew --cache); echo "Brew"; echo ""; brew update; brew upgrade; brew cleanup; } >> $LOG
catcher Brew
line
```

To add different options to the module read the [**Homebrew documentation**](https://docs.brew.sh/). To disable this module comment out this code above.

