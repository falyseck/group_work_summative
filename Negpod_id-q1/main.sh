#!/bin/bash

STUDENTS_FILE="students-list_1023.txt"
SELECT_EMAILS_SCRIPT="select-emails.sh"
STUDENT_EMAILS_FILE="student-emails.txt"

while true; do
    echo "Choose an option:"
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Select student emails"
    echo "6. Exit"

    read choice

    case $choice in
        1) # Create student record
            echo "Enter student email:"
            read email
            echo "Enter student age:"
            read age
            echo "Enter student ID:"
            read student_id

            echo "$email,$age,$student_id" >> "$STUDENTS_FILE"
            ;;
        2) # View all students
            echo "All students:"
            cat "$STUDENTS_FILE"
            ;;
        3) # Delete student record by student ID
            echo "Enter student ID to delete:"
            read delete_id
            grep -v "^.*,$delete_id$" "$STUDENTS_FILE" > tmpfile && mv tmpfile "$STUDENTS_FILE"
            ;;
        4) # Update student record by student ID
            echo "Enter student ID to update:"
            read update_id
            echo "Enter new email:"
            read new_email
            echo "Enter new age:"
            read new_age

            sed -i "/^.*,$update_id$/s/.*/$new_email,$new_age,$update_id/" "$STUDENTS_FILE"
            ;;
        5) # Select student emails
            ./"$SELECT_EMAILS_SCRIPT" "$STUDENTS_FILE" > "$STUDENT_EMAILS_FILE"
            echo "Student emails saved to $STUDENT_EMAILS_FILE"
            ;;
        6) # Exit the application
            echo "Exiting..."
            exit 0
            ;;
        *) # Invalid option
            echo "Invalid option. Please choose a number between 1 and 6."
            ;;
    esac
done

