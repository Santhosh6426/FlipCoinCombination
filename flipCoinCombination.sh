echo "Welcome to Flip Coin Simulation Program"
read -p "Enter the number of times coin has to be flipped :" n
echo -e "Select the combination\nEnter 1 for Singlet\nEnter 2 for Doublet\nEnter 3 for triplet"
read -p "Enter your choice : " comb
declare -A dict
arr=('h' 't' 'hh' 'tt' 'ht' 'th' 'hhh' 'ttt' 'htt' 'thh' 'hth' 'tht' 'hht' 'tth' )
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
        elif [[ $1 -eq 3 ]]
        then
                echo "3"
        elif [[ $1 -eq 4 ]]
        then
                echo "4"
        elif [[ $1 -eq 5 ]]
        then
                echo "5"
        elif [[ $1 -eq 6 ]]
        then
                echo "6"
	else
		echo "7"
	fi
}
for (( i=1; i<=$n; i++ ))
do
	case $comb in
		"1")a=$((RANDOM%2)) ;;
		"2")a=$((RANDOM%4)) ;;
		"3")a=$((RANDOM%8)) ;;
	esac
	val=$( fun $a )
	case $val in
		"0") dict[h]=$(( ${dict[h]} + 1 ))
			dict[hh]=$(( ${dict[hh]} + 1 ))
			dict[hhh]=$(( ${dict[hhh]} +1 )) ;;
		"1") dict[t]=$(( ${dict[t]} + 1 )) 
			dict[tt]=$(( ${dict[tt]} + 1 )) 
			dict[ttt]=$(( ${dict[ttt]} + 1 ));;
		"2") dict[ht]=$(( ${dict[ht]} + 1 ))
			dict[htt]=$(( ${dict[htt]} + 1 )) ;;
                "3") dict[th]=$(( ${dict[th]} + 1 ))
			dict[thh]=$(( ${dict[thh]} + 1 )) ;;
                "4") dict[hth]=$(( ${dict[hth]} + 1 )) ;;
                "5") dict[tht]=$(( ${dict[tht]} + 1 )) ;;
                "6") dict[hht]=$(( ${dict[hht]} + 1 )) ;;
                "7") dict[tth]=$(( ${dict[tth]} + 1 )) ;;

        esac
done
if [[ $comb -eq 1 ]]
then
	x=`awk 'BEGIN{printf("%0.0f", '${dict[h]}' / '$n' * '100' )}'`
	y=`awk 'BEGIN{printf("%0.0f", '${dict[t]}' / '$n' * '100' )}'`
	echo -e "Head = $x%\nTail = $y%"
	if [[ $x -gt $y ]]
	then
		echo "Head=$x% is greater"
	elif [[ $x -eq $y ]]
	then
		echo "Both are equal"
	else
		echo "Tail=$y% is greater"
	fi
elif [[ $comb -eq 2 ]]
then
	w=`awk 'BEGIN{printf("%0.0f", '${dict[hh]}' / '$n' * '100' )}'`
        x=`awk 'BEGIN{printf("%0.0f", '${dict[tt]}' / '$n' * '100' )}'`
	y=`awk 'BEGIN{printf("%0.0f", '${dict[ht]}' / '$n' * '100' )}'`
        z=`awk 'BEGIN{printf("%0.0f", '${dict[th]}' / '$n' * '100' )}'`
	echo -e "HH=$w%\nTT=$x%\nHT=$y%\nTH=$z%"
	arr1=( $w $x $y $z )
	size=${#arr1[@]}
	for (( i=0; i<$size; i++ ))
	do
		for (( j=$(( $i + 1 )); j<=$size; j++ ))
		do
			if [[ ${arr1[$i]} -gt ${arr1[$j]} ]]
			then
				continue
			else
				temp=${arr1[$i]}
				arr1[$i]=${arr1[$j]}
				arr1[$j]=$temp
			fi
		done
	done
	case ${arr1[0]} in
		"$w") echo "HH:${arr1[0]} is the highest" ;;
	esac
	case ${arr1[0]} in
		"$x") echo "TT:${arr1[0]} is the highest" ;;
	esac
	case ${arr1[0]} in
		"$y") echo "HT:${arr1[0]} is the highest" ;;
	esac
	case ${arr1[0]} in
		"$z") echo "TH:${arr1[0]} is the highest" ;;
	esac
else
        w=`awk 'BEGIN{printf("%0.0f", '${dict[hhh]}' / '$n' * '100' )}'`
        x=`awk 'BEGIN{printf("%0.0f", '${dict[ttt]}' / '$n' * '100' )}'`
        y=`awk 'BEGIN{printf("%0.0f", '${dict[htt]}' / '$n' * '100' )}'`
        z=`awk 'BEGIN{printf("%0.0f", '${dict[thh]}' / '$n' * '100' )}'`
        w1=`awk 'BEGIN{printf("%0.0f", '${dict[hth]}' / '$n' * '100' )}'`
        x1=`awk 'BEGIN{printf("%0.0f", '${dict[tht]}' / '$n' * '100' )}'`
        y1=`awk 'BEGIN{printf("%0.0f", '${dict[hht]}' / '$n' * '100' )}'`
        z1=`awk 'BEGIN{printf("%0.0f", '${dict[tth]}' / '$n' * '100' )}'`
	echo -e "HHH=$w%\nTTT=$x%\nHTT=$y%\nTHH=$z%\nHTH=$w1%\nTHT=$x1%\nHHT=$y1%\nTTH=$z1%"
        arr1=( $w $x $y $z $w1 $x1 $y1 $z1 )
        size=${#arr1[@]}
        for (( i=0; i<$size; i++ ))
        do
                for (( j=$(( $i + 1 )); j<=$size; j++ ))
                do
                        if [[ ${arr1[$i]} -gt ${arr1[$j]} ]]
                        then
                                continue
                        else
                                temp=${arr1[$i]}
                                arr1[$i]=${arr1[$j]}
                                arr1[$j]=$temp
                        fi
                done
        done
        case ${arr1[0]} in
                "$w") echo "HHH:${arr1[0]} is the highest" ;;
	esac
	case ${arr1[0]} in
                "$x") echo "TTT:${arr1[0]} is the highest" ;;
	esac
	case ${arr1[0]} in
                "$y") echo "HTT:${arr1[0]} is the highest" ;;
	esac
	case ${arr1[0]} in
                "$z") echo "THH:${arr1[0]} is the highest" ;;
	esac
	case ${arr1[0]} in
		"$w1") echo "HTH:${arr1[0]} is the highest" ;;
	esac
	case ${arr1[0]} in
                "$x1") echo "THT:${arr1[0]} is the highest" ;;
	esac
	case ${arr1[0]} in
                "$y1") echo "HHT:${arr1[0]} is the highest" ;;
	esac
	case ${arr1[0]} in
                "$z1") echo "TTH:${arr1[0]} is the highest" ;;
        esac

fi
