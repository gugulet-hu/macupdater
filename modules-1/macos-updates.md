---
description: The macOS update module
---

# macOS updates

{% hint style="info" %}
The macOS update command is a built-in command-line interface to update the operating system.
{% endhint %}

### Understanding the update command

The mas update module consists of one command, with two flags:

* -i : This flag requests an install of updates.
* -a : This flag specifies that all updates should be installed.

```text
# System software update commads.
{ echo "macOS"; echo ""; softwareupdate -ia; } >> $LOG
catcher macOS
line
```

To disable this module comment out the code above.

