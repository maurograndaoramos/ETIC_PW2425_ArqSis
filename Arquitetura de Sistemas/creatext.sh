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

for FOLDER in "$SAMPFOLDIR"/*/; do
    if [ -d $FOLDER ]; then
        folderName=$(basename "$FOLDER")
        txtFilePath="${FOLDER}${folderName}.txt"
        echo "${SAMPFOLDIR}-${folderName}" > "$txtFilePath"
        echo "Created text document $txtFilePath with the following text content ${SAMPFOLDIR}-${folderName}"
    fi
done

echo "All .txt files have been created successfuly. Thank you for using the script"

