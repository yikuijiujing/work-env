@test "Install python3 python3-pip python3-ipython" {
	sudo apt-get install -y python3 python3-pip python3-ipython
}

@test "Install pip config  -- ~/.pip" {
	mkdir -p ~/.pip
	cat > ~/.pip/pip.conf <<- EOF
		[global]
		index-url = https://mirrors.aliyun.com/pypi/simple
		[install]
		trusted-host = mirrors.aliyun.com
		EOF
}

@test "Install python basic tools -- paramiko(ssh), pycurl" {
	# pycurl 依赖 python3-dev 和 libcurl4-openssl-dev
	sudo apt-get install -y python3-dev libssl-dev libcurl4-openssl-dev python3-openssl 
	pip3 install paramiko pycurl
}

@test "Install python dev tools -- pytest PySnooper" {
	pip3 install pytest PySnooper
}

@test "Install python machine learning package -- numpy, scipy, pandas, matplotlib, scikit-learn ..." {
	skip
	pip3 install numpy scipy pandas matplotlib scikit-learn tensorflow xgboost pillow opencv-python pygal
}

