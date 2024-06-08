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
# View all student records
view_students() {
    echo "List of student records:"
    cat $FILE
}

# Function to delete a student record
delete_student_record() {
    echo "Enter student ID to delete:"
    read id
    if [ -f $FILE ]; then
        grep -v ",$id\$" $FILE > temp.txt && mv temp.txt $FILE
        echo "Student record deleted successfully."
    else
        echo "No student records found."
    fi
}

# Main loop to display menu and handle user input
while true; do
    display_menu
    echo "Select an option:"
    read option
    case $option in
        1) create_student ;;
        2) view_students ;;
        3) delete_student ;;
        4) update_student ;;
        5) exit 0 ;;
        *) echo "Invalid option, please try again." ;;
    esac
done
