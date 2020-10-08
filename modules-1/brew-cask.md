---
description: The Homebrew cask update module
---

# Brew cask

{% hint style="info" %}
This extension of Homebrew allows you to update macOS applications installed using Homebrew. 

Find out how to install the package manager [**here**](../pre-install.md#install-homebrew-cask-upgrade-brew-cu).
{% endhint %}

### Understanding the update command

The brew-cask update module consists of one command \(brew cu\) with multiple flags:

* -a : Update all out of date applications
* -y : Silently answer 'yes' to update prompts
* -f : Update all applications to their latest versions
* --no-quarantine : Disable macOS Gatekeeper on this app
* --cleanup : Clean up the cask folder when

```text
# Brew-cask update commands.
{ echo "Brew Cask"; echo ""; brew cu -ayf --no-quarantine --cleanup; } >> $LOG
catcher Brew-cask
line
```

To add different options to the module read the [**Homebrew cask documentation**](https://github.com/buo/homebrew-cask-upgrade). To disable this module comment out the code above.

