@test "Install basic shell tools -- curl wget graphviz" {
	sudo apt-get install -y curl wget graphviz 
}

@test "Configure the HOSTALIASES for user-specific hosts" {
	if [ ! -f ~/.hosts ]; then
		touch ~/.hosts
	fi
	cat >> ~/.bashrc <<- EOF
		HOSTALIASES="~/.hosts"
		EOF
}
