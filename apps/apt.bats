@test "Install apt source list" {
	grep "Ubuntu" /etc/os-release > /dev/null
	
	if [ $0 == 0 ]; then
		sudo cat > /etc/apt/sources.list <<- EOL
			deb http://mirrors.163.com/debian/ buster main non-free contrib
			deb http://mirrors.163.com/debian/ buster-updates main non-free contrib
			deb http://mirrors.163.com/debian/ buster-backports main non-free contrib
			deb http://mirrors.163.com/debian-security/ buster/updates main non-free contrib
			EOL
	else
		sudo cat > /etc/apt/sources.list <<- EOL
			deb http://mirrors.163.com/ubuntu/ wily main restricted universe multiverse
			deb http://mirrors.163.com/ubuntu/ wily-security main restricted universe multiverse
			deb http://mirrors.163.com/ubuntu/ wily-updates main restricted universe multiverse
			deb http://mirrors.163.com/ubuntu/ wily-proposed main restricted universe multiverse
			deb http://mirrors.163.com/ubuntu/ wily-backports main restricted universe multiverse
			EOL
	fi
	sudo apt udpate
}

@test "Install apt proxy" {
	skip
}

