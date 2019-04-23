SwitchCase
==========

Vim plugin for changing between CamelCase and snake_case

Installation and Configuration
------------------------------

To install, use your favorite plugin manager, i.e. with
[VimPlug](https://github.com/junegunn/vim-plug):

    Plug 'klund1/vim-switchcase'

This plugin provides four commands for changing the case of the word under the
cursor. My configuration maps the commands to the following patterns:

    " SwitchCase configuration
    nnoremap <leader>cs :SwitchSnakeCase<cr>
    nnoremap <leader>cS :SwitchCapitalSnakeCase<cr>
    nnoremap <leader>cc :SwitchCamelCase<cr>
    nnoremap <leader>cC :SwitchCapitalCamelCase<cr>
