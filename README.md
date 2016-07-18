## Requirements

* [Docker](https://docs.docker.com/engine/installation/ "Instalation")
* [Docker Compose](https://docs.docker.com/compose/install/ "Instalation")

##### How to use docker without `sudo`
[Refference to official docs](https://docs.docker.com/engine/installation/linux/ubuntulinux/#/create-a-docker-group)

### Setup Service discovery
DNS listening port needs to be bound to the *docker0* inferface so that its
available to all containers. To avoid this IP changing during host restart add
it to the docker default options.

- If you use systemd (present on Fedora and recent Ubuntu versions), edit
`/lib/systemd/system/docker.service` and add
`--bip=172.17.42.1/24 --dns=172.17.42.1` to the command you will see in the
`ExecStart` section, the run `sudo systemctl daemon-reload`.

- If you do not, Open file `/etc/default/docker` and add `--bip=172.17.42.1/24
--dns=172.17.42.1` to `DOCKER_OPTS` variable.

Restart docker daemon after you have done that (`sudo service docker restart`).

Also, to let the host machine discover the containers add `nameserver 172.17.42.1` to your `/etc/resolv.conf`.

ddns command 
```docker run --name 'ddns' --restart=unless-stopped -d -v '/var/run/docker.sock:/run/docker.sock' -p '172.17.42.1:53:53/udp' tonistiigi/dnsdock -domain='docker' -http=':8080'```

##Rename project 'namespace'
use ```./rename.sh new_project_name``` to rename you new project "namespace"
after that yours "mysql" and "nginx" will be available by host names "db.new_project_name.docker" and "site.new_project_name.docker"

## Use
In the *./compose* folder
```bash
[sudo] docker-conpose up [-d]
```
 (```-d``` - run in detached mode)

**First start will be long!**

##Available

* database host = `db.my_project.docker` dbname=my_db, user=my_db_user, password=my_db_password
* site host = `site.my_project.docker`

##Artisan
available via artisan.sh

## TODO:
* composer install
