
let g:my_experiment_scripts_root_dir = fnamemodify(expand("<sfile>"), ':p:h')

"usage: :'<,'>call PhpAccessor()
function! PhpAccessor() range
	let input_lines = join(getline(a:firstline, a:lastline),"\n")
	let output_lines = split(system("ruby ". g:my_experiment_scripts_root_dir . "/php/php_accessor.rb", input_lines), "\n")
	let failed = append(a:lastline, output_lines)
endfunction

" vim:set ft=vim sw=4 ts=4:
