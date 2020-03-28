
#!/bin/bash -x
echo "welcome to flipcoin"

#toss the coin 

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
 count_And_Store_Result $sideOfCoin
done

}
function count_And_Store_Result(){
	coin[$sideOfCoin]=$((${coin[$sideOfCoin]}+1))
	percentage $sideOfCoin
	echo " ${!coin[@]}  ${coin[@]}"
}
function percentage(){
	percentage=$((${coin[$sideOfCoin]}*100/$noOfFlip))
	percentageFlip[$sideOfCoin]=$percentage
	echo "keys ${!percentageFlip[@]}"
	echo  "percent ${percentageFlip[@]}"

}


read -p "enter no of flip" noOfFlip
read -p "enter no of coin" noOfCoin
"$( flip_coin $(($noOfFlip,$noOfCoin)) )"

