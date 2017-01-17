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
  "
  " 4. Install Plugins:
  "   Lauch `vim` and run `:PluginInstall`.
  "
  "   To install from command line excute `vim +PluginInstall +qall`.
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
    " Enable visual wrapping
    set wrap
    " Turns off physical line wrapping
    set textwidth=0
    set wrapmargin=0

    " Shows invisible characters using unicode characters.
    set nolist
    set listchars=space:·,tab:»\ ,eol:¬
    " Toggles between showing/hiding invisible characters.
    nnoremap <leader>l :set list!<CR> 


    " Makes settings conditional on 'modifiable' buffer.
    " Prevents E21 error while ediditing no modifiable buffers,
    " like vim help pages.
    au BufNewFile,BufRead * 
        \ if &l:modifiable |
        \ set tabstop=2 |
        \ set softtabstop=2 |
        \ set shiftwidth=2 | 
        \ set expandtab | 
        \ set autoindent | 
        \ set fileformat=unix |
        \ endif


    " Change leader key mapping to comma character.
    let mapleader=","

    " Specify areas of the screen where the splits should occur.
    set splitbelow
    set splitright

    " Jump between splits with just one key combination.
    " Use different key mappings for easy navigation between splits to
    " save a keystroke. 
    "
    " Instead of ctrl-w then j, it’s just ctrl-j:
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    " Enable code folding.
    set foldmethod=indent
    set foldlevel=99

    " Enable folding with the spacebar.
    nnoremap <space> za

    " Show commands as they are being typed (bottom-right)
    set showcmd
  " }

    
  " Plugins {

    " altercation/vim-colors-solarized {
        " Sets 256 colors as a based for Solarized theme, 
        " and helps override terminal settings. Sometimes
        " if terminal has Solarized theme, Vim's colors get
        " inverted.
        let g:solarized_termcolors=256
        set t_Co=256
        if has('gui_running')
            set background=light
        else 
            set background=light
        endif
        colorscheme solarized
    " }

    " tmhedberg/SimpylFold {
        " I want to see the docstring for folded code.
        let g:SimylFold_docstring_preview=1
    " }

    " Valloric/YouCompleteMe {
      " Remember: YCM is a plugin with a compiled component. If you update YCM
      " using Vundle and the ycm_core library APIs have changed (happens rarely),
      " YCM will notify you to recompile it. You should then rerun the install
      " process. To rerun the install please follow the documentation.
      "
      " Compiling YCM without semantic support for C-family languages:
      "
      "   apt-get install -y build-essential cmake python-dev python3-dev
      "   cd ~/.vim/bundle/YouCompleteMe
      "   ./install.py
      "
      " For more details follow official documentation.

      " By default YCM runs jedi with the same python interpreter used
      " by [ycmd], so if you would like to use a different interpreter,
      " use the following option specifying the python binary to use.
      if has("python3")
        let g:ycm_path_to_python_interpreter='/usr/bin/python'
        let g:ycm_python_binary_path = '/usr/bin/python'
      else
        let g:ycm_path_to_python_interpreter='/usr/bin/python3'
        let g:ycm_python_binary_path = '/usr/bin/python3'
      endif

      "let g:ycm_server_use_stdout=0
      "let g:ycm_server_keep_logfiles=1
      "let g:ycm_server_log_level='debug'
      let g:ycm_autoclose_preview_window_after_completion=1
      map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
      map <leader>d :YcmCompleter GetDoc<CR>
      " hint: to close preview window ':pc'
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
    " Shell {
      au BufNewFile,BufRead *.sh 
          \ set tabstop=4 |
          \ set softtabstop=4 |
          \ set shiftwidth=4 
    " }

    " Python {
      " By default configuration supports VIM being built with +python3 support.
      "
      let python_highlight_all=1
      " Add the proper PEP8 indentation, add the following.
      au BufNewFile,BufRead *.py 
          \ set tabstop=4 |
          \ set softtabstop=4 |
          \ set shiftwidth=4 

      " Mark extraneous whitespace.
      highlight BadWhitespace ctermbg=red guibg=red
      au BufNewFile,BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

      " Compatible way to use either :py or :py3.
      if has("python3")
        command! -nargs=1 Py py3 <args>
      else
        command! -nargs=1 Py py3 <args>
      endif

      " Python with VirtualEnv support
      Py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    # For python2:
    #execfile(activate_this, dict(__file__=activate_this))
    # For python3:
    exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF
    " }
    
    " Java, Groovy {
      au BufNewFile,BufRead *.java,*.groovy
          \ set tabstop=4 |
          \ set softtabstop=4 |
          \ set shiftwidth=4 
    " }

    " Full Stack Development (js, html, css) {
      au BufNewFile,BufRead *.js,*.html,*.css
          \ set tabstop=2 |
          \ set softtabstop=2 |
          \ set shiftwidth=2
    " }
  " }
" }
