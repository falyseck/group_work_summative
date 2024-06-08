#!/bin/bash

# File to store student records
FILE="students-list_1023.txt"

# Check if the file exists, otherwise create it
if [ ! -f $FILE ]; then
    touch $FILE
fi
2
# Display the menu
display_menu() {
    echo "1. Create student record"
    echo "2. View all student records"
    echo "3. Delete a student record"
    echo "4. Update a student record"
    echo "5. Exit"
}
