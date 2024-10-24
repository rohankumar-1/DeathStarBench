#!/bin/bash

cd $(dirname $0)/../..

oc create cm media-frontend-nginx --from-file=media-frontend-config/nginx.conf  -n ai4cloudops-11855c
oc create cm media-frontend-lua   --from-file=media-frontend-config/lua-scripts -n ai4cloudops-11855c
