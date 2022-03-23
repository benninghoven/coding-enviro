#/bin/bash

USERS=$(who | cut -d' ' -f1 | sort | uniq | wc -l)
[ $USERS -eq 1 ] && echo $USERS user online || echo $USERS users online
