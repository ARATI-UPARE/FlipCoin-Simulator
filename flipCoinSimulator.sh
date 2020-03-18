#! /bin/bash -x

# WAP to dislpay Head or Tail when flip a coin

coin=$((RANDOM%2))

if [[ $coin -eq 1 ]]
then
		echo head
else
		echo tail
fi



