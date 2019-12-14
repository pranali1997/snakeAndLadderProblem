#!/bin/bash -x

echo "WELCOME TO SNAKE AND LADDER GAME"

#constant
MAX_POSITION=100
position=0

#variable
dieCount=0

function getOnePlayer()
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
		if [ $position -gt 100 ]
		then
			position=$(($position-$dieValue))
		fi
	echo  $position
}

function getWinner()
{
	getOnePlayer

	position1=0
	position2=0
	flag=1
	while [ $position1 -lt 100 ] && [ $position2 -lt 100 ]
	do
		if [ $flag -eq 1 ]
		then
			position1=$(getOnePlayer $position1)
			if [ $position1 -eq 100 ]
			then
				echo "Player1 wins"
			else
				flag=0
			fi
			dieCount=$(($dieCount+1))
		else
			position2=$(getOnePlayer $position2)
			if [ $position2 -eq 100 ]
			then
				echo "Player2 wins"
			else
				flag=1
			fi
		fi
		dieCount=$(($dieCount+1))
		echo "player1 position: " $position1
		echo "player2 position: "$position2
	done
	echo "number of times die was rolled :" $dieCount
}
getrWinner
