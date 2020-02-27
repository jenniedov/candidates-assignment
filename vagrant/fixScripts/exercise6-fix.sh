#!/bin/bash
#add fix to exercise6-fix here

# Copy files
path_to_copy=${@: -1}
ssh vagrant@other_server mkdir -p $path_to_copy
length=$(($#-1))
files_to_move=${@:1:$length}
scp $files_to_move vagrant@other_server:$path_to_copy

# Print bytes sum
bytes_sum=0
for i in $files_to_move
do
  num_to_add=$(stat --printf="%s" ${i})
  ((bytes_sum=bytes_sum+num_to_add))
done
echo $bytes_sum

