#!/bin/bash
printf "%s" "Waiting for google.pl (1s)..."
#while ! timeout 0.2 ping -c 1 -n google.pl &> /dev/null
while ! ping -c 1 -n google.pl &> /dev/null
do
    printf "%c" "."
    sleep 1s
done
printf "\n%s\n"  "Site google.pl is back online"
