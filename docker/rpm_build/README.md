To extract the RPM, run the following 

```bash
docker build -t namespace/imagename . && docker run -d -P --rm -it --name scaffcc namespace/imagename && id=$(docker ps -aqf "name=scaffcc") && docker cp $id:/projects/scaffold-1.0-1.fc25.x86_64.rpm . && docker stop scaffcc
```
