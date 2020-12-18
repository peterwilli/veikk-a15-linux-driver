#!/bin/bash
FILES=/sys/bus/hid/drivers/hid-generic/0003:2FEB:0004.*
for f in $FILES
do
  name=$(basename $f)
  echo "Unbinding $name..."
  echo -n $name | sudo tee -a /sys/bus/hid/drivers/hid-generic/unbind
done
