#!/bin/bash -e
image_name=zongshun96/social-media-microservices
image_tag=1.03
full_image_name=${image_name}:${image_tag}

# cd "$(dirname "$0")" 
docker build --build-context project=/home/cc -t "registry-route-ai4cloudops-11855c.apps.shift.nerc.mghpcc.org/${full_image_name}" .
docker push "registry-route-ai4cloudops-11855c.apps.shift.nerc.mghpcc.org/$full_image_name"

# oc run my-test-pod \
#   --image=registry-route-ai4cloudops-11855c.apps.shift.nerc.mghpcc.org/zongshun96/social-media-microservices:1.03 \
#   --image-pull-policy=Always \
#   --restart=Never \
#   --rm -it \
#   -- /bin/sh -c '/bin/sh'


# head -n 1000 /usr/local/lib/python3.5/dist-packages/yaml/__init__.py

# registry-route-ai4cloudops-11855c.apps.shift.nerc.mghpcc.org/zongshun96/social-media-microservices:1.0
