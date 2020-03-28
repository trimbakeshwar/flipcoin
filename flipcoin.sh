echo "welcome to flipcoin"

#toss the coin 

function tossTheCoin(){
toss=$((RANDOM%2))
case $toss in 
0)
   echo head ;;
1)
   echo tail ;;
esac
}
$( tossTheCoin $(()) )
