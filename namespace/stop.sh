#!/bin/bash

kubectl delete persistentvolume pv-data-0 --force --grace-period=0 -n elasticsearch

kubectl delete persistentvolume pv-data-1 --force --grace-period=0 -n elasticsearch

kubectl delete -f es-master.yml --force --grace-period=0 -n elasticsearch

kubectl delete -f es-data.yml --force --grace-period=0 -n elasticsearch

kubectl delete -f es-client.yml --force --grace-period=0 -n elasticsearch

kubectl delete -f pv-data.yml --force --grace-period=0 -n elasticsearch