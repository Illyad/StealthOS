#!/bin/bash

clear
echo "Execute commands here. To open an instance use & at the end of the line (ed. firefox &)"
echo -n "$HOSTNAME :"
read command
$command
./execute.sh
