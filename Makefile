all: build
build:
	docker pull jenkins
	docker build -t zoer/jenkins .
push:
	docker push zoer/jenkins
run:
	docker run -d -v /var/run/docker.sock:/var/run/docker.sock \
		--name jenkins -p 127.0.0.1:8043:8080 \
		-v /var/jenkins:/var/jenkins_home \
		-u root --privileged zoer/jenkins
rm:
	docker rm -f jenkins 2>/dev/null || true
upgrade: build rm run
