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
#   -- python3 -c "import yaml, time; yaml.start_anomaly(name='cpu', duration=2, utilization=50); time.sleep(60)"

# oc run my-test-pod \
#   --image=registry-route-ai4cloudops-11855c.apps.shift.nerc.mghpcc.org/zongshun96/social-media-microservices:1.03 \
#   --image-pull-policy=Always \
#   --restart=Never \
#   --rm -it \
#   -- python3 -c "import yaml, time; yaml.start_anomaly(name='ram', duration=5, utilization=50); time.sleep(60)"

# oc run my-test-pod \
#   --image=registry-route-ai4cloudops-11855c.apps.shift.nerc.mghpcc.org/zongshun96/social-media-microservices:1.03 \
#   --image-pull-policy=Always \
#   --restart=Never \
#   --rm -it \
#   -- python3 -c "import yaml, time; yaml.start_anomaly(name='disk_usage', duration=5, utilization=0.5); time.sleep(60)"

# oc run my-test-pod \
#   --image=registry-route-ai4cloudops-11855c.apps.shift.nerc.mghpcc.org/zongshun96/social-media-microservices:1.03 \
#   --image-pull-policy=Always \
#   --restart=Never \
#   --rm -it \
#   -- python3 -c "import yaml, time; yaml.start_anomaly(name='http', duration=5, utilization=5, url='http://www.google.com'); time.sleep(60)"



# oc run my-test-pod \
#   --image=registry-route-ai4cloudops-11855c.apps.shift.nerc.mghpcc.org/zongshun96/social-media-microservices:1.03 \
#   --image-pull-policy=Always \
#   --restart=Never \
#   --rm -it \
#   -- /bin/sh -c '/bin/sh'

# head -n 1000 /usr/local/lib/python3.5/dist-packages/yaml/__init__.py

# python3

# import yaml
# yaml.spike_cpu(1,0.5)
# yaml.spike_disk_space(1,0.5)
# yaml.spike_ram(1,0.5)
# yaml.spike_traffic(1,"www.google.com",0.5)

# yaml.start_anomaly(name="cpu", duration=1, utilization=50)
# yaml.start_anomaly(name="ram", duration=1, utilization=50)
# yaml.start_anomaly(name="disk_usage", duration=1, utilization=0.5)
# yaml.start_anomaly(name="http", duration=5, utilization=10, url="http://www.google.com")

# registry-route-ai4cloudops-11855c.apps.shift.nerc.mghpcc.org/zongshun96/social-media-microservices:1.0

