---
description: The RubyGems update module
---

# RubyGems

{% hint style="info" %}
Gems is the package manager for Ruby packages on macOS.
{% endhint %}

### Understanding the update command

The RubyGems update module consists of three commands:

* gem update --system : This upgrades gem and its packages. 
* gem cleanup : This cleans up the gem packages folder.

```text
# Ruby update commands.
{ echo "Ruby"; echo ""; gem update --system; gem cleanup; } >> $LOG
catcher Ruby
line
```

To add different options to the module read the [**RubyGems documentation**](https://guides.rubygems.org/rubygems-basics/). To disable this module comment out the code above.

