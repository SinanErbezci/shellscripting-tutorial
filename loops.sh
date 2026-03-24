#!/bin/sh
for i in 1 2 3 4 5
do
  echo "Looping $i"
done

for i in hello 1 * 2 goodbye
do
  echo "Looping $i"
done

INPUT_STRING=hello
while [ "$INPUT_STRING" != "bye" ]
do
  echo "Please type something (bye to exit)"
  read INPUT_STRING
  echo "you typed: $INPUT_STRING"
done