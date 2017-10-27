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

## delete remote branch
git push --delete <branchname>

## delete merged local branch
git branch -d <branchname>

## delete local branch irrespective of its merge status
git branch -D <branchname>

## delete last 2 commits
git reset --hard HEAD^^
git reset --hard HEAD^2
git reset --hard HEAD~2

## squash last x commits
git rebase -i HEAD~x

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
  cat to_print.pdf | ssh <username>@rzssh1.informatik.uni-hamburg.de lpr -Pd116_sw

# Vim 
* search caseinsensitive for root
  \croot 

# NCDU - command line disk usage analyzer
ncdu -x /

## DB
#### clean db
sudo psql -d <dbname> -f input.sql
#### psql anmelden
psql -h127.0.0.1 -U postgres -W <dbname>
#### psql commands
\q -> quit
\l -> list databases
\c -> connect to database
\d -> list tables etc.

#### psql dump example
# create local dump
pg_dump -h localhost -U postgres -W <dbname> > output.sql

# login at <host> create new db
psql -h <host> -U postgres -W template1
drop database <dbname>;
CREATE DATABASE <dbname> ENCODING 'UNICODE' TEMPLATE template0 LC_COLLATE 'de_DE.UTF-8' LC_CTYPE 'de_DE.UTF-8';
\q

# fill the db with the dump
psql -h <host> -U postgres -W <dbname> < input.sql

# psql maintanance
# delete old entries
VACUUM <tablename>
# update statisticale information
ANALYZE <tablename>
# explain the execution of a query
EXPLAIN <query>;
# config
# enable config setting
set log_lock_waits=on;
# print config setting
show log_lock_waits;

#### psql queries
# display all active queries
SELECT datname,usename,procpid,client_addr,waiting,query_start,current_query FROM pg_stat_activity ORDER BY datname, query_start;

## mysql commands
#### connect
mysql -u $DBUSER -p $DBPASSWD $DATABASE
#### create dump
/pfad/zu/mysqldump -u$DBUSER -p$DBPASSWD -h$DBHOST $DATABASE > $FILENAME
#### insert dump
/pfad/zu/mysql -u $DBUSER -p$DBPASSWD --database=$DATABASE < $FILENAME
#### Table Description
desc <tablename>
#### client starten mit utf8 encoding
mysql -u root --default-character-set=utf8
# oder normale starten und im mysql client aufrufen:
set names utf8;
#### create new database
CREATE DATABASE dbname CHARACTER SET utf8 COLLATE utf8_general_ci;
#### Query to csv file
SELECT * FROM <table> INTO OUTFILE '/tmp/actual.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

## java
#### profiling
creating a dump of the vm memory
jmap -dump:format=b,file=filename.bin <pid>

listing heap information
jmap -heap <pid>
analysing the dump
jhat -J-mx768m -stack false heap.bin

creating hprof file vmarg
-XX:+HeapDumpOnOutOfMemoryError
use eclipse memory analyzer
#### jstat
# find out the usage percentage of the vom memory
jstat -gcutil <pid>
# find out the absolut capacity and usage of the vm memory
jstat -gc <pid>

#### mercurial
# create a diff of two revisions (here 0 and 31)
hg diff -r 0 -r 31 che_texts_en.properties  > props_en.diff

# add and remove files from the index
hg addremove

# show number of commits ahead
hg summary --remote

# drop all uncommited changes in the actual folder
hg update -C .

# show graph with length 20 revisions
hg log -G -l20

# create new branch
hg branch <branchname>

# show actual branch
hg branch

# show all branches
hg branches

# neuen remote branch pushen
hg push --new-branch

# feature- / fix-branch schließen
hg up fix-branch
hg commit --close-branch
hg up default
hg merge fix-branch
# der nächste push aufruf muss mit force erfolgen, da der branch geschlossen wird
hg push -f

# branch in default branch mergen
hg update default
hg merge branch

# checkout revision 529:d2868eec319b
hg update -r d2868eec319b

# what's there to commit
hg out

# switch to branch (drops all uncommited changes)
hg update -C <branchname>

# list all deleted files in all revisions
hg log --template "{rev}: {file_dels}\n"

# move changes to different branch
hg diff > ../diff.txt
hg up -C <branchToApplyTheChanges>
hg import --no-commit ../diff.txt
rm ../diff.txt

#### subversion / svn
# checkout repo
svn co svn+ssh://<user>@<host><path>
# update repo
svn update
# tag a version, in svn a tag is just a copy of the revision in the tags folder
svn copy svn+ssh://<user>@<host><path> svn+ssh://<user>@<host><path> -m 'Comment'
# for the revision 314 add
-r 314
# delete tag
svn delete http://example.com/svn/tags/tag-to-delete -m "Tag no longer needed"


#### recode
# recode a file from an encoding to another
recode ISO-8859-15..UTF-8 che_texts_de.properties

#### vim
# format an xml file
:set filetype=xml
:filetype indent on
gg=G

#### update-rc.d
# disable service without deleting init script
update-rc.d -f <serviceName> remove

#### cron
# change crontab of the actual user (no restart of daemon needed)
crontab -e

#### tools
# delete duplicate lines in a file
sort -u
# create dummy file of x bytes
dd if=/dev/zero of=my_xb_file bs=<x> count=1
# merge two files by alternating their lines (first line is taken from first file)
paste conditions.txt rules.txt | tr '\t' '\n' > rules-and-conditions.txt
# find recursively files by pattern and remove them
find . -name "*.exe" -exec rm -f '{}' +
#### tar
# compress folder or file
tar cfvz <folger or filename>.tar.gz <folder or filename>

# compress multiple folders
tar cfvz ndr-rezepte.tar.gz ndr-rezepte/ ndr.rezepte.demo/

# expand tar.gz or .tgz file
tar xfvz <filename>.tar.gz

#### zip
# zip a folder
zip -r <zipfilename> <folderpath>

#### sed
# remove a regex from each line
sed 's:^.*Fehler beim Lesen der Ressource aus dem Pfad \"/sites/default/_categories::' < input.txt > output.txt

#### Benutzerverwaltung
# add a user to a group, relogin to see the change if changing actual user
usermod -aG <groupname> <username>
# normalen Benutzer anlegen (nicht useradd verwenden)
adduser <username>

#### Eclipse
# Fix freeze in Loading workspace
find ~/workspace/.metadata -name "*.snap" -exec rm -f '{}' +

#### mvn
# debug output very verbose!
mvn -X
# generate effective pom
mvn help:effective-pom

#### Rsync mit Resume über ssh
# -e ssh rsync will use ssh client instead of rsh
# -z compress file transfer
# -t preserve time (other attributes as owner or permissions are also possible)
# -l copy symlinks as symlinks
# -P resume incomplete file transfer
# -p preserve permissions
# -t preserve modification times
# -g preserve group
# -o preserve owner
# -r recursive into subdirectories
# -v verbose
# -D same as --devices --specials (preserve device and special files)
rsync -vrlPtz -e ssh host:/remote_path/* /local_path/
# archive files recurively (keep alle file metadata)
# equals -rlptgoD
rsync -a <from> <to>
# --dry-run don't do anything
# --delete delete extranous files in dest

#### Apache
# site enablen
a2ensite <sitename>
# site disablen
a2dissite <sitename>
# restart graceful without closing connections and config check
apache2ctl graceful

#### htpasswd
# create new file
htpasswd -c <filename> <username>
# add user or update password
htpasswd <filename> <username>
# delete user
htpasswd -D <filename> <username>

#### Samba
# User Accounts auflisten
pdbedit -L -v
# Add user to tdb database
pdbedit -a -u <username>
# restart samba
/etc/init.d/samba restart

#### Hadoop 2.6
# set replication factor to x of a file or all files in a folder
hdfs dfs -setrep <x> <folder-or-file>

#### iotop
# whatch only process doing io and accumulate io
iotop -a -o -P

#### jnettop
# monitor network traffic on a given interface
jnettop -i <interface>
