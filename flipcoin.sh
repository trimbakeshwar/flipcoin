
#!/bin/bash -x
echo "welcome to flipcoin"

#toss the singlet doublet triplet coin 

declare -A coin
declare -A percentageFlip
HEAD=1
TAIL=0
function flip_coin(){
	for (( j=1; j<=$noOfFlip; j++ ))
	do
		sideOfCoin=""
		for (( i=1; i<=$noOfCoin; i++ ))
		do
			toss=$((RANDOM%2))
			case $toss in 
			$TAIL)
  				sideOfCoin+=T ;;
			$HEAD)
				sideOfCoin+=H ;;
			esac
		done
		coin[$sideOfCoin]=$((${coin[$sideOfCoin]}+1))
		percentage $sideOfCoin
	done
		echo "${!coin[@]} ${coin[@]}"
}

echo ${coin[@]}
#calculate parcentage and store in dictionary
function percentage(){
	percentage=$((${coin[$sideOfCoin]}*100/$noOfFlip))
	percentageFlip[$sideOfCoin]=$percentage
	echo "keys ${!percentageFlip[@]}"
	echo  "percent ${percentageFlip[@]}"

}

while true
do
	read -p "enter no of flip" noOfFlip
	read -p "enter no of coin" noOfCoin
	if [ $noOfCoin -gt 0 ] && [ $noOfCoin -lt 4 ]
	then
		result="$( flip_coin $(($noOfFlip,$noOfCoin)) )"
		#echo $result
		echo ${coin[@]}
	else
		echo "enter valid number of coin" 
	fi
	read -p "do u want quit press 1" quit
	if [ $quit -eq 1 ]
	then
		break
	fi
done
