#!/bin/bash

while read PLUGIN
do
	echo "Installing $PLUGIN"
    npm install -g "$PLUGIN"
done < "$1"
