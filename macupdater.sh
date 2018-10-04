#!/bin/sh
# This script updates brew, brew cask apps, ruby gems, rvm, npm packages and macOS (including system software) Apps.
# Version 6.3 (23 September, 2018)

# Function: Reviews the last command for errors. Then prints update complete to log or shows error dialog. Takes section variable.
catcher () {
if [ "$?" = "0" ]; then
    printf "$1 updates complete." >> ~/Projects/Programming/macupdater/macupdater-log.txt # If no error, print update complete to file.
    printf "" >> ~/Projects/Programming/macupdater/macupdater-log.txt # Add a line to file.
else # If error, show a dialog stating the section where the error occured.
    osascript -e 'display notification "'$1': Script encountered errors." with title "MacUpdater"' 
fi
}

# Function: Creates a horizontal line in the text file.
line () {
echo "" >> ~/Projects/Programming/macupdater/macupdater-log.txt # Starts the horizontal line on its own fresh line.
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' - >> ~/Projects/Programming/macupdater/macupdater-log.txt # Prints line
}

# Writes the header for the log file: Program, Version number, Date and Line.
{ echo "macupdater 6.0"; echo "Log: " `date`; line; } > ~/Projects/Programming/macupdater/macupdater-log.txt

# Brew update commands.
{ echo "Brew"; echo ""; brew update; brew bundle dump --force; brew bundle -verbose; brew cleanup; brew prune; } >> ~/Projects/Programming/macupdater/macupdater-log.txt
catcher Brew
line

# Brew-cask update commands. Functionality replaced by brew bundle.
# { echo "Brew Cask"; echo ""; brew cu -ay --cleanup; brew cask cleanup; } >> ~/Projects/Programming/macupdater/macupdater-log.txt
# catcher Brew-cask
# line

# App Store update commands. Functionality replaced by brew bundle.
# { echo "Apps"; echo ""; mas upgrade; } >> ~/Projects/Programming/macupdater/macupdater-log.txt
# catcher Apps

# Node update commands.
{ echo "Node"; echo ""; npm install npm@latest -g --silent; npm update --silent; npm prune --silent; } >> ~/Projects/Programming/macupdater/macupdater-log.txt
catcher Node
line

# Ruby update commands. Commented out RVM update (takes too long and not necessary).
# { rvm get latest; } >> ~/Projects/Programming/macupdater/macupdater-log.txt
# rvm cleanup all (don't need this for now)
{ echo "Ruby"; echo ""; ; gem update --system; gem update; gem cleanup; } >> ~/Projects/Programming/macupdater/macupdater-log.txt
catcher Ruby
line

# Perl update commands. Commented out (don;t need uopdated Perl at the moment)
# { echo "Perl"; echo ""; perlbrew upgrade-perl; perlbrew self-upgrade --silent; perlbrew clean; } >> ~/Projects/Programming/macupdater/macupdater-log.txt
# catcher Perl
# line

# System software update commads.
{ echo "macOS"; echo ""; softwareupdate -ia; } >> ~/Projects/Programming/macupdater/macupdater-log.txt
catcher macOS
line


echo "" >> ~/Projects/Programming/macupdater/macupdater-log.txt
line

# Prints and shows dialog box confirming all updates are done.
printf "All updates complete. END" >> ~/Projects/Programming/macupdater/macupdater-log.txt
osascript -e 'display notification "All updates completed." with title "MacUpdater"' 