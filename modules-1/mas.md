---
description: The Mac App Store update module
---

# mas

{% hint style="info" %}
mas is a command-line interface for the Mac App Store. It allows you to manage application updates from the terminal.

Find out how to install the package manager [**here**](../pre-install.md#install-python-pip).
{% endhint %}

### Understanding the update command

The mas update module consists of one command, which updates all Mac App Store attached applications.

```text
# App Store update commands.
{ echo "Apps"; echo ""; mas upgrade; } >> $LOG
catcher Apps
line
```

To add different options to the module read the [**mas documentation**](https://github.com/mas-cli/mas). To disable this module comment out the code above.

{% hint style="danger" %}
Make sure that you are signed into your Mac App Store account before using this module. 
{% endhint %}

