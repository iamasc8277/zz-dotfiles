if [ -f "$HOME/.bash_profile" ]; then
	emulate sh -c 'source "$HOME/.bash_profile"'
elif [ -f "$HOME/.profile" ]; then
	emulate sh -c 'source "$HOME/.profile"'
fi
