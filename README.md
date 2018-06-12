# docker_qgis
Container-based QGis from debian stable distribuition with shared display.

## NOTES [2018/06/12]
 - Actual size of the created image is circa 1.5 Gb.

 - Launch script will be placed in /usr/bin directory with the name qgis_d

 - Shared folder will be placed in HOME directory with the name qgis_d_projects, all its contents will be available inside container's HOME.

## BASIC COMANDS:
### Create container:
```bash
$ git clone https://github.com/Burgeon-SCP/docker_qgis
$ cd docker_qgis
$ ./set_docker_qgis.sh
```

### Use container [will request sudo permission if needed]:
```bash
$ qgis_d
```
### Or you can also access console inside container:
```bash
$ qgis_d bash | python | <ScriptsFromPATH>
```
