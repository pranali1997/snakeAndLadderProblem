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
	nextPlayer=1
	dieCount=0

	while [ $playerPosition1 -lt $MAX_POSITION ] && [ $playerPosition2 -lt $MAX_POSITION ]
	do
		if [ $nextPlayer -eq 1 ]
		then
			playerPosition1=$( getPositionValue $playerPosition1)
			echo "player1 position: "$playerPosition1
			if [ $playerPosition1 -eq $MAX_POSITION ]
			then
				echo "Player1 wins"
			else
				nextPlayer=0
			fi
			dieCount=$(($dieCount+1))

		else
			playerPosition2=$( getPositionValue $playerPosition2)
			echo "player2 position: "$playerPosition2
			if [ $playerPosition2 -eq $MAX_POSITION ]
			then
				echo "Player2 wins"
			else
				nextPlayer=1
			fi
		fi

		dieCount=$(($dieCount+1))
	done

	echo "number of times die was rolled :" $dieCount
}
getWinner
