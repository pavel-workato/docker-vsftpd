#!/bin/sh

if [ "$1" = 'ftp' ]; then
 echo "Launching vsftp on ftp protocol"
 exec /usr/sbin/vsftpd /etc/vsftp/vsftp.conf
fi

if [ "$1" = 'ftps' ]; then
 echo "Launching vsftp on ftps protocol"
 exec /usr/sbin/vsftpd /etc/vsftp/vsftp_ftps.conf
fi

if [ "$1" = 'ftps_implicit' ]; then
 echo "Launching vsftp on ftps protocol in implicit mode"
 exec /usr/sbin/vsftpd /etc/vsftp/vsftp_ftps_implicit.conf
fi

if [ "$1" = 'ftps_tls' ]; then
 echo "Launching vsftp on ftps with TLS only protocol"
 exec /usr/sbin/vsftpd /etc/vsftp/vsftp_ftps_tls.conf
fi
