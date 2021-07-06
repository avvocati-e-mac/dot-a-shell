
# Velocizzare i "salti" tra cartelle

alias das=jump dot-a-shell
alias sm=showmarks
alias aem=jump AeM
alias rndas=renamemark "dot a-shell" dot-a-shell

# Salvataggio in Working Copy dei file di configurazione
alias cpvimrc=cp .vimrc "~dot-a-shell/.vimrc"
alias cprofile=cp .profile "~dot-a-shell/.profile"


# Cambiare cartella velocemente

alias ins= cd "~AeM/in\ scrittura"


# Velocizzare ls
alias lsa=ls -a
alias lst=ls -t
alias ll=ls -l

# Configurazione colori in stile Nord Theme per a-Shell (chiara e scura)
alias norddr=config -b #434C5E -f #8FBCBB && config -s 18 && config -n Menlo
alias nordlg=config -b #ECEFF4 -f #5E81AC && config -s 18 && config -n Menlo
alias iterm=config -b #2e3340 -f #d8dee8 && config -s 18 && config -n Menlo
