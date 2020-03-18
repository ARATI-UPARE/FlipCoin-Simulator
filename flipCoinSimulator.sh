#! /bin/bash -x

# WAP to dislpay Percentage of Head or Tail when flipping a coin in loop and store in dictionary

declare -A dict

flip=0
head=0
tail=0

# For singleton combination.
while [[ $flip -lt 10 ]]
do
		coin=$((RANDOM%2))
		if [[ $coin -eq 1 ]]
		then
				(( head++ ))
		else
				(( tail++ ))
		fi
		(( flip++ ))
done

perHead=`echo "scale=2;($head / 10 ) * 100"|bc`
perTail=`echo "scale=2;($tail / 10 ) * 100"|bc`
dict=( [Head]=$head [Tail]=$tail )
echo "${!dict[@]}=${dict[@]}"

echo "Percentage of Head is : $perHead"
echo "Percentage of Tail is : $perTail"



