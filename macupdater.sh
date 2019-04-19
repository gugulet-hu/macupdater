#!/Users/gugulethu/brew/bin/zsh

# This script updates brew, brew cask apps, atom packages, ruby gems, node packages and macOS (including system software) Apps.
# Version 8.0 (19 April, 2019)

# The below are Platypus features for managing UI
echo "PROGRESS:0" # Show the progress bar at 0%
echo "Script starting" # Show this message above the progress bar

# Set the path to the log file
export LOG="/Users/gugulethu/Projects/Programming/push/macupdater/macupdater-log.txt"

echo "NOTIFICATION:Updater starting..." # Send a notification (with logo)

# Export paths for appification.
export PATH="/Users/gugulethu/brew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/$"
export PATH="/Users/gugulethu/brew/sbin:$PATH"

# Function: Reviews the last command for errors. Then prints update complete to log or shows error dialog. Takes section variable.
catcher () {
if [ "$?" = "0" ]; then
    printf "$1 updates complete." >> $LOG # If no error, print update complete to file.
    printf "" >> $LOG # Add a line to file.
else # If error, show a dialog stating the section where the error occured.
    echo "NOTIFICATION:'$1': Updates failed." # Send a notification (with logo)
fi
}

# Function: Creates a horizontal line in the text file.
line () {
echo "" >> $LOG # Starts the horizontal line on its own fresh line.
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' - >> $LOG # Prints line
}

# Writes the header for the log file: Program, Version number, Date and Line.
{ echo "macupdater 6.0"; echo "Log: " `date`; line; } > $LOG

# Brew update commands.
{ echo "Brew"; echo ""; brew update; brew upgrade; brew cleanup; } >> $LOG
catcher Brew
line

echo "PROGRESS:10" # Show the progress bar at 10%
echo "Brew updates complete" # Show this message above the progress bar

# Brew-cask update commands.
{ echo "Brew Cask"; echo ""; brew cu -ayf --cleanup; } >> $LOG
catcher Brew-cask
line

echo "PROGRESS:20" # Show the progress bar at 20%
echo "Brew cask updates complete" # Show this message above the progress bar

# App Store update commands.
{ echo "Apps"; echo ""; mas upgrade; } >> $LOG
catcher Apps

echo "PROGRESS:30" # Show the progress bar at 60%
echo "Mac app store updates complete" # Show this message above the progress bar

# Node update commands.
{ echo "Node"; echo ""; npm install npm@latest -g --silent; npm update --silent; npm prune --silent; } >> $LOG
catcher Node
line

echo "PROGRESS:40" # Show the progress bar at 40%
echo "Node package updates complete" # Show this message above the progress bar

# Ruby update commands. Commented out all as they only work in admin.
# { rvm get latest; } >> $LOG
# rvm cleanup all (don't need this for now)
# { echo "Ruby"; echo ""; gem update --system; gem update; gem cleanup; } >> $LOG
# catcher Ruby
# line

# Atom update commands.
{ echo "Atom"; echo ""; apm update; apm upgrade; apm prune; } >> $LOG
catcher Atom
line

echo "PROGRESS:50" # Show the progress bar at 50%
echo "Atom package updates complete" # Show this message above the progress bar

# Perl update commands. Commented out (don't need updated Perl at the moment)
# { echo "Perl"; echo ""; perlbrew upgrade-perl; perlbrew self-upgrade --silent; perlbrew clean; } >> $LOG
# catcher Perl
# line

# System software update commads.
{ echo "macOS"; echo ""; softwareupdate -ia; } >> $LOG
catcher macOS
line

echo "PROGRESS:60" # Show the progress bar at 60%
echo "macOS updates complete" # Show this message above the progress bar

echo "NOTIFICATION:All local updates complete."

echo "PROGRESS:70" # Show the progress bar at 70%
echo "Local updates complete" # Show this message above the progress bar

# Sets the password variable for the admin account
PASSWD="$(osascript -e 'text returned of (display dialog "Please enter a password to continue" default answer "" with icon stop buttons {"Cancel", "Continue"} default button "Continue" with hidden answer)')"

# An expect script to log into the admin account and run brew updates
/usr/bin/expect -c "spawn login; expect \"Login:\"; send \"mlungisi\r\"; expect \"Password:\"; send \"$PASSWD\r\"; expect \"g:~ mlungisi$\"; send \"{ gem update --system; gem update; gem cleanup; brew update; brew upgrade; brew cleanup; brew cu -ayf --cleanup; }\r\"; expect eof; end"
catcher Admin

echo "" >> $LOG
line

echo "PROGRESS:100" # Show the progress bar at 100%
echo "Script complete" # Show this message above the progress bar
echo "NOTIFICATION:All updates are complete"

# Prints and shows dialog box confirming all updates are done.
printf "All updates complete. END" >> $LOG

echo "QUITAPP"
