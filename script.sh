FILES=./exemplos/*.fac

for file in $FILES
do
	echo $file
	./factorial $file
done
