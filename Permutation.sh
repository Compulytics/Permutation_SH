#!/bin/bash
if [ $# -ne 0 ] #If there are arguments passed to this script
then #Then do this stuff.
	IFS=$'\r\n' Chars=($(cat $1)) #Split the items in the character list by newline.
	CharCount=${#Chars[@]} #Determine how many items where in the character list.
	MaxLength=$3 #Get the maximum length for permutations.
	MinLength=$2 #Get the minimum length for permutations.
	Index[0]=0 #Create the array for indexing the other array.
	a=0 #Counter for the following loop.
	while [ $a -lt $MaxLength ] #While counter "a" is less than the maximum length for permutations.
	do #Do this stuff
		if [ $a -lt $MinLength ] #If counter "a" is less than the minimum length for permutations.
		then #Then do this stuff.
			Index[$a]=0 #Set the value of the "Index" array to zero at the index equal to counter "a".
		else #If counter "a" is not less than the minimum length for permutations do this stuff.
			Index[$a]=9223372036854775807 #Set the value of the "Index" array to an insanely high number at the index equal to the counter.
		fi #Done
		a=$(($a + 1)) #Add one to counter "a"
	done #Loop again if the loop conditions are still met.
	echo "#Length $MinLength#" #Display current length of permutations being generated.
else #If there are not arguments passed to this script then do the stuff below.
	echo "Usage: ./THISFILE.SH (Character list file) (Minimum output length) (Maximum output length)" #Display usage information.
	exit #Close this script.
fi #Done
a=$(($a - 1)) #Subtract one from counter "a" used for the loop above.
while [ ${Index[$a]} -ne $CharCount ] #While the "Index" array at the index which has the same value of the counter "a" is not equal to the number of characters where in the character list.
do #Do this stuff.
	b=0 #Counter for the loop below.
	while [ $b -lt $a ] #While the counter "b" is less than the counter "a".
	do #Do the stuff below.
		c=0 #Counter for the loop below.
		d=1 #+1 Increased counter for indexing in the loop below.
		e=2 #+2 Increased counter for reporting permutation length below. 
		while [ $c -lt $a ] #While counter "c" is less than counter "a".
		do #Do the stuff below.
			if [ ${Index[$c]} -eq $CharCount ] #If the value of the array "Index" at the index equal to the value of the counter "c" is equal to the number of items in the character list.
			then #Then do the stuff below.
				if [ ${Index[$d]} -gt $CharCount ] #If the value of the "Index" array at the index equal to the value of the counter "d" is greater than the number of items in the character list.
				then #Then do the stuff below.
					Index[$d]=0 #Set the array "Index" at the index equal to the value of the counter "d" to zero.
					echo "#Length $e#" #Display current length of permutations being generated.
				else #If the value of the "Index" array at the index equal to the value of the counter "d" is not greater than the number of items in the character list do the stuff below.
					Index[$d]=$((${Index[$d]} + 1)) #Set the array "Index" at the index equal to the value of the counter "d" equal to the value of itself plus one.
				fi #Done
				Index[$c]=0 #Set the value of the array "Index" at the index equal to the value of the counter "c" equal to zero.
			fi #Done
			c=$(($c + 1)) #Add one to the counter "c".
			d=$(($d + 1)) #Add one to the counter "d".
			e=$(($e + 1)) #Add one to the counter "e".
		done #Done
		f=$a #Counter for the loop below, Set to the value of counter a.
		while [ $f -ge 0 ] #While counter "f" is greater than or equal to zero.
		do #Do the stuff below.
			if [ ${Index[$a]} -ne $CharCount ] #If the value of the array "Index" at the index equal to the value of the counter "a" is not equal to the number of characters where in the character list.
			then #Then do the stuff below.
				echo -n ${Chars[${Index[$f]}]} #Display the value of the array "Chars" at the index equal to the value of the array "Index" at the index equal to the counter "f"
			else #If the value of the array "Index" at the index equal to the value of the counter "a" is equal to the number of characters where in the character list.
				exit #End this script.
			fi #Done
			f=$(($f - 1)) #Set the counter "f" equal to itself minus one.
		done #Done
		echo "" #Line break
		Index[0]=$((${Index[0]} + 1)) #Set the array "Index" at index 0 equal to the value of itself plus one.
		b=$(($b + 1)) #Set the counter "b" equal to itself plus one.
	done #Done
done #Done
