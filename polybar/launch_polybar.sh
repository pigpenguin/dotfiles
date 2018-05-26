#!/bin/bash

for m in $(polybar -m | cut -d ":" -f1);do
	MONITOR=$m polybar --reload example &
done
