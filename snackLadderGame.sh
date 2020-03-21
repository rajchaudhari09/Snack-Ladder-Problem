#!/bin/bash -x
#This problem simulates a Snake and Ladder Game. The Player starts from 0 rolls the die to get a number between 1 to 6, findsa safe place, ladder or a snake keeps doing till the winning spot 100 is achieved.
echo  "==============: WELCOME TO THE SNACK LADDER GAME :=================="

#Constant 
numberOfPlay=0
ladder=1
snack=2

#Declaring Variable
start_Point=0
point=0

#Function For Die Roll The Number Player 1 To 6 Randomly
function rollDies()
{
	randomNumber=$((RANDOM%6+1))
	echo $randomNumber
}

#Function To Use Check They Are Number of Play, Ladder Or Snack 
function toCheck()
{
	checkOption=$(($RANDOM%3))
	diesGeneratedNumber=$(rollDies)
		case $checkOption in
			0)
				point=$point ;;
			1)
				point=$(($point+diesGeneratedNumber)) ;;
			2)
				point=$(($point-diesGeneratedNumber)) ;;
			*)
				echo "Enter The Choies Properly.." ;;
		esac
}
toCheck


