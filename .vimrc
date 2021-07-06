" Spazio come Leaderkey
let mapleader=" "

filetype plugin on


" automatically leave insert mode after 'updatetime' milliseconds of inaction

au CursorHoldI * stopinsert

" Possibilità di usare il mouse con Vim
set mouse=a

" Configurazione Netrw (browser file di Vim)

let g:netrw_banner = 0		  " Toglie la barra in alto di spiegazioni
let g:netrw_liststyle = 3	  " Stile dell'alberatura dei file
let g:netrw_browse_split = 3  " File aperto in un nuovo tab (1 split orrizzontale, 2 split veritcale, 4 nella precedente finestra)
let g:netrw_winsize = 25	  " split di 25

set nocompatible				" vim-specific settings, non-vi-compatible
set backspace=indent,eol,start	" Allow backspace in insert mode
set number						" Line numbers
set relativenumber				" Conteggio numeri relativi rispetto alla linea in cui si è
set ruler
set showcmd						" Mostra i comandi incompleti in basso nella finestra
set hidden						" Allow hidden buffers
filetype plugin indent on	  	" Enable file type detection and do language-dependent indenting.
set history=1000				" Default = 8
set autoread					" Ricarica il file modificato in Vim

" ---- PROBLEMA con a-Shell 1.7.3 ----
" Dopo un tot di debug credo che sia dovuto alle gestione delle cartelle,
" comunque non sono funzioni fondamentali

" Gestione dei file di swap (tutti i file di swap di Vim verranno salvati in
" questa cartella)
" set directory=~/Documents/.vim/swp//	" Richiede prima la creazione della cartella: mkdir ~/.vim/swp

" Undo persistenti tra più sessioni di Vim
" set undofile
" set undodir=~/Documents/.vim/undodir

" ---- END PROBLEMA con a-Shell 1.7.3 ----
" nnoremap ; : – non mi ricordo perché l'ho inserita, da problemi con il ; mentre scirvo.

" --- PERSONALIZZAZIONE ASPETTO VIM ---
" Visualizzazione del testo
set encoding=utf-8				" Permette la visualizzazione di caratteri accentati come è
set showmode 					" Mostra il modo in ci si sta lavorando in Vim in basso a sinistra

" Utilizza tutto lo spazio a schermo
set display+=lastline

" Abilita la visualizzazione della sintassi di file
syntax enable

" Schema di colori
" colorscheme nord

set wildmode=longest,list,full 		" Attiva auto-completamento
set wildmenu 				" Mostra le opzioni di completamento della command line

" --- FINE --- PERSONALIZZAZIONE ASPETTO VIM ---

" --- FORMATTAZIONE DEL TESTO APERTO IN VIM ---

set tabstop=4					" Default tabs are too big
set wrap					" Fa scorrere il testo della finestra in base alle parole (wrap)
set linebreak					" Fa scorrere il testo in modo da non troncare le parole
set nolist					" list disables linebreak
set textwidth=0					" Evita a Vim di inserire automaticamente delle interruzioni di linea
set wrapmargin=0
set formatoptions-=t				" Don't change wrapping on existing lines
set formatoptions+=l				" Black magic

" --- FINE --- FORMATTAZIONE DEL TESTO APERTO IN VIM ---

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults. (Luke Smith)
	set splitbelow splitright

" Velocizza la navigazione nelle finestre di Vim (Luke Smith):
" Ctrl più i tasti direzionali di Vim sposta da un pannello all'altro se si sono aperti 1 o più split

	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Modifica dello split verticale delle finestre ± 5

	nnoremap  1 :vertical resize -5<cr>
	nnoremap  2 :vertical resize +5<cr>

" ----------------------	
" SCORCIATOIE A TASTIERA
" ----------------------

" Spell-check attiva / disattiva con <leader>o, 'o' per 'ortografia':
	map <leader>o :setlocal spell! spelllang=it,en_us<CR>

" Attiva e disattiva la colorazione del markdown
	map <leader>n :setlocal syntax=markdown<CR>

" Apre l'esplora risorse di Vim Netrw

	map <leader>e :Vexplore<CR>

" Salva documento
  	nmap <leader>w :w<CR>

" Apri .vimrc (idea presa da Luke Smith)
	map <leader>v :vsp<Space>~/Documents/.vimrc<CR>

" Ricarica il .vimrc
	map <leader>s :source<Space>~/Documents/.vimrc<CR>

" Aprire WhicKey - schiacciare una sola volta [spazio](spazio) 
	nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Aprire il file che si sta modificando in Marked 2
"	:nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>

" Ridisegna la schermata di Vim (quando l’apertura di app come Marked 2
" confondono la finestra principale di Vim) 

	:noremap <leader>r :silent redraw!<cr>

" Aprire file md convertito in PDF
	map <leader>p :!view "%:r.pdf"<CR>

" Compila il file TEX  aperto in PDF con opzione base
	map <leader>c :w! \| !lualatex "%"<CR>

" Rende visibile i caratteri nascosti, come ad esempio gli spazi a fine riga, e i caratteri di tabulazione
	nmap <leader>l :set list!<CR>

" Mostra i caratteri nascosti (TAB, fine riga e spazio bianco non separabile)

:set listchars=tab:▸\ ,eol:¬,trail:\ ,nbsp:␣

" Inserimento documenti per PCT in Virtual block mode / Visuale Blocco
	vnoremap <leader>w I[doc00]: <esc>

" Test conversione doc .1 in [doc. 1][doc01]
	
	map <leader>u :%s/\([Dd]oc.\)\(\s\|\W\)\(\d\+\)/[\1 \3][doc\3]/g<CR>:%s/\[\(doc\)\(\d\)]/\[\10\2]/g<CR>

	
  " map <leader>u di(i[<esc>pa][doc01]<esc>

" Salvare il documento ogni volta che si preme Esc quando si esce da Insert Mode
" inoremap <Esc> <Esc>:w<CR>

" Ripiegamento (fold) in MD chiama la funziona a fine del .vimrc per il folding del markdown

	nmap <leader>f :call MarkdownFoldText()<CR>

" ---------------------
" FINE SCORCIATOIE
" ---------------------

" Documentazione in italiano ed inglese (c'è da scaricare però la documentazione tradotta in italiano da http://www.pluto.it/files/ildp/traduzioni/vimhelp-it/index.html)
:set helplang=it,en

" Sposta le righe su e giù semplicemente tenendo premuto CTRL e spostando la riga con le frecce in alto e in basso.

map <C-Up> ddkP
map <C-Down> ddp


" Carica il filetype giusto per LaTeX … si spera
autocmd BufRead,BufNewFile *.tex set filetype=tex

" AUTOMAZIONI UTILI

" Gestine delle parentesi e delle virgolette
inoremap <> <><Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap “” “”<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

" Navigare con le guide (utile per spostarsi velocemente con dei segnaposti)

 inoremap <leader>; <Esc>/<++><Enter>"_c4l
 vnoremap <leader>; <Esc>/<++><Enter>"_c4l
 map <leader>; <Esc>/<++><Enter>"_c4l

" SCORCIATOIE LATEX
" INSERT MODE
	" Enfatizzato
	autocmd FileType tex inoremap xem \emph{}<++><Esc>T{i
	" Grassetto
	autocmd FileType tex inoremap xbf \textbf{}<++><Esc>T{i
	" Corsivo
	autocmd FileType tex inoremap xit \textit{}<++><Esc>T{i
	" Item
	autocmd FileType tex inoremap xte \item<space>
	" Citazione
	autocmd FileType tex inoremap xcq \quote{}<++><Esc>T{i
	" Smallcap
	autocmd FileType tex inoremap xsc \textsc{}<Space><++><Esc>T{i
	" Link / ref
	autocmd FileType tex inoremap xrf \href{}<Space><++><Esc>T{i
	" Link a file
	autocmd FileType tex inoremap xfr \href{run:}{<++>}<Space><++><Esc>T:i
	" Nuovo Comando
	autocmd FileType tex inoremap xnc \newcommand{\}{<++>}<Esc>T\i
" VISUAL MODE
	" Grassetto
	autocmd Filetype tex vnoremap <leader>b c\textbf{<Esc>pi}<Esc>
	" Corsivo
	autocmd Filetype tex vnoremap <leader>i c\textit{<Esc>pi}<Esc>
	" Link
	autocmd Filetype tex vnoremap <leader>'l c\href{}{<Esc>pa}h%hi
	" Link dalla clipboard di macOS
	autocmd Filetype tex vnoremap <leader>'p c\href{<Esc>"+pa}{<Esc>pi}<Esc>

" NORMAL MODE
	" Testo centrato
	autocmd Filetype markdown,rmd,md nmap <leader>tc o\begin{center}<enter><tab><enter>\end{center}<enter><++><esc>kki
	autocmd Filetype tex nmap <leader>tc o\begin{center}<enter><tab><enter>\end{center}<enter><++><esc>kki
	" Testo a destra
	autocmd Filetype markdown,rmd,md nmap <leader>tr o\begin{flushright}<enter><tab><enter>\end{flushright}<enter><++><esc>kki
	autocmd Filetype tex nmap <leader>tr o\begin{flushright}<enter><tab><enter>\end{flushright}<enter><++><esc>kki
	" Elenco puntato
	autocmd Filetype tex nmap <leader>ti o\begin{itemize}<enter><tab><enter>\end{itemize}<enter><++><esc>kki
	" Elenco numerato
	autocmd Filetype tex nmap <leader>te o\begin{enumerate}<enter><tab><enter>\end{enumerate}<enter><++><esc>kki

" SCORCIATOIE MARKDOWN

	" Testo centrato in insert mode
	autocmd Filetype markdown,rmd,md  inoremap xtc \begin{center}<Enter><Enter>\end{center}<enter><++><esc>kkA
	" Grassetto parola selezionata mentre si scrive / insert mode
	autocmd Filetype markdown,rmd,md inoremap xbb <Esc>bi**<Esc>ea**
	" Grassetto in modalità visuale
	autocmd Filetype markdown,rmd,md vnoremap <leader>b c**<Esc>pi**<Esc>
	" Corsivo in modalità visuale
	autocmd Filetype markdown,rmd,md vnoremap <leader>i c_<Esc>pi_<Esc>
	" Link in modalità visuale
	autocmd Filetype markdown,rmd,md vnoremap <leader>l c[<Esc>pi](<++>)
	" Link dalla clipboard di macOS in modalità visuale
	autocmd Filetype markdown,rmd,md vnoremap <leader>p c[<Esc>pi](<Esc>"+pa)<Esc>

" Generale: converte accento e lettara in lettera accentata ed euro in €

inoremap `e è
inoremap 'e é
inoremap `e è
inoremap `a à
inoremap `i ì
inoremap `o ò
inoremap `u ù
inoremap `E È
inoremap 'E É
inoremap `E È
inoremap `A À
inoremap `I Ì
inoremap `O Ò
inoremap `U Ù
inoremap euro €
inoremap x" “
inoremap x' ‘

" Incidazione di dove si trovano i sinonimi

" set thesaurus+=~/.vim/thesaurus/thesaurus.txt

" TEST fuzione di sinonimi

" function! s:thesaurus()
"      let s:saved_ut = &ut
"      if &ut > 200 | let &ut = 200 | endif
"      augroup ThesaurusAuGroup
"          autocmd CursorHold,CursorHoldI <buffer>
"                      \ let &ut = s:saved_ut |
"                      \ set iskeyword-=32 |
"                      \ autocmd! ThesaurusAuGroup
"      augroup END
"      return ":set iskeyword+=32\<cr>vaWovea\<c-x>\<c-t>"
" endfunction
"  
"  nnoremap <expr> <leader>t <SID>thesaurus()

" SCRIPT per aprire un file sotto il cursore con il comando open di a-Shell
" funziona anche per gli URL

noremap gO :!open <cfile><CR>

"  Settaggi base delle ripiegature (fold)

set foldmethod=syntax
set foldlevelstart=1

let vimsyn_folding='af' " Vim script (tra cui il .vimrc)

" Visualizzazione grafica del livello di ripiegatura (fold)

set foldcolumn=3

" Salvataggio delle ripiegature (fold)

" augroup auto_save_folds
" autocmd!
" autocmd BufWinLeave * mkview
" autocmd BufWinEnter * silent loadview
" 

" FUNZIONE PER RIPIEGARE I CAPITOLI NEI FILE IN MARKDOWN (fold)

" Se è un file di tipo MD allora fai partir la funzione

setlocal foldmethod=expr
setlocal foldexpr=MarkdownFolds()
setlocal foldtext=MarkdownFoldText()


function! MarkdownFolds()
	let thisline = getline(v:lnum)
	if match(thisline, '^###') >= 0
		return ">3"
elseif match(thisline, '^##') >= 0
		return ">2"
elseif match(thisline, '^#') >= 0
		return ">1"
	else
		return "="
	endif
endfunction


function! MarkdownFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart

    let i = v:foldstart
    let foldWords=0
    while (i<v:foldend)
      let lineWords = len(split(getline(i)))
      let foldWords = foldWords + lineWords
      let i += 1
    endwhile
    let wordCount = wordcount()["words"]

    let foldWords = v:foldend,v:foldstart!wc -w
    let foldWordsStr = " " . foldWords . " parole, "
    let foldSizeStr = foldWordsStr . foldSize . " l "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let foldPercentage = printf("[%.1f", (foldWords*1.0)/wordCount*100) . "%] "
	" let expansionString = "."
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
    " return line . expansionString . foldSizeStr . foldPercentage . foldWordsStr . foldLevelStr
    " return line . "......" . foldSizeStr . foldPercentage . foldLevelStr
endfunction

