#!/bin/bash

ARG=$1
SAMPFOLDIR='script_sample_folder'

if [ ! $1 ]; then
    echo "No argument provided. Please make sure to repeat and add the argument. Like this: bash $0 <argument>"
    exit 1
fi

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

for FOLDER in "$SAMPFOLDIR"/*/; do
    if [ -d $FOLDER ]; then
        folderNameOriginal=$(basename "$FOLDER")
        folderNameNew="${ARG}-${folderNameOriginal}"
        mv "$FOLDER" "$SAMPFOLDIR/$folderNameNew"
        echo "Changed $folderNameOriginal file name to $folderNameNew"
    fi
done

echo "All .txt files have been renamed successfuly. Thank you for using the script"

