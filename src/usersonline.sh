#/bin/bash

USERS=$(who | cut -d' ' -f1 | sort | uniq | wc -l)
#who - displays list of users
# cut -d' ' -f1 - grabs the first string of each line
# sort          - sorts 😊
# uniq          - prints only unique data
# wc            - counts how many lines there are

[ $USERS -eq 1 ] && echo $USERS user online || echo $USERS users online
