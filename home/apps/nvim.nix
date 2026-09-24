{ pkgs, ... }:

{
  home.packages = [ pkgs.wl-clipboard ];

  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      gruvbox
      nerdtree
      vim-terraform
      indentLine
      vim-devicons
      lightline-vim
      vim-go
      plenary-nvim
      telescope-nvim
      vim-polyglot
      vim-gitgutter
    ];

    coc = {
      enable = true;
      settings = {
        "python.pythonPath" = ".venv/bin/python";
        "pyright.inlayHints.functionReturnTypes" = true;
        "python.formatting.provider" = "black";
        "python.formatting.blackPath" = "black";
      };
    };

    extraConfig = ''
      " === mapleader (leading key) ===
      let mapleader = ","

      " === NerdTree Plugin ===
      map <C-n> :NERDTreeToggle<CR>
      if empty(argv())
          au VimEnter * NERDTree
      endif
      let g:NERDTreeWinSize=30
      let NERDTreeMapActivateNode = 'l'
      let NERDTreeShowHidden=1

      " Resize NERDTree with leader + j/k
      nnoremap <leader>j :vertical resize -5<CR>
      nnoremap <leader>k :vertical resize +5<CR>

      " Alternative: use [ and ] for resizing
      nnoremap <leader>[ :vertical resize -5<CR>
      nnoremap <leader>] :vertical resize +5<CR>

      " === Window Jumping ===
      nnoremap <C-h> <C-w>h
      nnoremap <C-j> <C-w>j
      nnoremap <C-k> <C-w>k
      nnoremap <C-l> <C-w>l

      " === Fast Scrolling ===
      nnoremap <A-j> 10j
      nnoremap <A-k> 10k
      nnoremap <A-h> 10h
      nnoremap <A-l> 10l

      " === TELESCOPE Plugin ===
      " Find files using Telescope command-line sugar.
      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>

      " Using Lua functions
      nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
      nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
      nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
      nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

      " === GRUVBOX Plugin ===
      let &t_ut='''  " ensures no black screen when scrolling
      colorscheme gruvbox
      set background=dark
      " let g:gruvbox_contrast_dark = 'medium'

      " Better search highlighting - subtle background with border
      highlight Search cterm=underline ctermfg=yellow ctermbg=NONE guifg=#fabd2f guibg=NONE gui=underline
      highlight IncSearch cterm=reverse ctermfg=red ctermbg=black guifg=#fb4934 guibg=#282828 gui=reverse
      highlight CurSearch cterm=reverse ctermfg=red ctermbg=black guifg=#fb4934 guibg=#282828 gui=reverse

      " === Lightline Plugin ===
      let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }
      set noshowmode " since the -- INSERT -- is now obsolete

      " === INDENTAION ===
      set autoindent
      set smartindent
      set shiftwidth=2
      set tabstop=2
      set smarttab
      set expandtab
      autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
      let g:indentLine_char = '⦙'
      let g:indentLine_concealcursor = ""
      let g:indentLine_conceallevel = 0

      " === Liner Ruler ===
      set number
      set relativenumber
      " toggle relative and absolute numbering based on mode
      augroup LineNumberGroup
        autocmd!
        autocmd InsertEnter * :set norelativenumber
        autocmd InsertLeave * :set relativenumber
      augroup END

      " === SEARCH ===
      set ignorecase
      set incsearch
      set smartcase
      set wrapscan

      " Clear search highlights
      nnoremap <leader>fd :nohl<CR>
      nnoremap <CR> :nohl<CR>

      " === WRAPPING ===
      set nowrap
      nnoremap <leader>tw :set wrap!<CR>
      set formatoptions+=q
      set nojoinspaces

      " === PERSISTENCE ===
      set history=1000
      set undofile

      " === SYNTAX ===
      filetype plugin indent on
      syntax enable

      " === <Esc> remaps ===
      nnoremap fd <esc>
      inoremap fd <esc>
      vnoremap fd <esc>
      cnoremap fd <esc>
      if has('nvim')
        tnoremap <esc> <c-\><c-N>
      endif

      " === EXIT remap ===
      nnoremap <leader>w :w<CR>
      nnoremap <leader>q :q<CR>
      nnoremap <leader>wq :wq<CR>

      " === COPY CLIPBOARDS ===
      " primary
      noremap <Leader>y "*y
      noremap <Leader>p "*p
      " clipboard
      noremap <Leader>Y "+y
      noremap <Leader>P "+p

      " === COC.NVIM Configuration ===
      set hidden
      set nobackup
      set nowritebackup
      set cmdheight=2
      set updatetime=300
      set shortmess+=c

      " Use tab for trigger completion with characters ahead and navigate
      inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ CheckBackspace() ? "\<TAB>" :
            \ coc#refresh()
      inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

      function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction

      " Use <c-space> to trigger completion
      inoremap <silent><expr> <c-space> coc#refresh()

      " Use <cr> to confirm completion
      inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

      " Use `[g` and `]g` to navigate diagnostics
      nmap <silent> [g <Plug>(coc-diagnostic-prev)
      nmap <silent> ]g <Plug>(coc-diagnostic-next)

      " GoTo code navigation
      nmap <silent> gd <Plug>(coc-definition)
      nmap <silent> gy <Plug>(coc-type-definition)
      nmap <silent> gi <Plug>(coc-implementation)
      nmap <silent> gr <Plug>(coc-references)

      " Use K to show documentation in preview window
      nnoremap <silent> K :call <SID>show_documentation()<CR>

      function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
          execute 'h '.expand('<cword>')
        elseif (coc#rpc#ready())
          call CocActionAsync('doHover')
        else
          execute '!' . &keywordprg . " " . expand('<cword>')
        endif
      endfunction

      " Symbol renaming
      nmap <leader>rn <Plug>(coc-rename)

      " Format entire file or selected code
      xmap <leader>fm  <Plug>(coc-format-selected)
      nmap <leader>fm  :call CocActionAsync('format')<CR>

      " Toggle inlay hints (the greyed-in inferred types) on/off
      nmap <silent> <leader>ih :CocCommand document.toggleInlayHint<CR>

      " Auto-install coc extensions
      let g:coc_global_extensions = [
        \ 'coc-pyright',
        \ 'coc-terraform',
        \ 'coc-webview',
        \ 'coc-markdown-preview-enhanced',
        \ 'coc-yaml',
        \ 'coc-prettier',
        \ 'coc-rust-analyzer',
        \ ]

      " Markdown preview
      nnoremap <leader>mp :CocCommand markdown-preview-enhanced.openPreview<CR>
    '';
  };
}
