#!/bin/bash

# File to store student records
FILE="students-list_1023.txt"

# Check if the file exists, otherwise create it
if [ ! -f $FILE ]; then
    touch $FILE
fi

# Display the menu
display_menu() {
    echo "1. Create student record"
    echo "2. View all student records"
    echo "3. Delete a student record"
    echo "4. Update a student record"
    echo "5. Exit"
}

# Create a new student record
create_student() {
    echo "Enter student's email:"
    read email
    echo "Enter student's age:"
    read age
    echo "Enter student's ID:"
    read id
    echo "$email, $age, $id" >> $FILE
    echo "Student record created successfully!"
}
