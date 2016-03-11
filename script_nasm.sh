FILES=./exemplos/*.asm

for file in $FILES
do
	echo $file
	nasm -felf $file
done
