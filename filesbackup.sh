#!/bin/bash
 
# Display All Hidden Dot Files In a Directory
# ls -a | egrep "^\." > backup_dotfiles.sh

# destination directory must exist!
DESTINATION="/home/jc/backupfiles"  # do not use a trailing slash (/)
 
# Colors
blue="\e[0;34m"
green="\e[1;32m"
red="\e[0;31m"
bold="\e[1;30m"
reset="\e[0m"
 
# file list (use trailing slash for directories)
# place a list of files you want to backup
FILES="
filesbackup.sh
compiz_start.sh
emerald_start.sh
.bashrc
.ssh/
.fonts/
.themes/
.vim/
.face
.conkyrc
.vimrc
.bash_profile
"
for file in $FILES  # loop through files
do
	# if file is a directory
   if [ -d $file ]; then
      mkdir -p $DESTINATION/$file #create file directory
      cp -R $HOME/$file* $DESTINATION/$file  # copy all files from that directory
      # if file is a normal file
   elif [ -f $file ]; then
      cp -f $HOME/$file $DESTINATION
   else
      echo -e "$red:: $file is not a file/directory! $reset"
   fi     
done
 
echo -e "$green:: Done! $reset"

echo "ARCHIVING BACKUP FILE:"
NOWDATE=`date +%d%m%y`
# tar cvf ~/backup_$NOWDATE.tar ~/backupfiles  produces  /home/jc/backupfiles
# when uncompressed, to preserve only directory name use as below:
tar cvf backup_$NOWDATE.tar backupfiles
echo -e "$green:: Done! $reset"

echo "UPLOADING BACKUP TO DROPBOX:"
~/Dropbox-Uploader-master/dropbox_uploader.sh upload backup_$NOWDATE.tar
echo -e "$green:: ...Done! $reset"

exit 0
