#!/bin/bash -x

echo "WELCOME TO SNAKE AND LADDER GAME"

#constant
MAX_POSITION=100

#variable
position=0

function getPositionValue()
{
	position=$1
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

	if [ $position -gt $MAX_POSITION ]
	then
		position=$(($position-$dieValue))
	fi

	echo  $position

}

function getWinner()
{

	playerPosition1=0
	playerPosition2=0
	dieCount=0

	while [ $playerPosition1 -lt $MAX_POSITION ] && [ $playerPosition2 -lt $MAX_POSITION ]
	do
		playerPosition1=$(getPositionValue $playerPosition1)
		if [ $playerPosition1 -ge $MAX_POSITION ]
		then
			echo "Player1 wins"
			break
		fi
		dieCount=$(($dieCount+1))
		playerPosition2=$(getPositionValue $playerPosition2)
		if [ $playerPosition2 -ge $MAX_POSITION ]
		then
			echo "Player2 wins"
			break
		fi
		dieCount=$(($dieCount+1))
	done

}
getWinner
