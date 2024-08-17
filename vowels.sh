#!/bin/bash

string="ashok"
for i in string.[*]
do
    if [i == string.[*]]
    then
        echo "$i is vowel"
    else
        echo "$i is not a vowel"
    fi
    i++
done