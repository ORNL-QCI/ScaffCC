To build scaffold and create and extract the Deb package, run the following 

```bash
docker build -t namespace/imagename . 
   && docker run -d -P -it --name scaffcc namespace/imagename 
   && id=$(docker ps -aqf "name=scaffcc") && docker cp $id:/projects/scaffold_2.0_amd64.deb . 
   && docker stop scaffcc
```
This will leave you with the scaffold_2.0_amd64.deb on your localhost. 

To install in an Ubuntu box (or docker image, docker pull ubuntu:latest), 
simply run 
```bash
apt-get install -y $(dpkg --info scaffold_2.0_amd64.deb | grep Depends | sed "s/.*ends:\ //" | sed 's/,//g')
dpkg -i scaffold_2.0_amd64.deb
```

This will install the scaffcc compiler to 
```bash
/usr/local/scaffold
```
So add this to your PATH variable to invoke scaffcc on 
*.scaffold files
