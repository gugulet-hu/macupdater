#!/Users/gugulethu/brew/bin/zsh

# This script updates brew, brew cask apps, ruby gems, node packages and macOS (including system software) Apps.
# Version 10.0 (18 January 2020)

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

# Set the path to the log file
export LOG=~/Projects/Programming/push/macupdater/macupdater-log.txt

# Export paths for appification.
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/$"

# Function: Reviews the last command for errors. Then prints update complete to log or shows error dialog. Takes section variable.
catcher () {
if [ "$?" = "0" ]; then
    printf "$1 updates complete." >> $LOG # If no error, print update complete to file.
    printf "" >> $LOG # Add a line to file.
else # If error, show a dialog stating the section where the error occured.
    echo "NOTIFICATION: '$1' updates failed."
    ERROR=1 # Sets variable for error in script to 1.
fi
}

# Function: Creates a horizontal line in the text file.
line () {
echo "" >> $LOG # Starts the horizontal line on its own fresh line.
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' - >> $LOG # Prints line
}

# Function: If there has been an error in the script open the log file.
verify () {
if [ $ERROR = 1 ]; then
    open $LOG
    echo "NOTIFICATION: Updates completed with some errors."
else
    echo "NOTIFICATION: Updates completed."
fi
}

# Writes the header for the log file: Program, Version number, Date and Line.
{ echo "macupdater 10.0"; echo "Log: " `date`; line; } > $LOG

# Brew update commands.
{ trash -rf $(brew --cache); echo "Brew"; echo ""; brew update; brew upgrade; brew cleanup; } >> $LOG
catcher Brew
line

# Brew-cask update commands.
{ echo "Brew Cask"; echo ""; brew cu -ayf --cleanup; } >> $LOG
catcher Brew-cask
line

# Push and pull all git remotes.
{ cd Projects/Programming/push/ find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} push \; cd Projects/Programming/pull/; find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \; } >> $LOG
catcher Git-remote
line

# Node update commands.
{ echo "Node"; echo ""; npm install npm@latest -g; npm update; npm prune; } >> $LOG
catcher Node
line

# Ruby update commands.
{ echo "Ruby"; echo ""; gem update --system; gem cleanup; } >> $LOG
catcher Ruby
line

# Perl update commands.
# { echo "Perl"; echo ""; perlbrew self-upgrade; perlbrew upgrade-perl; perlbrew clean; } >> $LOG
# catcher Perl
# line

# Python update commands.
{ echo "Python"; echo ""; pip install -U pip; } >> $LOG
catcher Python
line

# App Store update commands.
{ echo "Apps"; echo ""; mas upgrade; } >> $LOG
catcher Apps
line

# System software update commads.
{ echo "macOS"; echo ""; softwareupdate -ia; } >> $LOG
catcher macOS
line

# Prints and shows dialog box confirming all updates are done.
printf "All updates complete. END" >> $LOG
verify $ERROR

echo "QUITAPP"