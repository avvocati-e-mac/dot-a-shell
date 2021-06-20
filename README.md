# Configurazione di Vim pensata per a-Shell

Questa è l’evoluzione del mio `.vimrc` pensato esclusivamente per [a-Shell](https://holzschu.github.io/a-Shell_iOS/) ed in base alle sue specifiche limitazioni (attuali).

## .profile

a-Shell permette di personalizzare  il “Terminale”. Ho quindi aggiunto una prima bozza di _profilo_ personalizzatto. In particolare allo stato ho inserito:

- Scorciatoie per `ls`
- Scorciatoia per caricare una colorazione del terminale con i toni del [Nord Theme](https://www.nordtheme.com) che amo.

## .vimrc

Allo stato ho fatto un po' di pulizia del mio `.vimrc` che uso su Mac (tolti in particolare tutti i plg-in che, allo stato, non sono comodissimi da utilizzare in a-Shell). Ho anche dovuto fare un po' di debug perché con le ultime versioni della _beta_ di a-Shell con la mia iniziale configurazione del `.vimrc` a-Shell andava in crash. Il problema credo sia legato ad alcune cartelle in cui salvavo la _undolist_ ed i file di _swap_ di Vim … ho deciso per il momento di commentare quella parte del  `.vimrc`.
