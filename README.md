# docker-vsftpd

This is a docker container to launch vsftpd. It comes with 4 pre-defined configuration :

- ftp : FTP
- ftps : FTPS explicit
- ftps_implicit : FTPS implicit
- ftps_tls : FTPS explicit with high cypher (ssl_ciphers=HIGH)

It comes with a pre-defined user: `guest` with password `guest`.

To use
it: `docker run --rm --name vsftpd -p 20:20 -p 21:21 -p 990:990 -p 21100-21110:21100-21110 --env PASV_ADDRESS=127.0.0.1 vsftpd <configuration_name>`

After use: `docker kill vsftpd`

#### 0. Build image

First of all build docker image

```
docker build -t vsftpd 
```

Then able to run any of predefined config

#### 1. Simple FTP

```
docker run --rm --name vsftpd -p 20:20 -p 21:21 -p 990:990 -p 21100-21110:21100-21110 --env PASV_ADDRESS=127.0.0.1 vsftpd ftp
```

#### 2. Explicit FTPS

```
docker run --rm --name vsftpd -p 20:20 -p 21:21 -p 990:990 -p 21100-21110:21100-21110 --env PASV_ADDRESS=127.0.0.1 vsftpd ftps
```

#### 3. Implicit FTPS

```
docker run --rm --name vsftpd -p 20:20 -p 21:21 -p 990:990 -p 21100-21110:21100-21110 --env PASV_ADDRESS=127.0.0.1 vsftpd ftps_implicit
```

#### 4. Explicit FTPS with HIGH cypher

```
docker run --rm --name vsftpd -p 20:20 -p 21:21 -p 990:990 -p 21100-21110:21100-21110 --env PASV_ADDRESS=127.0.0.1 vsftpd ftps_tls
```

### Note about Passive mode

`PASV` is enabled, to use it you need to specify the `PASV_ADDRESS` env variable pointing to the IP address of the host
when launching the container and mapping the ports range `21100-21110`:

```
docker run -p 21:21 -p21100-21110:21100-21110 --env PASV_ADDRESS=127.0.0.1 vsftpd ftp
```

### Note about custom PEM certificate

For FTPS configurations, by default, PEM and PKCS-12 certificate keystore files are generated to `/etc/vsftpd/private`
location and are used by FTPS server. You can provide your own certificate keystore file, instead, by passing volume to
docker run command. 

For example, below command will have FTPS server use the provided certificate keystore PEM file
found at `/tmp/my_pem_file_dir` on the host machine. Make sure the file is named as `vsftpd.pem`.

```
docker run --volume "/tmp/my_pem_file_dir:/etc/vsftpd/private" vsftpd ftps
```

### Available volumes

Two volumes are defined:

- /home/guest : the FTP data directory of the guest user (the only available by default)
- /var/log/vsftpd : the log directory
