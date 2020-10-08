---
description: Changing where the log file is stored
---

# Variables

We set the path for the log file, which documents progress and errors during updates. If you would like to change the path where the log is stored 'export LOG=add/your/preferred/path/here'. 

```text
# Set the path to the log file
export LOG=~/Desktop/macupdater-log.txt
```

The path makes the script work when we use ****[**Platypus**](../create-app.md) to convert the script into an app.

```text
# Export paths for appification.
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/$"
```

