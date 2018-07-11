#!/bin/sh

echo "########################"
echo "*** Preparing to push ***"
echo "########################"

validate () {
	if [ "$?" -ne 0 ]; then
		echo "Something went wrong :("
		exit 1
	else
		echo "OK"
	fi
}

REGISTRY="linuxfacilito.online:5043"
IMAGE="hello-world"

echo "*** Logging in ***"
docker login -u ricardo -p $PASS $REGISTRY | grep -v WARN
validate
echo "*** Tagging image ***"
docker tag hello-world $REGISTRY/$IMAGE:$BUILD_TAG
validate
echo "*** Pushing image ***"
docker push $REGISTRY/$IMAGE:$BUILD_TAG
validate
