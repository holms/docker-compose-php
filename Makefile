SHELL:=/bin/bash

install:
	sudo port -v install curl curl-ca-bundle wget python27 py27-pip gnupg
	sudo port -v install openssh +ssh_copy_id
	sudo port select --set python python27
	sudo port select --set pip pip27
	sudo pip -v install --upgrade pip
	sudo pip -v install docker-compose pyyaml

install_linux:
	sudo apt install -y curl git wget python2.7 python-dev python-pip gnupg apt-transport-https ca-certificates
	sudo pip install --upgrade pip
	sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	sudo bash -c 'echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list'
	sudo apt-get update
	sudo apt-get install -y docker-engine
	sudo service docker start
	-sudo groupadd docker
	-sudo gpasswd -a ${USER} docker
	sudo service docker restart

kill:
	-docker kill $(shell docker ps -q)

clean:
	-docker system prune -f 

destroy:
	-docker kill $(shell docker ps -q)
	-docker rm $(shell docker ps -a -q)
	-docker rmi -f $(shell docker images -q -f dangling=true)
	-docker rmi -f $(shell docker images -q)
	-docker volume ls -qf dangling=true | xargs docker volume rm
	-docker system prune -f

run:
	docker-compose up nginx

