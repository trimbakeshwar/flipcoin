
#!/bin/bash -x
echo "welcome to flipcoin"

#toss the coin 

function tossTheCoin(){
toss=$((RANDOM%2))
case $toss in 
0)
   echo 0 ;;
1)
   echo 1 ;;
esac
}
count=0
while true
do
	read -p "enter 0 For fliping coin 1 For Exit" choice
	if [ $choice -eq 0 ]
	then
		result="$( flip_coin $(()) )"
		((count++))
		if [ $result -eq 1 ]
		then
			singlet[head]=$((${singlet[head]}+1))
		elif [ $result -eq 0 ]
		then
			singlet[tail]=$((${singlet[tail]}+1))
		fi
	elif [ $choice -eq 1 ]
	then
		break
	fi
done
echo "${!singlet[@]}	${singlet[@]} "
percentageHead=`echo "${singlet[head]}*100/$count" | bc -l` 
echo " percentage head  $percentageHead"
percentageTail=`echo "${singlet[tail]}*100/$count" | bc -l` 
echo "percentage tail $percentageTail"

