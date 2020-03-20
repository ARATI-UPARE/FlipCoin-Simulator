#! /bin/bash -x

# WAP to dislpay Percentage of Head or Tail when flipping a coin in loop and store in dictionary

declare -A dict

read -p "Enter the no of time flip the coin " noOfFlip

flip=0
hhh=0
hht=0
hth=0
htt=0
ttt=0
thh=0
tht=0
tth=0


# For Triplet combination.
while [[ $flip -lt $noOfFlip ]]
do
		coin1=$((RANDOM%2))
		coin2=$((RANDOM%2))
		coin3=$((RANDOM%2))
		if [[ $coin1 -eq 1 && $coin2 -eq 1 && $coin3 -eq 1 ]]
		then
				(( hhh++ ))
		elif [[ $coin1 -eq 1 && $coin2 -eq 1 && $coin3 -eq 0 ]]
		then
				(( hht++ ))
		elif [[ $coin1 -eq 1 && $coin2 -eq 0 && $coin3 -eq 1 ]]
		then
				(( hth++ ))
		elif [[ $coin1 -eq 1 && $coin2 -eq 0 && $coin3 -eq 0 ]]
		then
				(( htt++ ))
		elif [[ $coin1 -eq 0 && $coin2 -eq 0 && $coin3 -eq 0 ]]
		then
				(( ttt++ ))
		elif [[ $coin1 -eq 0 && $coin2 -eq 1 && $coin3 -eq 1 ]]
		then
				(( thh++ ))
		elif [[ $coin1 -eq 0 && $coin2 -eq 1 && $coin3 -eq 0 ]]
		then
				(( tht++ ))
		else
				(( tth++ ))
		fi

		(( flip++ ))
done

perHHH=`echo "scale=2; ($hhh * 100) / 10"| bc`
perHHT=`echo "scale=2; ($hht * 100) / 10"| bc`
perHTH=`echo "scale=2; ($hth * 100) / 10"| bc`
perHTT=`echo "scale=2; ($htt * 100) / 10"| bc`
perTTT=`echo "scale=2; ($ttt * 100) / 10"| bc`
perTHH=`echo "scale=2; ($thh * 100) / 10"| bc`
perTHT=`echo "scale=2; ($tht * 100) / 10"| bc`
perTTH=`echo "scale=2; ($tth * 100) / 10"| bc`

dict=( [HH]=$hh [HT]=$ht [TH]=$th [TT]=$tt )
echo "${!dict[@]}=${dict[@]}"

echo "Percentage of HH is : $perHHH"
echo "Percentage of HT is : $perHHT"
echo "Percentage of TH is : $perHTH"
echo "Percentage of TT is : $perHTT"
echo "Percentage of TT is : $perTTT"
echo "Percentage of TT is : $perTHH"
echo "Percentage of TT is : $perTHT"
echo "Percentage of TT is : $perTTH"


