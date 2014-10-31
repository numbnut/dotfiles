# APT
## apt-cache
### search for available package versions
apt-cache madison <package-name>
## apt-file
### look for packages containing a file
apt-file search <filename>

# Git
## Resolving Conflicts
* Unsere Version übernehmen
  git checkout --ours index.html
* Deren Version übernehmen
  git checkout --theirs index.html

## switch branch
* git checkout <branchname>

## create new branch
* git branch <branchname>

# Node.js
## install
sudo apt-get install build-essential, libssl-dev
// install nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
// install node via nvm
nvm ls-remote
nvm install <latest-version-number>
nvm use <latest-version-number>
// init npm project
cd <project-folder>
npm init
// install gulp globally
sudo npm install -g gulp
// install gulp locally
npm install --save-dev gulp
// install gulp plugins
npm install --save-dev gulp-zip

# OpenSSL
## View Certificate Details
openssl x509 -in owncloud.test.de.crt -text

# SSH
## SSH Tunnel
ssh root@owncloud.test.de -L 2000:192.168.178.5:8006

# Uni
* Drucken per lpr
  cat /home/niklas/Dropbox/uni/cscwcp/cscwcp-2013-mitschrift.pdf | ssh <username>@rzssh1.informatik.uni-hamburg.de lpr -Pd116_sw

# Vim 
* search caseinsensitive for root
  \croot 

