#!/bin/sh
MY_MESSAGE="Hello World"
echo $MY_MESSAGE

echo "What's your name?"
read NAME
echo "Hello $NAME - hope you're well."

echo "There's my $MYVAR"
MYVAR="it's a var"
echo "There's my $MYVAR again"

FILE_LOCATION="src"
echo "saving at ${FILE_LOCATION}/app"