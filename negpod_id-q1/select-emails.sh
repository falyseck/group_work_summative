#!/bin/bash

FILE="students-list_0524.txt"
EMAIL_FILE="student-emails.txt"

if [[ -f $FILE ]]; then
    cut -d, -f1 $FILE > $EMAIL_FILE
    echo "Student emails saved to $EMAIL_FILE"
else
    echo "No student records found."
fi

