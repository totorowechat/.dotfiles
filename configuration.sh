#!/bin/bash

for d in */; do
	stow "$d"
	echo "stow $d"
done
