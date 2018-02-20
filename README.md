## Docker container with fli4l Buildroot
 
 This is a docker implementation of fli4l buildroot container for the fli4l developers.

 For more information please refer to [Official website](http://www.fli4l.de/) 
 or [Support forum](https://forum.nettworks.org)

### 1. Install docker

 This instruction works for a <b>Centos7</b> docker host. Other distributions 
 may need some adjustments.

```shell
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
...
sudo yum install docker-engine -y
...
sudo systemctl enable docker.service
...
sudo systemctl start docker.service
```

### 2. Build/Use the Container

You now have two options: 
- Build from scratch or 
- Pull the ready-made image from DockerHub. 

#### 2a Image from Docker Hub

```shell
sudo docker pull nettworksevtooling/fli4l-buildroot-developer
```

#### 2b Build from scratch

##### Pull repo from github

```shell
sudo git clone https://github.com/nettworks-e-V/fli4l-buildroot-developer.git
cd fli4l-buildroot-developer
```

##### Build image

```shell
sudo docker build -t nettworksevtooling/fli4l-buildroot-developer:latest .
```

### 3. Starting docker container

```shell
sudo docker run \
    --name fli4l-buildroot-developer** \
    -d \
    nettworksevtooling/fli4l-buildroot-developer:latest
```

#### 3.a Mountpoints

There are the following mountpoints available:

 * tbd...

These mountpoints can be used to mount folders from the host or other volumes
to store informations which should be persistant or should not everytime be 
recreated.

With the additional run parameter _-v <host-folder>:/data/work/_ you can mount 
a folder on the docker host which contains persistant data. So the run command 
may look like the following example:

```shell
sudo docker run \
    --name fli4l-buildroot-developer \
    -v /data/svn-checkout/:/data/work/ ...
```

#### 3.b Available options

tbd...

### 4. Useful commands

Check running / stopped container:

```shell
sudo docker ps -a
```

Stop the container

```shell
sudo docker stop fli4l-buildroot-developer
```

Start the container

```shell
sudo docker start fli4l-buildroot-developer
```

Get logs from container

```shell
sudo docker logs -f fli4l-buildroot-developer
```

Open cmdline inside of container

```shell
sudo docker exec -i -t fli4l-buildroot-developer /bin/bash
```
