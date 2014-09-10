#!/bin/bash 

temporaryFolder=/tmp/homepage_deployment
ftpMountPoint=/tmp/homepage_ftp
ftpServer=ftp://ftp32.world4you.com
ftpUser=ftp7917541
echo "enter ftp user password: "
read -e ftpPassword

echo "export the content of the repository"
rm -fR ${temporaryFolder}
hg archive ${temporaryFolder}
returnValue=$?

if [ ${returnValue} -ne 0 ];
	then
	echo "could not create an archive of the repository"
	exit 1	
fi

echo "delete not necessary files from the export"
rm ${temporaryFolder}/.hg_archival.txt
rm ${temporaryFolder}/deploy.sh

echo "mount the ftp server"
rm -fR ${ftpMountPoint}
mkdir ${ftpMountPoint}
curlftpfs ${ftpServer} ${ftpMountPoint} -o user=${ftpUser}:${ftpPassword},utf8
returnValue=$?

if [ ${returnValue} -ne 0 ];
	then
	echo "could not mount the ftp server with the following credentials:"
	echo "server: ${ftpServer}"
	echo "user: ${ftpUser}"
	echo "password: ${ftpPassword}"
	exit 1
fi

echo "delete old data on the server"
rm -fR ${ftpMountPoint}/*

echo "copy new data to the server"
rsync -a -v --progress --delete --human-readable ${temporaryFolder}/* ${ftpMountPoint}/

echo "unmount the ftp server"
fusermount -u ${temporaryFolder}