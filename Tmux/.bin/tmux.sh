#!/bin/bash

if [ "$TERM" == "linux" ]
then
	if ! tmux has-session -t tty-host; then
		tmux -f ~/.ttytmux.conf new-session -s tty-host -n tty-host-console
	else
		tmux attach -t tty-host
	fi
else
	if ! tmux has-session -t host; then
		tmux new-session -s host -n host-console
	else
		tmux attach -t host
	fi
fi
