# Vim 
* search caseinsensitive for root
  \croot 

# Uni
* Drucken per lpr
  cat /home/niklas/Dropbox/uni/cscwcp/cscwcp-2013-mitschrift.pdf | ssh 1wilcke@rzssh1.informatik.uni-hamburg.de lpr -Pd116_sw

# Git
## Resolving Conflicts
* Unsere Version übernehmen
  git checkout --ours index.html
* Deren Version übernehmen
  git checkout --theirs index.html
