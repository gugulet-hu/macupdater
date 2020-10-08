---
description: How to add an update module
---

# Adding a module

## Basic structure

```text
# Module name
{ echo "Module/name"; echo ""; update/command/here; another/update/command/here; cleanup/command/here; } >> $LOG
catcher module/name
line
```

To add an update module follow the basic structure of:

* First echo the name of the module so that it is placed into the log file.
* Echo a blank line.
* Add commands to update packages. Make sure to separate the commands with a semi-colon.
* All the error messages produced by the commands between the parentheses will be piped to the log file \(by &gt;&gt;$LOG\). 
* Call the [**Catcher function**](../preamble/functions.md#catcher-function) and pass the module's name to it.
* Add a line to end the section in the log file.

