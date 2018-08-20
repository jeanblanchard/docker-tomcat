#!/usr/bin/env sh

# Exit on first error
set -e

# Read parameters
. `dirname $0`/build/parseargs.sh

# Parameters check

if [ "$SHOW_HELP" = "true" ] || [ -z "$IMAGE_NAME" ]; then
  echo "Usage: $0 [options]"
  echo
  echo "Options:"
  echo " -n, --name, --image-name <name> The name of the docker image to test. REQUIRED"
  echo
  if [ "$SHOW_HELP" = "true" ]; then
    exit
  else
    exit 1
  fi
fi

# Tests

echo
echo "###"
echo "### Testing the image"
echo "###"

docker run -d --name "${IMAGE_NAME}_test" ${IMAGE_NAME}
docker run --rm --network "container:${IMAGE_NAME}_test" appropriate/curl --retry 10 --retry-connrefused http://127.0.0.1:8080
docker kill "${IMAGE_NAME}_test" || true
docker rm "${IMAGE_NAME}_test" || true
