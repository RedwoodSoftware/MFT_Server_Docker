#!/bin/bash
export AWS_ACCESS_KEY_ID=@AWS_KEY@
export AWS_SECRET_ACCESS_KEY=@AWS_SECRET@
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin @AWS_HOST@
cd "${0%/*}"
docker build -f @DOCKER_FILE@ -t @TAG@ .
docker push @TAG@
