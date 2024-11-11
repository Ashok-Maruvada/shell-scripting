#!/bin/bash
** Write a script to check vowels in a string **
echo "enter any string: "
read input_string

vowels="aeiouAEIOU"
found_vowels=""

for (( i=0; i<len(input_string); i++ ));
do
    char=$input_string:$i:0
    if [[ "$vowels" == *"$char"* ]]
    then
        found_vowels="$found_vowels$char "
    fi
done

if [ -n $found_vowels ]
then
    echo "vowels found in string : $found_vowels"
else
    echo " no vowels found "
fi