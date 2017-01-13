#!/bin/sh

if [ -z "$1" ]
then
	echo "no file name specified"
	exit 1
fi

file_name=$(echo $1| cut -d'.' -f 1)

list_file=$file_name.list
bin_file=$file_name.bin

echo "copying .asm from Visual Studio..."
cp /cygdrive/c/Users/Evan/Documents/Visual\ Studio\ 2013/MovTable/XMLto6809/bin/Debug/*.asm .




echo "lwasm  --6809 $1 --list=$list_file --output=$bin_file"
lwasm  --6809 $1 --list=$list_file --output=$bin_file

if [ -e $bin_file ]
then
	#erase old file
	writecocofile -k evan.dsk $bin_file
	if [ $? -eq 0 ]
	then
		echo "old file erased from image"
	fi
	
	echo "copying file to disk image"
	writecocofile   -b evan.dsk $bin_file
else
	echo "build stopped."	
fi	
exit 0
