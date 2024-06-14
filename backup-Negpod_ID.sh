#!/bin/bash

# Define variables
DIRECTORY="negpod_id-q1"
REMOTE_HOST="ec1ebc754f75.a5efec7a.alu-cod.online"
REMOTE_USER="ec1ebc754f75"
REMOTE_PASS="ea1d8f222b11d7be18f6"
REMOTE_DIR="/summative/0524-2024m"

# Check if sshpass is installed, and install if it is not
if ! command -v sshpass &> /dev/null; then
    echo "sshpass could not be found, installing it..."
    if ! sudo apt-get install -y sshpass; then
        echo "Failed to install sshpass."
        exit 1
    fi
fi

# Check if sshpass installation was successful
if ! command -v sshpass &> /dev/null; then
    echo "sshpass installation failed."
    exit 1
fi

# Debug information
echo "Attempting to create directory on remote host: $REMOTE_HOST"
echo "Remote user: $REMOTE_USER"
echo "Remote directory: $REMOTE_DIR"

# Create the target directory on the remote host if it does not exist
sshpass -p "$REMOTE_PASS" ssh -o StrictHostKeyChecking=no "$REMOTE_USER@$REMOTE_HOST" "mkdir -p $REMOTE_DIR" 2>&1 | tee mkdir.log
if [ ${PIPESTATUS[0]} -ne 0 ]; then
    echo "Failed to create directory on remote host. See mkdir.log for details."
    exit 1
fi

# Debug information
echo "Directory created successfully on remote host."

# Perform the secure copy using sshpass
echo "Starting secure copy of $DIRECTORY to $REMOTE_HOST:$REMOTE_DIR"
if sshpass -p "$REMOTE_PASS" scp -o StrictHostKeyChecking=no -r "$DIRECTORY" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"; then
    echo "Backup completed successfully."
else
    echo "Backup failed."
    exit 1
fi
