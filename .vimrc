" VIM Configuration
"
" Vundle Installation Steps {
  " VIM has several extension managers, but the one which is strongly recommend is
  " Vundle. Think of it as pip for VIM. It makes installing and updating packages
  " trivial.
  "
  " 1. Get Vundle installed:
  "
  "   $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  "
  " This command downloads the Vundle plugin manager and chucks it in your VIM
  " bundles directory. Now you can manage all your extensions from the .vimrc
  " configuration file.
  "
  " 2. Add the file to your user’s home directory:
  "
  "   $ touch ~/.vimrc
  "
  " 3. Now set up Vundle in your .vimrc by adding the following to the .vimrc
  " file. 
" }

" Vundle Configuration {
  set nocompatible " required
  filetype off     " required
  set encoding=utf-8

  " Set the runtime path to include Vundle and initialize.
  " Alternatively, pass a path where Vundle should install plugins
  " call vundle#begin('~/some/path/here').
  set rtp+=~/.vim/bundle/Vundle.vim
" }

" Add Vundle Plugins { 
  call vundle#begin()

  " Let Vundle manage Vundle, required.
  Plugin 'gmarik/Vundle.vim'

  " Other Plugins {
    " note - after adding new plugin, run :PluginInstall
    " note - older versions of Vundle used Bundle instead of Plugin 
    "
    " Code folding.
    Plugin 'tmhedberg/SimpylFold'
    " Python code folding helper.
    Plugin 'vim-scripts/indentpython.vim'
    " Code completion.
    " note - read the docs for installation instructions
    Plugin 'Valloric/YouCompleteMe'
    " Syntax checking/highlighting.
    " Requires: pylint or flake8
    Plugin 'scrooloose/syntastic'
    " PEP8 checking.
    "Plugin 'nvie/vim-flake8'

    " Color schemes.
    " Currently set through a Terminal's preferences.
    Plugin 'altercation/vim-colors-solarized'

    " File browsing.
    Plugin 'scrooloose/nerdtree'

    " Fuzzy searching.
    Plugin 'kien/ctrlp.vim'

    " Git integration.
    Plugin 'tpope/vim-fugitive'

    " Powerline is a status bar that display multiple usefull things.
    "  - read documentaion
    "  - install powerline-enabled fonts
    "  - setup configuration ~/.vim/bundle/powerline/config_files/config.json
    Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
  " }

  " All of your Plugins must be added before the following line.
  call vundle#end()         " required
  filetype plugin indent on " required
" } 


" Settings {

  " Default {
    set number
    " Syntax highlighting.
    syntax on

    au BufNewFile,BufRead * 
        \ set tabstop=2 |
        \ set softtabstop=2 |
        \ set shiftwidth=2 | 
        \ set textwidth=79 |
        \ set expandtab | 
        \ set autoindent | 
        \ set fileformat=unix


    " Change leader key mapping to comma character.
    let mapleader=","

    " Specify areas of the screen where the splits should occur.
    set splitbelow
    set splitright

    " Jump between splits with just one key combination
    " (remap key combinations in normal mode).
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-W> <C-W><C-W>
    nnoremap <C-H> <C-W><C-H>
    nnoremap <C-L> <C-W><C-L>

    " Enable code folding.
    set foldmethod=indent
    set foldlevel=99

    " Enable folding with the spacebar.
    nnoremap <space> za
  " }

    
  " Plugins {

    " altercation/vim-colors-solarized {
        if has('gui_running')
            set background=light
            colorscheme solarized
        else 
            "set background=light
            set background=dark
            colorscheme solarized
        endif
    " }

    " tmhedberg/SimpylFold {
        " I want to see the docstring for folded code.
        let g:SimylFold_docstring_preview=1
    " }

    " Valloric/YouCompleteMe {
      let g:ycm_path_to_python_interpreter='/usr/bin/python'
      "let g:ycm_server_use_stdout=0
      "let g:ycm_server_keep_logfiles=1
      "let g:ycm_server_log_level='debug'
      let g:ycm_autoclose_preview_window_after_completion=1
      map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
    " }

    " scrooloose/nerdtree {
      " Ignore ~ and .pyc files in NERDTree.
      map <C-e> :NERDTreeToggle<CR>
      let NERDTreeIgnore=['\.pyc$', '\~$'] 
    " }

    " Lokaltog/powerline {
      set laststatus=2
      set t_Co=256
    " }
  " }

  " Language {

    " Python {
      let python_highlight_all=1
      " Add the proper PEP8 indentation, add the following.
      au BufNewFile,BufRead *.py 
          \ set tabstop=4 |
          \ set softtabstop=4 |
          \ set shiftwidth=4 | 
          \ set textwidth=79 |
          \ set expandtab | 
          \ set autoindent | 
          \ set fileformat=unix

      " Mark extraneous whitespace.
      highlight BadWhitespace ctermbg=red guibg=red
      au BufNewFile,BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

      " Python with VirtualEnv support
      py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
    " }

    " Full Stack Development (js, html, css) {
      au BufNewFile,BufRead *.js, *.html, *.css
          \ set tabstop=2 |
          \ set softtabstop=2 |
          \ set shiftwidth=2
    " }
  " }
" }
