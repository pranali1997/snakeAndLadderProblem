#!/bin/bash -x

echo "WELCOME TO SNAKE AND LADDER GAME"

#variable
position=0
diceValue=$(((RANDOM%6)+1))
optionsValue=$(((RANDOM%3)+1))

case $optionsValue in
	1)position=$position;;
	2)position=$(($position+$diceValue));;
	3)position=$(($position-$diceValue));;
esac
echo $position
