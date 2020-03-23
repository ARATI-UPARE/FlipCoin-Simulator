#! /bin/bash -x

# WAP to dislpay Percentage of singlet,Doublet and Triplet combination when flippinga coin multiple times and store the result in dictionary
# Declare Dictionary for every combination.
# User input

declare -A dict

echo " ####### Welcome to flip coin simulation ########"
read -p "Enter the no of time flip the coin " noOfFlip
flip=0
echo "Enter your choice :
1.Singlet combination
2.Doublet combination
3.Trioplet combination"
read -p " Enter your choice " ch
singlet=1
doublet=2
triplet=3

case $ch in
		$singlet)
				# For singleton combination.
				while [[ $flip -lt $noOfFlip ]]
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
				if [[ $head -gt $tail ]]
				then
						echo "Winning combination is Head=$head "
				else
						echo"Winning combination is Tail=$tail "
				fi
				;;
		$doublet)
				# For Doublet combination.
				hh=0
				ht=0
				th=0
				tt=0
				while [[ $flip -lt $noOfFlip ]]
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

				if [[ $hh -gt $ht && $hh -gt $th && $hh -gt $tt  ]]
				then
						echo " Winning combination is HH=$hh "
				elif [[ $ht -gt $hh && $ht -gt $th && $ht -gt $tt  ]]
				then
						echo " Winning combination is HT=$ht "
				elif [[ $th -gt $hh && $th -gt $ht && $th -gt $tt  ]]
				then
						echo " Winning combination is TH=$th "
				else
						echo " Winning combination is TT=$tt "
				fi
				;;
		$triplet)
				# For Triplet combination
				hhh=0
				hht=0
				hth=0
				htt=0
				ttt=0
				thh=0
				tht=0
				tth=0

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

				dict=( [HHH]=$hhh [HHT]=$hht [HTH]=$hth [HTT]=$htt [TTT]=$ttt [THH]=$thh [THT]=$tht [TTH]=$tth )
				echo "${!dict[@]}=${dict[@]}"

				echo "Percentage of HHH is : $perHHH"
				echo "Percentage of HHT is : $perHHT"
				echo "Percentage of HTH is : $perHTH"
				echo "Percentage of HTT is : $perHTT"
				echo "Percentage of TTT is : $perTTT"
				echo "Percentage of THH is : $perTHH"
				echo "Percentage of THT is : $perTHT"
				echo "Percentage of TTH is : $perTTH"

				if [[ $hhh -gt $hht && $hhh -gt $hth && $hhh -gt $htt && $hhh -gt $ttt && $hhh -gt $thh && $hhh -gt $tht && $hhh -gt $tth ]]
				then
						echo "Winning combination is HHH=$hhh"
				elif [[ $hht -gt $hhh && $hht -gt $hth && $hht -gt $htt && $hht -gt $ttt && $hht -gt $thh && $hht -gt $tht && $hht -gt $tth ]]
				then
						echo "Winning combination is HHT=$hht"
				elif [[ $hth -gt $hhh && $hth -gt $hht && $hth -gt $htt && $htt -gt $ttt && $hth -gt $thh && $hth -gt $tht && $hth -gt $tth ]]
				then
						echo "Winning combination is HTH=$hth"
				elif [[ $htt -gt $hhh && $htt -gt $hht && $htt -gt $hth && $htt -gt $ttt && $htt -gt $thh && $htt -gt $tht && $htt -gt $tth ]]
				then
						echo "Winning combination is HTT=$htt"
				elif [[ $ttt -gt $hhh && $ttt -gt $hht && $ttt -gt $hth && $ttt -gt $htt && $ttt -gt $thh && $ttt -gt $tht && $ttt -gt $tth ]]
				then
						echo "Winning combination is TTT=$ttt"
				elif [[ $thh -gt $hhh && $thh -gt $hht && $thh -gt $hth && $thh -gt $ttt && $thh -gt $tht && $thh -gt $tth && $thh -gt $htt ]]
				then
						echo "Winning combination is THH=$thh"
				elif [[ $tht -gt $hhh && $tht -gt $hht && $tht -gt $hth && $tht -gt $ttt && $tht -gt $thh && $tht -gt $thh && $tht -gt $tth ]]
				then
						echo "Winning combination is THT=$tht"
				else
						echo "Winnin combination is TTH=$tth"
				fi
				;;
		*)
				echo "Invalid choice"
				;;
esac

