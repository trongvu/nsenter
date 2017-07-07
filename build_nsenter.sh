#!/bin/bash
echo 'Building nsenter ....'
cd "$(dirname "$0")"
export current="$(dirname "$0")"
docker build . -t nsenter

echo 'Finish the build, copy output to bin folder'
mkdir -p bin
docker run --rm nsenter cat /nsenter > bin/nsenter
docker run --rm nsenter cat /importenv > bin/importenv
docker run --rm nsenter cat /docker-enter > bin/docker-enter
docker rmi nsenter
echo "Done, output @ $(pwd)/bin"