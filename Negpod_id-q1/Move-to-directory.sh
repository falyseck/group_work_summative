#!/bin/bash

# Directory name
DIR="negpod_id-q1"

# Check if the directory exists, if not, create it
if [ ! -d "$DIR" ]; then
  mkdir $DIR
fi
