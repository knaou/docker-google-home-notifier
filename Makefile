IMAGE=registry.home/notifier

image:
	docker build -t ${IMAGE} .
push:
	docker push ${IMAGE}
all: image push

