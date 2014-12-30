all: build
build:
	docker pull jenkins
	docker build -t zoer/jenkins .
push:
	docker push zoer/jenkins
run:
	docker run -d -v /var/run/docker.sock:/var/run/docker.sock \
		--name jenkins -p 127.0.0.1:8043:8080 \
		-v /var/jenkins_home:/var/jenkins_home \
		-u root zoer/jenkins
attach:
	docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock\
		--name jenkins -p 127.0.0.1:8043:8080 \
		-v /var/jenkins_home:/var/jenkins_home \
		-u root zoer/jenkins /bin/bash

rm:
	docker rm -f jenkins 2>/dev/null || true

stop:
	docker stop jenkins

upgrade: build rm run
