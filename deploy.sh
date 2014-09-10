#!/bin/bash 

temporaryFolder=/tmp/homepage_deployment
rsyncTemporaryFolder=/tmp/homepage_rsync
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

echo "copy new data to the server"
rm -fR ${rsyncTemporaryFolder}
mkdir ${rsyncTemporaryFolder}
rsync -r -v -t --delete --human-readable --temp-dir=${rsyncTemporaryFolder} ${temporaryFolder}/ ${ftpMountPoint}
chmod -R 755 ${ftpMountPoint}/*

echo "unmount the ftp server"
fusermount -u ${ftpMountPoint}