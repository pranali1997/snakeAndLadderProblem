#!/bin/bash -x
echo "WELCOME TO SNAKE AND LADDER GAME"

#variable
position=0

while [ $position -lt 100 ]
do
	optionsValue=$(((RANDOM%3)+1))
	dieValue=$(((RANDOM%6)+1))

	case $optionsValue in
		1)position=$position;;
		2)position=$(($position+$dieValue));;
		3)position=$(($position-$dieValue));;
	esac

		if [ $position -lt 0 ]
		then
			position=0
		fi
		if [ $position -gt 100 ]
		then
			position=$(($position-$dieValue))
		fi
	echo $position
done
