echo "Welcome to Flip Coin Simulation Program"
read -p "Enter the number of times coin has to be flipped :" n
echo -e "Select the combination\nEnter 1 for Singlet\nEnter 2 for Doublet"
read -p "Enter your choice : " comb
declare -A dict
arr=('h' 't' 'hh' 'tt' 'ht' 'th')
for j in ${arr[@]}
do
	dict[$j]=0
done
fun() {
	if [[ $1 -eq 0 ]]
	then
		echo "0"
	elif [[ $1 -eq 1 ]]
	then
		echo "1"
	elif [[ $1 -eq 2 ]]
	then
                echo "2"
	else
		echo "3"
	fi
}
for (( i=1; i<=$n; i++ ))
do
	a=$((RANDOM%4))
	val=$( fun $a )
	case $val in
		"0") dict[h]=$(( ${dict[h]} + 1 ))
			dict[hh]=$(( ${dict[hh]} + 1 )) ;;
		"1") dict[t]=$(( ${dict[t]} + 1 )) 
			dict[tt]=$(( ${dict[tt]} + 1 )) ;;
		"2") dict[ht]=$(( ${dict[ht]} + 1 )) ;;
                "3") dict[th]=$(( ${dict[th]} + 1 ))
        esac
done
if [[ $comb -eq 1 ]]
then
	x=`awk 'BEGIN{printf("%0.2f", '${dict[h]}' / '$n' * '100' )}'`
	y=`awk 'BEGIN{printf("%0.2f", '${dict[t]}' / '$n' * '100' )}'`
	echo "Head = $x%"
	echo "Tail = $y%"
else
	w=`awk 'BEGIN{printf("%0.2f", '${dict[hh]}' / '$n' * '100' )}'`
        x=`awk 'BEGIN{printf("%0.2f", '${dict[tt]}' / '$n' * '100' )}'`
	y=`awk 'BEGIN{printf("%0.2f", '${dict[ht]}' / '$n' * '100' )}'`
        z=`awk 'BEGIN{printf("%0.2f", '${dict[th]}' / '$n' * '100' )}'`
	echo -e "HH=$w%\nTT=$x%\nHT=$y%\nTH=$z%"
fi
