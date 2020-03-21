#!/bin/bash -x
#This problem simulates a Snake and Ladder Game. The Player starts from 0 rolls the die to get a number between 1 to 6, findsa safe place, ladder or a snake keeps doing till the winning spot 100 is achieved.
echo  "==============: WELCOME TO THE SNACK LADDER GAME :=================="

#Declaring Variable
start_Point=0

#Function For Die Roll The Number Player 1 To 6 Randomly
function rollDies()
{
	dieRoll=$((RANDOM%6+1))
	echo "dieroll is the $dieRoll"
}
rollDies
