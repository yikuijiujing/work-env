@test "Install vim" {
	sudo apt-get install -y vim
}

@test "Config vim" {
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p  ~/.vim/plugged
	cat > ~/.vimrc <<- EOF
		set nu
		if has('mouse')
			set mouse-=a
		endif
		
		call plug#begin('~/.vim/plugged')
		
		" Make sure you use single quotes
		
		Plug 'vim-syntastic/syntastic'
		
		" Initialize plugin system
		call plug#end()
		

		set statusline+=%#warningmsg#
		set statusline+=%{SyntasticStatuslineFlag()}
		set statusline+=%*
		let g:syntastic_error_symbol = "E>"
		let g:syntastic_style_error_symbol = "E>"
		let g:syntastic_warning_symbol = "W>"
		let g:syntastic_style_warning_symbol = "W>"
		
		let g:syntastic_always_populate_loc_list = 1
		let g:syntastic_auto_loc_list = 1
		" let g:syntastic_check_on_open = 1
		let g:syntastic_check_on_wq = 1
		
		"no need to check header, will check header when check .c/.cpp
		let g:syntastic_c_check_header = 0
		let g:syntastic_cpp_check_header = 0
		
		" for per-project configuration files
		set exrc
		" disable unsafe commands in your project-specific .vimrc
		set secure
		EOF
}

