" --- 1. Configurações Básicas ---
syntax on                " Liga a sintaxe
filetype plugin indent on  " Detecta tipo de arquivo e indentação
set number               " Mostra números das linhas
set tabstop=4            " Tabulação de 4 espaços
set shiftwidth=4         " Recuo automático de 4 espaços
set expandtab            " !! IMPORTANTE: Usa espaços em vez de TABS (essencial para Python)
set smartindent          " Indentação inteligente
set mouse=a              " Habilita o mouse no vim
set encoding=utf-8       " Define o encoding padrão
set scrolloff=8          " Mantém 8 linhas de contexto acima/abaixo do cursor

" --- 2. Lista de Plugins (vim-plug) ---
call plug#begin('~/.vim/plugged')

" Um tema de cores popular
Plug 'morhetz/gruvbox'

" Tema onedark
Plug 'joshdick/onedark.vim'

" Tema zenbones
Plug 'zenbones-theme/zenbones.nvim'
Plug 'rktjmp/lush.nvim'

" Explorador de arquivos (use Ctrl+n para abrir)
Plug 'preservim/nerdtree'

" Linting (verificação de erros) e Formatação
Plug 'dense-analysis/ale'

" Autocompletar e IntelliSense (LSP)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Suporte a Python no CoC (Opcional, mas recomendado)
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}

" Navegação e gerenciamento de arquivos
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Edição e produtividade
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Git
Plug 'tpope/vim-fugitive'

" Aparência
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Python
Plug 'Vimjas/vim-python-pep8-indent'

" Navegação
Plug 'easymotion/vim-easymotion'

" Debug
Plug 'puremourning/vimspector'

call plug#end()

" --- 3. Configuração dos Plugins ---

" Tema de Cores (OneDark)
set background=dark
colorscheme onedark

" NERDTree (Explorador de Arquivos)
" Mapeia Ctrl+n para abrir/fechar o explorador
map <C-n> :NERDTreeToggle<CR>

" ALE (Linting e Formatação)
" Você DEVE instalar as ferramentas: pip install flake8 black ruff
let g:ale_linters = {
\   'python': ['flake8', 'ruff']
\}
let g:ale_fixers = {
\   'python': ['black', 'ruff']
\}
let g:ale_fix_on_save = 1 " Formata automaticamente ao salvar (:w)

" CoC (Autocompletar / LSP)
" Mapeia 'gd' para "Ir para Definição" (Go to Definition)
nmap <silent> gd <Plug>(coc-definition)
" Mapeia 'K' para mostrar documentação (Hover)
nmap <silent> K <Plug>(coc-hover)

" Airline (Statusline)
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" FZF (Busca fuzzy)
" Mapeia Ctrl+p para buscar arquivos
nnoremap <C-p> :Files<CR>
" Mapeia Ctrl+f para buscar em buffers
nnoremap <C-f> :Buffers<CR>

" EasyMotion
" Mapeia <Leader><Leader>w para navegação rápida
map <Leader><Leader>w <Plug>(easymotion-w)
map <Leader><Leader>b <Plug>(easymotion-b)

" Vimspector (Debug)
" F5 = Iniciar/Continuar debug
nnoremap <F5> :call vimspector#Launch()<CR>
" F3 = Pausar
nnoremap <F3> :call vimspector#Stop()<CR>
" F4 = Restart
nnoremap <F4> :call vimspector#Restart()<CR>
" F9 = Toggle breakpoint
nnoremap <F9> :call vimspector#ToggleBreakpoint()<CR>
" F10 = Step over
nnoremap <F10> :call vimspector#StepOver()<CR>
" F11 = Step into
nnoremap <F11> :call vimspector#StepInto()<CR>
" F12 = Step out
nnoremap <F12> :call vimspector#StepOut()<CR>
