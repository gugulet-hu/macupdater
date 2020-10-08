---
description: What the functions do
---

# Functions

The app has three functions: one to check the last update commands for errors, one to create a horizontal line in the log file and the last to open the log file at the end if there has been an error.

## Catcher function

The first function reviews the last update commands for errors. It then prints update complete to the log or shows the error message. It takes module's name as a variable so that it can return a notification that tells you which update module failed. It also sets the Error flag to "1" so that if there has been an error the app will auto-open the log file for the user to inspect.

```text
 catcher () {
if [ "$?" = "0" ]; then
    printf "$1 updates complete." >> $LOG # If no error, print update complete to file.
    printf "" >> $LOG # Add an empty line to the file.
else # If error, show a dialog stating the section where the error occured.
    echo "NOTIFICATION: '$1' updates failed."
    ERROR=1 # Sets variable for error in script to 1.
fi
}
```

## Horizontal line function

This function simply creates a line in the log file to separate the different module sections.

```text
line () {
echo "" >> $LOG # Starts the horizontal line on its own fresh line.
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' - >> $LOG # Prints line
}
```

## Verify function

This function is called after updates have been completed and checks the error flag to see if there has been an error at any point during the running of the app. If an error has been produced the app auto-opens the log for the user to inspect.

```text
verify () {
if [ $ERROR = 1 ]; then
    open $LOG
    echo "NOTIFICATION: Updates completed with some errors."
else
    echo "NOTIFICATION: Updates completed."
fi
}
```

