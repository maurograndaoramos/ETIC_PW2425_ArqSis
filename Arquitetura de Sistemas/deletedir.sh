#!/bin/bash

SAMPFOLDIR='script_sample_folder'

if [ ! -d "$SAMPFOLDIR" ]; then
    echo "Directory $SAMPFOLDIR does not exist"
    echo "Would you like to create it? Press 1 for Yes, anything else to exit"
    read CHOICE
    if [ "$CHOICE" = "1" ]; then
        mkdir "$SAMPFOLDIR"
        for letra1 in {a..z}; do
            for letra2 in {a..z}; do
                mkdir "$SAMPFOLDIR/$letra1$letra2"
            done
        done
	echo "$SAMPFOLDIR has been created"
    else
	echo "Feel free to use the script again if required"
        exit
    fi
fi


deleteNonEmptyDirs() {
    for dir in "$SAMPFOLDIR"/*; do
        if [ -d "$dir" ] && [ "$(ls -A "$dir")" ]; then
            echo "Deleting non-empty directory: $dir"
            rm -rf "$dir"
        fi
    done
}

deleteAllDirs() {
    for dir in "$SAMPFOLDIR"/*; do
        if [ -d "$dir" ]; then
            echo "Deleting directory: $dir"
            rm -rf "$dir"
        fi
    done
}

if [ $# -eq 0 ]; then
    deleteNonEmptyDirs
elif [ "$1" = true ]; then
    deleteAllDirs
else
    deleteNonEmptyDirs
fi