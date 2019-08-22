#!/bin/bash

kubectl apply -f pv-data.yml

kubectl apply -f es-master.yml

kubectl apply -f es-data.yml

kubectl apply -f es-client.yml