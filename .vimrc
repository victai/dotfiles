set hls
set ai
set tabstop=4
set softtabstop=4
set expandtab
set nu
set mouse=a
set shiftwidth=4
set foldmethod=indent
set foldnestmax=3
set foldlevel=3
set clipboard=unnamedplus
set fileencodings=utf8,big5,gbk,latin1
set fileencoding=big5
set <C-u>=^U
set <C-b>=^B
map <C-u> :set fileencoding=utf8
map <C-b> :set fileencoding=big5
filetype  indent on
filetype  plugin on

function! s:swap_lines(n1, n2)
	let line1 = getline(a:n1)
	let line2 = getline(a:n2)
	call setline(a:n1, line2)
	call setline(a:n2, line1)
endfunction
	
function! s:swap_up()
	let n = line('.')
	if n == 1
		return
	endif			
	call s:swap_lines(n, n - 1)
	exec n - 1
 endfunction
			  
function! s:swap_down()
	let n = line('.')
	if n == line('$')
		 return
	endif
						  
	call s:swap_lines(n, n + 1)
	exec n + 1
endfunction
						
noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>
set background=dark
set t_Co=256

"ctags
set tags=./tags,./TAGS,tags;~,TAGS;~

"taglist
nmap <F8> :TlistToggle<CR><CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
set ut=100

"cscope
set cscopetag
set csto=0

if filereadable("cscope.out")
       cs add cscope.out   
elseif $CSCOPE_DB != ""
       cs add $CSCOPE_DB
endif
set cscopeverbose

nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>

"nerdtree
nmap <F9> :NERDTreeToggle<CR><CR>
let NERDTreeWinPos=1

"SrcExpl
nmap <F10> :SrcExplToggle<CR>
let g:SrcExpl_pluginList = ["__Tag_List__","_NERD_tree_"]

"Trinity
nmap <F7> :TrinityToggleAll

