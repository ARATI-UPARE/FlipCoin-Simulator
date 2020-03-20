#! /bin/bash -x

# WAP to dislpay Percentage of Head or Tail when flipping a coin in loop and store in dictionary

declare -A dict

flip=0
hh=0
ht=0
th=0
tt=0

# For Doublet combination.
while [[ $flip -lt 10 ]]
do
		coin1=$((RANDOM%2))
		coin2=$((RANDOM%2))
		if [[ $coin1 -eq 1 && $coin2 -eq 1 ]]
		then
				(( hh++ ))
		elif [[ $coin1 -eq 1 && $coin2 -eq 0 ]]
		then
				(( ht++ ))
		elif [[ $coin1 -eq 0 && $coin2 -eq 1 ]]
		then
				(( th++ ))
		else
				(( tt++ ))
		fi
		(( flip++ ))
done

perHH=`echo "scale=2; ($hh * 100) / 10"| bc`
perHT=`echo "scale=2; ($ht * 100) / 10"| bc`
perTH=`echo "scale=2; ($th * 100) / 10"| bc`
perTT=`echo "scale=2; ($tt * 100) / 10"| bc`

dict=( [HH]=$hh [HT]=$ht [TH]=$th [TT]=$tt )
echo "${!dict[@]}=${dict[@]}"

echo "Percentage of HH is : $perHH"
echo "Percentage of HT is : $perHT"
echo "Percentage of TH is : $perTH"
echo "Percentage of TT is : $perTT"



