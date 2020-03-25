#!/bin/bash -x
#This problem simulates a Snake and Ladder Game. The Player starts from 0 rolls the die to get a number between 1 to 6, findsa safe place, ladder or a snake keeps doing till the winning spot 100 is achieved.
echo "===================================================================="
echo "==============: WELCOME TO THE SNACK LADDER GAME :=================="
echo "===================================================================="

read -p "Enter Player1 name: " player1
read -p "Enter Player2 name: " player2

#Constant 
numberOfPlay=0
ladder=1
snack=2
start_Point=0
win_Point=100

#Declaring Variable
pointFirst=0
pointSecond=0
diesCountFirst=0
diesCountSecond=0
player=2
#Function For Die Roll The Number Player 1 To 6 Randomly
function rollDies()
{
	randomNumber=$((RANDOM%6+1))
	echo $randomNumber
}

#Function To Use Check They Are Number of Play, Ladder Or Snack 
function toCheck()
{  position=$1
	checkOption=$(($RANDOM%3))
	diesGeneratedNumber="$( rollDies )"
	#Increment The Dies Count
	((diesCount++))
		case $checkOption in
			0)
				position=$position ;;
			1)
				position=$(($position+$diesGeneratedNumber)) ;;
			2)
				position=$(($position-$diesGeneratedNumber)) ;;
			*)
				echo "Enter The Choies Properly.." ;;
		esac
		echo $position
}


#Condition For Repeat Till The Player Reaches The Winning Position
while [[ $pointFirst -ne $win_Point && $pointSecond -ne $win_Point ]]
do
	if [ $player -eq 2 ]
	then
		pointFirst="$( toCheck $pointFirst)"
		(( diesCountFirst++ ))

		if [[ $pointFirst -lt 0 ]]
		then
       			pointFirst=$start_Point
		fi

		if [[ $pointFirst -gt $win_Point ]]
		then
			diesGeneratedNumber="$( rollDies )"
			pointFirst=$(($pointFirst-$diesGeneratedNumber))
		fi

		if [[ $pointFirst -eq $win_Point ]]
		then
			echo $player1 "is winner.."
		fi
		(( player-- ))
	else
		pointSecond="$( toCheck $pointSecond )"
		(( diesCountSecond++ ))

		if [[ $pointSecond -lt 0 ]]
		then
       			pointSecond=$start_point
		fi

		if [[ $pointSecond -gt $win_Point ]]
		then
			diesGeneratedNumber="$(rollDies)"
			pointSecond=$(($pointSecond-$diesGeneratedNumber))
		fi

		if [[ $pointSecond -eq $win_Point ]]
		then
			echo $player2 "is winner.."
		fi
		player=2

	fi
done
	echo "DiesCounterFirst No Is:$diesCountFirst First Player Position is:$pointFirst"
	echo "DiesCounterSecond No Is:$diesCountSecond Second Player Position is:$pointSecond"



