oc run my-test-pod \
  --image=registry-route-ai4cloudops-11855c.apps.shift.nerc.mghpcc.org/zongshun96/social-media-microservices:1.03 \
  --image-pull-policy=Always \
  --restart=Never \
  --rm -it \
  -- python3 -c "import yaml, time; yaml.start_anomaly(name='cpu', duration=5, utilization=50); time.sleep(120)"

sleep 120

oc run my-test-pod \
  --image=registry-route-ai4cloudops-11855c.apps.shift.nerc.mghpcc.org/zongshun96/social-media-microservices:1.03 \
  --image-pull-policy=Always \
  --restart=Never \
  --rm -it \
  -- python3 -c "import yaml, time; yaml.start_anomaly(name='ram', duration=5, utilization=50); time.sleep(120)"

sleep 120

oc run my-test-pod \
  --image=registry-route-ai4cloudops-11855c.apps.shift.nerc.mghpcc.org/zongshun96/social-media-microservices:1.03 \
  --image-pull-policy=Always \
  --restart=Never \
  --rm -it \
  -- python3 -c "import yaml, time; yaml.start_anomaly(name='disk_usage', duration=5, utilization=0.5); time.sleep(120)"

sleep 120

oc run my-test-pod \
  --image=registry-route-ai4cloudops-11855c.apps.shift.nerc.mghpcc.org/zongshun96/social-media-microservices:1.03 \
  --image-pull-policy=Always \
  --restart=Never \
  --rm -it \
  -- python3 -c "import yaml, time; yaml.start_anomaly(name='http', duration=5, utilization=10, url='http://www.google.com'); time.sleep(120)"