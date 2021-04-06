#!/usr/bin/env bats

@test "Install git" {
	run sudo apt install git	
	[[ $status -eq 0 ]]
}

@test "Install git config -- ~/.gitconfig" {
	cat > ~/.gitconfig <<- EOF
		# 跟下面三个命令功能一样
		# git config --global user.name username
		# git config --global user.email user@email
		# git config --global credential.helper store
		[user]
			name = peekpoke
			email = peekpoke@qq.com
		[credential]
			helper = store
		
		[core]
			# #提交时转换为LF，检出时不转换
			# git config --global core.autocrlf input
			autocrlf = input
		
			# 设置编辑器为vim，替代nano
			editor = vim
		EOF

	[[ $status -eq 0 ]]
}

@test "Install git credentials -- ~/.git-credentials" {
	cat > ~/.git-credentials <<- EOF
		https://peekpoke:xlt13910957915@gitee.com
		https://peekpoke:xlt13910957915@github.com
		EOF

	[[ $status -eq 0 ]]
}
