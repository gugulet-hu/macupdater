![macupdater logo](https://gugulet.hu/site/wp-content/uploads/macupdater-logo-1200x600-1.png)

[![License: MIT](https://img.shields.io/badge/License-MIT-red.svg)](https://opensource.org/licenses/MIT)

Package managment on macOS is a challenge. This is my amateurish attempt to combine all my package updates into one app. This app updates brew, brew cask apps, apm packages, ruby gems, rvm, npm packages and macOS (including system software) Apps. Note: the app only runs in admin account as it needs admin privileges.

## Before you start

This app relies on [alerter](https://github.com/vjeantet/alerter) for its notifications, so install that before you get started.

## Packages supported

-    [Brew](https://brew.sh/)
-    [Brew Casks](https://github.com/buo/homebrew-cask-upgrade)
-    [npm](https://www.npmjs.com/)
-    Ruby
-    Python [(pip)](https://github.com/pypa/pip)
-    [mas](https://github.com/mas-cli/mas)
-    macOS software updates

## Editing the script

Editing the script requires some scripting know how, but it is documented. Here's a quick guide on how to customise it for your needs.

### Preamble

In the preamble we get sudo rights and ask for the password to ensure everything that follows runs smoothly.

```shell
# Ask for the password up-front
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
```

And then we start the script by prompting the user.

```shell
# Open an alert that requires the user the click RUN to start the process.
ANSWER=$(./alerter -message "Run an update?" -actions Run -title macupdater -timeout 10  -sound default)

# Check the response from the alert and close if it is anything  but RUN.
if [ $ANSWER = "@TIMEOUT" ]; then
    echo "NOTIFICATION: Update process exited."
    exit
elif [ $ANSWER = "@CLOSED" ]; then
    exit
else
    echo "NOTIFICATION: Updater starting..." # Send a notification (with logo)
fi
```

### Set variables

We set the path for the log file, which documents errors and progress. The path makes the script work when we use Platypus to convert it into an app.

```shell
# Set the path to the log file
export LOG=~/Desktop/macupdater-log.txt

# Export paths for appification.
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/$"
```

### Functions

The app has three functions: one to check the last update commands for errors, one to create a horizontal line in the log file and the last to open the log file at the end if there has been an error. I won;t go itno the functions here. You can read their comments in the file.

### Update commands

Lastly we have the update modules themselves for each package manager. Below is the update command for Homebrew. First it clears the Brew cache, then updates the log file, then runs updates, then upgrades, then cleanup. All of this is logged to the file (>> \$LOG). Then we call the catcher function to see if there have been any errors. And finally add a line to the log to seperate this from the next update section. You can add your won package managers in this fashion or remove some of the ones I have.

```shell
# Brew update commands.
{ trash -rf $(brew --cache); echo "Brew"; echo ""; brew update; brew upgrade; brew cleanup; } >> $LOG
catcher Brew
line
```

### Creating the app

I use [Platypus](https://github.com/sveinbjornt/platypus) to convert the script into an application for macOS. You are welcome to run this purely as a shell script. This is very much a work in progress, so feel free to tinker.

### Problems

The biggest problem I have right now is that this app needs to be run as an admin user. I prefer to use a non-admin account day-to-day so I'm going to have to tackle the run as another user problem soon. Running as a non-admin causes the brew and brew-cask updates to fail.

## License

All the works are available under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
