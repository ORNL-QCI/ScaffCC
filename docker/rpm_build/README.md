To build scaffold and create and extract the RPM, run the following 

```bash
docker build -t namespace/imagename . 
   && docker run -d -P -it --name scaffcc namespace/imagename 
   && id=$(docker ps -aqf "name=scaffcc") && docker cp $id:/projects/scaffold-1.0-1.fc25.x86_64.rpm . 
   && docker stop scaffcc
```
This will leave you with the scaffold-1.0-1.fc25.x86_64.rpm on your localhost. 

To install in a Fedora 25 box (or docker image, docker pull fedora:latest), 
simply run 
```bash
dnf install scaffold-1.0-1.fc25.x86_64.rpm
```

This will install the scaffcc compiler to 
```bash
/usr/local/scaffold
```
So add this to your PATH variable to invoke scaffcc on 
*.scaffold files
