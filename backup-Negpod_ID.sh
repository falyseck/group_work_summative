#!/bin/bash

# Define variables
LOCAL_DIR="~/group_work_summative/Negpod_id-q1"
REMOTE_HOST="ec1ebc754f75.a5efec7a.alu-cod.online"
REMOTE_USER="ec1ebc754f75"
REMOTE_PASS="ea1d8f222b11d7be18f6"
REMOTE_DIR="/summative/0524-2024m"

# Check if the local directory exists
if [ ! -d "$LOCAL_DIR" ]; then
    echo "Local directory $LOCAL_DIR does not exist."
    exit 1
fi

# Execute the backup command
echo "Executing: program /usr/bin/ssh host $REMOTE_HOST, user $REMOTE_USER, command scp -v -r -t $REMOTE_DIR"
sshpass -p "$REMOTE_PASS" ssh $REMOTE_USER@$REMOTE_HOST "mkdir -p $REMOTE_DIR"
sshpass -p "$REMOTE_PASS" scp -v -r $LOCAL_DIR $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed to $REMOTE_HOST:$REMOTE_DIR"
else
    echo "Backup failed"
fi

