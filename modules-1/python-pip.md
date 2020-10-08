---
description: The Python pip update module
---

# Python pip

{% hint style="info" %}
Pip is the package manager for python on macOS.

Find out how to install the package manager [**here**](../pre-install.md#install-python-pip).
{% endhint %}

### Understanding the update command

The pip update module consists of one command, which updates pip and its packages.

```text
# Python update commands.
{ echo "Python"; echo ""; pip install -U pip; } >> $LOG
catcher Python
line
```

To add different options to the module read the [**pip documentation**](https://pip.pypa.io/en/stable/). To disable this module comment out the code above.



