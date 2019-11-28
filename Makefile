OWNER_TEAM = ourveryown
IMAGE_NAME = amazon-corretto-jdk
VERSION = 1.8.0_232
VARIANT = b09_1
DOCKER_ID_USER ?= "ourveryown"
DOCKER_ID_PASS ?= "unknown"

build:
	docker build --tag ${OWNER_TEAM}/${IMAGE_NAME}:${VERSION}_${VARIANT} .
publish: build
	docker login -u ${DOCKER_ID_USER} -p ${DOCKER_ID_PASS}
	docker image push ${OWNER_TEAM}/${IMAGE_NAME}:${VERSION}_${VARIANT}
