#!/bin/bash

echo "Build the docker"

docker build . --progress=plain -t rkrispin/linkedin_dash:0.0.0.9000

if [[ $? = 0 ]] ; then
echo "Pushing docker..."
docker push rkrispin/linkedin_dash:0.0.0.9000
else
echo "Docker build failed"
fi